' 
' Retrieve HTTP response headers for a URL and display them as a list.
' 
' - Philippe Majerus, January 2018.
' 

Option Explicit

Sub ShowHttpHeaders(Url)
	If InStr(Url, "://") = 0 Then
		Url = "http://" & Url
	End If
	
	' Use Windows HTTP Services 5.1, an OS component of Windows 2000 SP3 and later.
	Dim WHR
	On Error Resume Next
	Set WHR = CreateObject("WinHttp.WinHttpRequest.5.1")
	If Err.Number = 429 Then ' ActiveX component can't create object
		' Since WinHTTP is an OS component, it should never fail, except on non-Windows OS.
		Err.Clear
		On Error GoTo 0
		Err.Raise 429, "ShowHttpHeaders error", "Microsoft Windows HTTP Services are not available"
	End If
	On Error GoTo 0
	
	' Prepare a synchronous HTTP GET request
	WHR.Open "GET", Url, False
	WHR.SetRequestHeader "User-Agent", "ActiveScript Shell ShowHttpHeaders.vbs"
	
	' Perform request
	WHR.Send
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
