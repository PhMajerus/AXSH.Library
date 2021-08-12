'
' Simple "hello world" function
' 
' This function outputs Unicode characters that require Consolas or
' Cascadia Mono to render properly. Lucida Console will show rectangles.
' Any resemblance to an existing character is purely coincidental.
'

Option Explicit

Sub Hello
	Dim CSI
	CSI = Chr(27)&"["
	AXSH.Echo vbCrLf&"  "&CSI&"37m"&ChrW(&h039B)&CSI&"91mc"&ChrW(&h00F4)&ChrW(&h0254)&CSI&"m   ,-----------."&vbCrLf&" "&CSI&"37;4;9m("&CSI&"29;24m'"&CSI&"33m"&ChrW(&h2022)&CSI&"37m'"&CSI&"4;9m)"&CSI&"29;24;37m9"&CSI&"m <   "&CSI&"3mHello to"&CSI&"23m  \"&vbCrLf&" "&CSI&"37m"&ChrW(&h00F3)&CSI&"91;4m/"&ChrW(&h1D41)&"\"&CSI&"24;37m"&ChrW(&h00B4)&CSI&"m   \  "&CSI&"3myou too!"&CSI&"23m  /"&vbCrLf&"  "&CSI&"37m"&ChrW(&h2570)&ChrW(&h2534)&ChrW(&h256F)&CSI&"m     `----------"&ChrW(&h00B4)
End Sub
