'
' Change the console palette to the original Windows conhost palette.
' (The standard Windows console palette finally changed in Windows 10 Ver. 1710)
'
'  - Philippe Majerus

Option Explicit

Sub PaletteLegacy
	Dim ConHost, ColorsPalette(15)
	Set ConHost = CreateObject("Majerus.Console")
	ColorsPalette(0) =	RGB(0,0,0)		' black
	ColorsPalette(1) =	RGB(0,0,128)		' dark blue
	ColorsPalette(2) =	RGB(0,128,0)		' dark green
	ColorsPalette(3) =	RGB(0,128,128)		' dark cyan
	ColorsPalette(4) =	RGB(128,0,0)		' dark red
	ColorsPalette(5) =	RGB(128,0,128)		' dark magenta
	ColorsPalette(6) =	RGB(128,128,0)		' dark yellow
	ColorsPalette(7) =	RGB(192,192,192)	' light gray
	ColorsPalette(8) =	RGB(128,128,128)	' dark gray
	ColorsPalette(9) =	RGB(0,0,255)		' bright blue
	ColorsPalette(10) =	RGB(0,255,0)		' bright green
	ColorsPalette(11) =	RGB(0,255,255)		' bright cyan
	ColorsPalette(12) =	RGB(255,0,0)		' bright red
	ColorsPalette(13) =	RGB(255,0,255)		' bright magenta
	ColorsPalette(14) =	RGB(255,255,0)		' bright yellow
	ColorsPalette(15) =	RGB(255,255,255)	' white
	ConHost.Colors.Items = ColorsPalette
End Sub
