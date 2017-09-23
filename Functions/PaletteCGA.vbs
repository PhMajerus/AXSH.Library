'
' Change the console palette to the standard colors as used by CGA
' and matching default 16-colors palette used by EGA and VGA.
'
'  - Philippe Majerus

Option Explicit

Sub PaletteCGA
	Dim ConHost, ColorsPalette(15)
	Set ConHost = CreateObject("Majerus.Console")
	ColorsPalette(0) =	RGB(0,0,0)		' black
	ColorsPalette(1) =	RGB(0,0,170)		' dark blue
	ColorsPalette(2) =	RGB(0,170,0)		' dark green
	ColorsPalette(3) =	RGB(0,170,170)		' dark cyan
	ColorsPalette(4) =	RGB(170,0,0)		' dark red
	ColorsPalette(5) =	RGB(170,0,170)		' dark magenta
	ColorsPalette(6) =	RGB(170,85,0)		' brown
	ColorsPalette(7) =	RGB(170,170,170)	' light gray
	ColorsPalette(8) =	RGB(85,85,85)		' dark gray
	ColorsPalette(9) =	RGB(85,85,255)		' bright blue
	ColorsPalette(10) =	RGB(85,255,85)		' bright green
	ColorsPalette(11) =	RGB(85,255,255)		' bright cyan
	ColorsPalette(12) =	RGB(255,85,85)		' bright red
	ColorsPalette(13) =	RGB(255,85,255)		' bright magenta
	ColorsPalette(14) =	RGB(255,255,85)		' bright yellow
	ColorsPalette(15) =	RGB(255,255,255)	' white
	ConHost.Colors.Items = ColorsPalette
End Sub
