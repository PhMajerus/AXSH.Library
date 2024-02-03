'
' Convert a number from pixels to points.
' Note this assumes 96 DPI screen.
'

Option Explicit

Function PixelsToPoints (Pixels)
	' A point is 1/72 of an inch.
	' Windows at default resolution always assumes the display is 96 DPI.
	' If a scaling factor is used, the resulting value should be scaled accordingly.
	PixelsToPoints = (Pixels*72)/96
End Function
