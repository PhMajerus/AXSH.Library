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
		On Error GoTo 0 ' also clears Err
		Err.Raise 429, "ShowHttpHeaders error", "Microsoft Windows HTTP Services are not available"
	ElseIf Err.Number <> 0 Then
		' Propagate unhandled error up the call stack
		Dim EN, ES, ED, EHF, EHC
		EN = Err.Number: ES = Err.Source: ED = Err.Description
		EHF = Err.HelpFile: EHC = Err.HelpContext
		On Error GoTo 0 ' clears Err as a side-effect
		Err.Raise EN, ES, ED, EHF, EHC
	End If
	On Error GoTo 0
	
	' Prepare a synchronous HTTP HEAD request (using HEAD instead of GET to reduce data transfer)
	WHR.Open "HEAD", Url, False
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
