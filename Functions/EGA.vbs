'
' Returns the RGB OLEColor for an EGA palette color index.
'

Option Explicit

Function EGA (Index)
	Dim R,G,B
	If Index < 0 Or Index > 63 Then
		Err.Raise 5, , "Index must be between 0 and 63."
	End If
	
	R = (((Index\2) And 2)+((Index\32) And 1)) * 85
	G = ((Index And 2)+((Index\16) And 1)) * 85
	B = (((Index*2) And 2)+((Index\8) And 1)) * 85
	EGA = RGB(R, G, B)
End Function
