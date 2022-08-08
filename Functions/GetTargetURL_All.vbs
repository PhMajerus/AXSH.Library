'
' Get a list of URL redirections to the final target URL of a document or resource.
' 
' See GetTargetURL function for general information and faster function if
' you only need the final target URL.
' 
' Instead of the final target returned by GetTargetURL, this version returns
' an array of all redirections until the final destination.
' For example:
' ?GetTargetURL_All("microsoft.com")
' returns ("http://microsoft.com","https://www.microsoft.com/","https://www.microsoft.com/en-us/")
'     (or other localization according to your location)
'

Option Explicit

Function GetTargetURL_All (Url)
	Const WinHttpRequestOption_EnableRedirects = 6
	Dim WHR, Urls(), UB
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
	
	' To receive redirections, we must disable their automatic processing by WinHttpRequest.
	WHR.Option(WinHttpRequestOption_EnableRedirects) = False
	
	' Follow redirections until we get the actual document (status 200)
	UB = -1
	ReDim Urls(UB)
	Do While True
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
			WHR.SetRequestHeader "User-Agent", "ActiveScript Shell GetTargetURL.vbs"
			WHR.SetRequestHeader "Accept-Charset", "utf-8, iso-8859-1;q=0.5"
			' If redirection depends on client language, prefer US English
			'WHR.SetRequestHeader "Accept-Language", "en-US,en;q=0.5"
			WHR.Send
		End If
		
		Select Case WHR.Status
			Case 200 ' OK
				' Found the document
				UB = UB + 1
				ReDim Preserve Urls(UB)
				Urls(UB) = Url
				Exit Do
				
			Case 301, 302, 303, 307, 308
				' Redirected
				' Store the current url first
				UB = UB + 1
				ReDim Preserve Urls(UB)
				Urls(UB) = Url
				' Then update url according to redirection
				With New Try: On Error Resume Next
					Url = WHR.GetResponseHeader("Location")
				.Catch: On Error GoTo 0
					If .Number = -2147012746 Then ' The requested header was not found
						Err.Raise vbObjectError+2, "Request to '" & Url & "' got redirected, but target location is missing."
					Else
						.RaiseAgain
					End If
				End With
				
			Case Else
				' Other responses are handled as errors
				Err.Raise vbObjectError+1, "HTTP error ", CStr(WHR.Status) & " " & WHR.StatusText
		End Select
	Loop
	
	GetTargetURL_All = Urls
End Function
