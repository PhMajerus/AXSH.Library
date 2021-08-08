'
' A novelty prompt featuring a cute cat with a red bow.
' Any similarity to a well known character is purely coincidental.
' 
' This prompt requires Consolas, Cascadia Mono, or another font with Unicode
' characters. Lucida Console does not contain all the characters required to
' display it.
' 
' Use by assigning to the Prompt variable as follows:
'   Dim Prompt: Call CuteCatPrompt: Set Prompt = GetRef("CuteCatPrompt")
' or by declaring a Prompt function using it as follows:
'   Function Prompt: Prompt = CuteCatPrompt: End Function
'

Option Explicit

Function CuteCatPrompt
	Dim CSI
	CSI = Chr(27)&"["
	CuteCatPrompt = vbCrLf & _
		" "&CSI&"37m"&ChrW(&h039B)&CSI&"91mc"&ChrW(&h00F4)&ChrW(&h0254)&CSI&"m" & vbCrLf & _
		CSI&"37;4;9m("&CSI&"29;24m'"&CSI&"33m"&ChrW(&h2022)&CSI&"37m'"&CSI&"4;9m)"&CSI&"m  " & AXSH.Location.Path & vbCrLf & _
		CSI&"91;4m/"&ChrW(&h203E)&ChrW(&h1D41)&ChrW(&h203E)&"\"&CSI&"m  > "
End Function
