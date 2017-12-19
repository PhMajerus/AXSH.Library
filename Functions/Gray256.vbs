'
' OLE Automation helper to convert lightness value to the corresponding 
' OLE Color using the ANSI/VT 256 colors palette.
' This is used to compute colors for use with Majerus.ANSI RGB colors methods.
'

Option Explicit

' Convert from lightness value to a palette-indexed OLE Color.
Function Gray256 (Lightness)
	If Lightness < 0 Or Lightness > 1 Then
		Err.Raise 5, "Gray256 argument error", "Lightness parameter out of range: 0 "&ChrW(&h2264)&" Lightness "&ChrW(&h2264)&" 1"
	End If
	
	Gray256 = CLng(&h01000000 + 232 + Round(Lightness*23))
End Function
