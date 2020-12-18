'
' Returns a horizontal bar showing the value as a bars graph,
' simulating the style of green LED gauge bars with gaps.
' 
' The only Windows built-in app that used such a control was the original
' Windows NT Task Manager from NT4 to 7 to show CPU Usage and Memory.
' (It was a custom control for that app only)
'

Option Explicit

Function GetLEDGaugeBar (Value, Maximum, Width)
	Dim W, P
	
	If Value < 0 Or Value > Maximum Then
		Err.Raise 5, , "Value must be between 0 and Maximum"
	End If
	If Maximum < 0 Then
		Err.Raise 5, , "Maximum must be a positive number"
	End If
	If Width < 0 Then
		Err.Raise 5, , "Width must be a positive number"
	End If
	
	W = Int(Width)
	If Maximum = 0 Then
		P = 0
	Else
		P = Int((Value/Maximum)*W +0.5)
	End If
	
	GetLEDGaugeBar = Chr(27)&"[38;5;77m" & String(P,ChrW(&h258C)) & Chr(27)&"[38;5;22m" & String(W-P, ChrW(&h258C)) & Chr(27)&"[m"
End Function
