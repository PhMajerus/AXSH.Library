' OLE Automation helper to convert a number from pixels
' to OLE Size (himetrics).
' Note this assumes 96 DPI screen.

Option Explicit

' Convert from pixels at default 96DPI density to OLE Size (himetrics).
Function PixelsToHimetrics(Pixels)
	PixelsToHimetrics = Round(Pixels*2540/96)
End Function
