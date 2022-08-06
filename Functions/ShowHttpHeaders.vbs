' 
' Retrieve HTTP response headers for a URL and display them as a list.
' 

Option Explicit

Sub ShowHttpHeaders(Url)
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
	
	' Prepare a synchronous HTTP HEAD request (using HEAD instead of GET to reduce data transfer)
	WHR.Open "HEAD", Url, False
	WHR.SetRequestHeader "User-Agent", "ActiveScript Shell ShowHttpHeaders.vbs"
	WHR.SetRequestHeader "Accept-Charset", "utf-8, iso-8859-1;q=0.5"
	
	' Perform request
	WHR.Send
	If WHR.Status = 405 Then
		' Method not allowed - some HTTP servers refuse the HEAD request
		' Simply perform a full GET request, not as efficient, but should
		' always work.
		WHR.Open "GET", Url, False
		WHR.SetRequestHeader "User-Agent", "ActiveScript Shell ShowHttpHeaders.vbs"
		WHR.SetRequestHeader "Accept-Charset", "utf-8, iso-8859-1;q=0.5"
		WHR.Send
	End If
	If WHR.Status <> 200 Then
		Err.Raise vbObjectError+1, "ShowHttpHeaders error", CStr(WHR.Status) & " " & WHR.StatusText
	End If
	
	' Process headers
	Dim Headers, I, Header, ISep, Name, Value
	Headers = Split(WHR.GetAllResponseHeaders(), vbCrLf)
	For I = LBound(Headers) To UBound(Headers)
		Header = Headers(I)
		If Len(Header) > 0 Then
			ISep = InStr(Header,":")
			If ISep <> 0 Then
				Name = Left(Header,ISep-1)
				If Mid(Header, ISep+1, 1) = " " Then
					ISep = ISep + 1
				End If
				Value = Mid(Header, ISep+1)
			Else
				Name = Header
				Value = Empty
			End If
			
			If Not IsEmpty(Value) Then
				AXSH.Echo Chr(27)&"[93m" & Name & Chr(27)&"[33m: " & Chr(27)&"[37m" & Value & Chr(27)&"[m"
			Else
				AXSH.Echo Chr(27)&"[93m" & Name & Chr(27)&"[33m: " & Chr(27)&"[90mN/A" & Chr(27)&"[m"
			End If
		End If
	Next
End Sub
