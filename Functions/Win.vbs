'
' An ANSI-art version of the "Congratulations, You Won!" meme
' 
' Back when Microsoft Windows was a GUI on top of MS-DOS, it was launched
' using the "WIN" command.
' This function just makes fun of that 1985-1995 decade by showing a
' version of one of the first fraudulent pop-up ads on the Web that has
' been so widespread that it got famous.
'

Option Explicit

Sub Win
	Dim CSI
	CSI = Chr(27)&"["
	AXSH.Echo vbCrLf& _
		" "&CSI&"90m"&ChrW(&h250C)&String(31,ChrW(&h2500))&ChrW(&h2510)&CSI&"m"&vbCrLf& _
		" "&CSI&"90m"&ChrW(&h2502)&" "&CSI&"91;1;5mWINNER!    WINNER!    WINNER!"&CSI&"0;90m "&ChrW(&h2502)&CSI&"m"&vbCrLf& _
		" "&CSI&"90m"&ChrW(&h2502)&Space(31)&ChrW(&h2502)&CSI&"m"&vbCrLf& _
		" "&CSI&"90m"&ChrW(&h2502)&" "&CSI&"m  Congratulations, you WON!  "&CSI&"90m "&ChrW(&h2502)&CSI&"m"&vbCrLf& _
		" "&CSI&"90m"&ChrW(&h2502)&" "&CSI&"mYou are the 1,000,000th user!"&CSI&"90m "&ChrW(&h2502)&CSI&"m"&vbCrLf& _
		" "&CSI&"90m"&ChrW(&h2502)&"  "&CSI&"32mc"&ChrW(&h03A9)&ChrW(&h0254)&Space(21)&CSI&"35mc"&ChrW(&h03A9)&ChrW(&h0254)&" "&CSI&"90m "&ChrW(&h2502)&CSI&"m"&vbCrLf& _
		" "&CSI&"90m"&ChrW(&h2502)&" "&CSI&"41;32m"&String(2,ChrW(&h2550))&ChrW(&h256C)&String(2,ChrW(&h2550))&CSI&"0;5m Claim your prize! "&CSI&"0;46;35m"&String(2,ChrW(&h2550))&ChrW(&h256C)&String(2,ChrW(&h2550))&CSI&"0;90m "&ChrW(&h2502)&CSI&"m"&vbCrLf& _
		" "&CSI&"90m"&ChrW(&h2502)&Space(31)&ChrW(&h2502)&CSI&"m"&vbCrLf& _
		" "&CSI&"90m"&ChrW(&h2514)&String(31,ChrW(&h2500))&ChrW(&h2518)&CSI&"m"
End Sub
