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
' 
' Note this only handles HTTP redirection, it does not process HTML <meta>
' or JavaScript-based redirections.
'

Option Explicit

Function GetTargetURL (Url)
	Const WinHttpRequestOption_EnableRedirects = 6
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
			Err.Raise 429, "Curl error", "Microsoft Windows HTTP Services are not available"
		Else
			.RaiseAgain
		End If
	End With
	
	' Follow redirections until we get the actual document (status 200)
	Do
		' To receive redirections, we must disable their automatic processing by WinHttpRequest.
		WHR.Option(WinHttpRequestOption_EnableRedirects) = False
		' Prepare a synchronous HTTP HEAD request (using HEAD instead of GET to reduce data transfer)
		WHR.Open "HEAD", Url, False
		WHR.SetRequestHeader "User-Agent", "ActiveScript Shell GetTargetURL.vbs"
		WHR.SetRequestHeader "Accept-Charset", "utf-8, iso-8859-1;q=0.5"
		
		' If redirection depends on client language, prefer US English
		'WHR.SetRequestHeader "Accept-Language", "en-US,en;q=0.5"
		
		' Perform request
		WHR.Send
		If WHR.Status = 405 Then
			' Method not allowed - some HTTP servers refuse the HEAD request
			' Simply perform a full GET request, not as efficient, but should
			' always work.
			WHR.Open "GET", Url, False
			WHR.Send
		End If
		
		Select Case WHR.Status
			Case 200 ' OK
				' Found the document, don't do anything, we'll get out of the loop
			Case 301, 302, 303, 307, 308
				' Redirected
				With New Try: On Error Resume Next
					Url = WHR.GetResponseHeader("Location")
				.Catch: On Error GoTo 0
					If .Number = -2147012746 Then ' The requested header was not found
						Err.Raise vbObjectError+2, "Request to '"&NextUrl&"' got redirected, but target location is missing."
					Else
						.RaiseAgain
					End If
				End With
			Case Else ' Other responses are handled as errors
				Err.Raise vbObjectError+1, "HTTP error ", CStr(WHR.Status) & " " & WHR.StatusText
		End Select
	Loop While WHR.Status <> 200
	
	GetTargetURL = Url
End Function
