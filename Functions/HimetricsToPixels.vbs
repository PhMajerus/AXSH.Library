' OLE Automation helper to convert a number from OLE Size
' (himetrics) to pixels.
' Note this assumes 96 DPI screen.

Option Explicit

' Convert from OLE Size (himetrics) to pixels at default 96DPI density.
Function HimetricsToPixels(Size)
	HimetricsToPixels = Round(Size*96/2540)
End Function
