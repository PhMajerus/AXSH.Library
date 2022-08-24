'
' Retrieve the current date and time from HTTP response headers for a URL.
' Note this converts the response date and time from UTC to local time.
' 
' Example usage:
' ShowDateTime GetWebServerDate("www.example.com")
' ' Checking if Web server and local time are out of sync by over 2 seconds.
' ?(Abs(Now-GetWebServerDate("www.example.com")) > #00:00:02#)
'

Option Explicit

Function GetWebServerDate(Url)
	Dim EN, ES, ED, EHF, EHC
	Dim WHR, ResponseDate
	Const HTTPREQUEST_PROXYSETTING_DIRECT = 1
	
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
	
	' Make sure we don't use a proxy to avoid cache, even if one is set in the registry.
	WHR.SetProxy HTTPREQUEST_PROXYSETTING_DIRECT
	
	' Prepare a synchronous HTTP HEAD request (using HEAD instead of GET to reduce data transfer)
	WHR.Open "HEAD", Url, False
	WHR.SetRequestHeader "User-Agent", "ActiveScript Shell GetWebServerDate.vbs"
	WHR.SetRequestHeader "Accept-Charset", "utf-8, iso-8859-1;q=0.5"
	
	' Perform request
	WHR.Send
	If WHR.Status = 405 Then
		' Method not allowed - some HTTP servers refuse the HEAD request
		' Simply perform a full GET request, not as efficient, but should
		' always work.
		WHR.Open "GET", Url, False
		WHR.SetRequestHeader "User-Agent", "ActiveScript Shell GetWebServerDate.vbs"
		WHR.SetRequestHeader "Accept-Charset", "utf-8, iso-8859-1;q=0.5"
		WHR.Send
	End If
	If WHR.Status <> 200 Then
		Err.Raise vbObjectError+1, "GetWebServerDate error", CStr(WHR.Status) & " " & WHR.StatusText
	End If
	
	' Process header
	With New Try: On Error Resume Next
		ResponseDate = WHR.GetResponseHeader("Date")
	.Catch: On Error GoTo 0
		If .Number = -2147012746 Then ' The requested header was not found
			Err.Raise vbObjectError+2, "GetWebServerDate error", "The web server did not provide its current time"
		Else
			.RaiseAgain
		End If
	End With
	
	GetWebServerDate = Dates.FromUTCString(ResponseDate)
End Function
