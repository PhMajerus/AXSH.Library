'
' Returns the RGB OLEColor for an EGA color index.
' 
' Based on the original hardware colors of the IBM Enhanced Graphics
' Adapter card, as well as the EGA monitor signals, which used 2 bits per
' RGB channel. It isn't technically a palette, as these were the 64 colors
' the hardware was capable of producing, but the text and graphics modes
' were limited to 16 simultaneous colors.
'

Option Explicit

Function EGAColor (Index)
	Dim R,G,B
	If Index < 0 Or Index > 63 Then
		Err.Raise 5, , "Index must be between 0 and 63."
	End If
	
	R = (((Index\2) And 2)+((Index\32) And 1)) * 85
	G = ((Index And 2)+((Index\16) And 1)) * 85
	B = (((Index*2) And 2)+((Index\8) And 1)) * 85
	EGAColor = RGB(R, G, B)
End Function
