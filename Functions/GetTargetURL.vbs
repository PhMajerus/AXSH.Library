'
' Get the final target URL of a document or resource.
' 
' URL shortener services, and more generally, resources redirections,
' means a known URL might not be the actual URL of the resource it refers
' to. It may even be on a different server altogether. This can make it
' difficult to know at first glance where the document actually resides,
' and can induce the user in error when used maliciously to hide the final
' destination.
' 
' This function follows the redirections until it gets the actual document
' and return the final URL.
' It returns the url as it if is hasn't been redirected.
' For example:
' ?GetTargetURL("microsoft.com") ' returns "https://www.microsoft.com/en-us/"
'     (or other localization according to your location)
' 
' Note this function only handles HTTP redirections, it does not process HTML
' <meta> or JavaScript-based redirections.
'

Option Explicit

Function GetTargetURL (Url)
	Const WinHttpRequestOption_URL = 1
	Dim WHR
	If InStr(Url, "://") = 0 Then
		Url = "http://" & Url
	End If
	
	' Use Windows HTTP Services 5.1, an OS component of Windows 2000 SP3 and later.
	With New Try: On Error Resume Next
		Set WHR = CreateObject("WinHttp.WinHttpRequest.5.1")
	.Catch: On Error GoTo 0
		If .Number = 429 Then ' ActiveX component can't create object
			' Since WinHTTP is an OS component, it should never fail, except on non-Windows OS or in safe-for-scripting mode.
			Err.Raise 429, , "Microsoft Windows HTTP Services are not available"
		Else
			.RaiseAgain
		End If
	End With
	
	' Prepare a synchronous HTTP HEAD request (using HEAD instead of GET to reduce data transfer)
	WHR.Open "HEAD", Url, False
	WHR.SetRequestHeader "User-Agent", "ActiveScript Shell GetTargetURL.vbs"
	WHR.SetRequestHeader "Accept-Charset", "utf-8, iso-8859-1;q=0.5"
	' If redirection depends on client language, prefer US English
	'WHR.SetRequestHeader "Accept-Language", "en-US,en;q=0.5"
	
	' Perform request
	WHR.Send
	
	' Handle servers that do not accept HEAD requests
	If WHR.Status = 405 Then
		' Method not allowed - some HTTP servers refuse the HEAD request
		' Simply perform a full GET request, not as efficient, but should
		' always work.
		WHR.Open "GET", Url, False
		WHR.SetRequestHeader "User-Agent", "ActiveScript Shell GetTargetURL.vbs"
		WHR.SetRequestHeader "Accept-Charset", "utf-8, iso-8859-1;q=0.5"
		' If redirection depends on client language, prefer US English
		'WHR.SetRequestHeader "Accept-Language", "en-US,en;q=0.5"
		WHR.Send
	End If
	
	' Check for failure
	If WHR.Status <> 200 Then
		Err.Raise vbObjectError+1, "HTTP error ", CStr(WHR.Status) & " " & WHR.StatusText
	End If
	
	GetTargetURL = WHR.Option(WinHttpRequestOption_URL)
End Function
