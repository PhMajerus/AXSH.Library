' This function provides an uncommon OLE Color variant type which, instead of
' representing an RGB color, represents an index in a palette.
' This is supported in "Majerus.ANSI" ForeColorRGB, BackColorRGB and ColorsRGB
' methods to specify 256 colors VT codes.


Option Explicit


' Return a whole number representing a palette index between 0 and 255.
Function PalColor (Index)
	If Index < 0 Or Index > 255 Then
		Err.Raise 5
	End If
	PalColor = CLng(&h01000000 + Index)
End Function
