'
' Retrieves your public IP address by querying an online IP echo service.
' 
' The IP address is returned as a string, but can easily be parsed to a Long:
' MyIP = ParseIPv4Address(getPublicIP())
' ?FormatIPv4Address(MyIP)
'

Option Explicit

Function GetPublicIP
	Dim URLs, WHR, UB, L, R, I
	Const HTTPREQUEST_PROXYSETTING_DIRECT = 1
	Const WinHttpRequestOption_UserAgentString = 0
	
	' URLs of services providing echos of your public IP address as plain text.
	URLs = Array( _
		"https://api.ipify.org", _
		"https://ipaddress.sh", _
		"https://ifconfig.me", _
		"https://ifconfig.io", _
		"https://ipinfo.io/ip", _
		"https://ipecho.net/plain")
	
	' Use Windows HTTP Services 5.1, an OS component of Windows 2000 SP3 and later.
	With New Try: On Error Resume Next
		Set WHR = CreateObject("WinHttp.WinHttpRequest.5.1")
	.Catch: On Error GoTo 0
		If .Number = 429 Then ' ActiveX component can't create object
			' Since WinHTTP is an OS component, it should never fail, except on non-Windows OS or in safe-for-scripting mode.
			Err.Raise 429, , "Microsoft Windows HTTP Services are not available"
		Else
			.ReThrow
		End If
	End With
	
	' Set Direct access (no proxy server) mode, accessing URLs directly even if a WinHTTP proxy has been set.
	' This ensures we get the public IP address for this machine, not the public IP of some proxy server.
	WHR.SetProxy HTTPREQUEST_PROXYSETTING_DIRECT
	' Some services only return the IP as plain-text if curl utility is detected as the client.
	WHR.Option(WinHttpRequestOption_UserAgentString) = "curl/7.12.0"
	' Set shorter timeouts, as we expect the request to be processed quickly or move on to next URL.
	WHR.SetTimeouts 0, 2000, 1000, 1000
	
	UB = UBound(URLs)
	L = UB+1
	' Start with a random service from the list.
	R = Int(Rnd()*L)
	For I = 0 To UB
		WHR.Open "GET", URLs((I+R) Mod L), False
		WHR.SetRequestHeader "Accept", "text/plain, */*;q=0.5"
		On Error Resume Next
		WHR.Send
		If Err.Number = 0 Then
			If WHR.Status = 200 Then
				' Got the IP, trim any leading and trailing space,
				' like Trim function does, but also newlines.
				With New RegExp
					.Pattern = "^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$"
					.Global = True
					GetPublicIP = .Replace(WHR.ResponseText, vbNullString)
				End With
				' Early return
				Exit Function
			End If
		End If
		On Error GoTo 0
	Next
	
	' None of the services succeeded.
	Err.Raise vbObjectError+1, , "Retrieving public IP address failed"
End Function
