'
' Change the console palette to a more balanced and less contrasted palette,
' similar to the palettes found in many Unix and GNU terminals.
'
'  - Philippe Majerus

Option Explicit

Sub PaletteModern
	Dim ConHost, ColorsPalette(15)
	Set ConHost = CreateObject("Majerus.Console")
	ColorsPalette(0) =	RGB(0,0,0)		' black
	ColorsPalette(1) =	RGB(0,0,187)		' dark blue
	ColorsPalette(2) =	RGB(0,187,0)		' dark green
	ColorsPalette(3) =	RGB(0,187,187)		' dark cyan
	ColorsPalette(4) =	RGB(187,0,0)		' dark red
	ColorsPalette(5) =	RGB(187,0,187)		' dark magenta
	ColorsPalette(6) =	RGB(187,187,0)		' dark yellow
	ColorsPalette(7) =	RGB(187,187,187)	' light gray
	ColorsPalette(8) =	RGB(127,127,127)	' dark gray
	ColorsPalette(9) =	RGB(92,92,255)		' bright blue
	ColorsPalette(10) =	RGB(0,252,0)		' bright green
	ColorsPalette(11) =	RGB(0,255,255)		' bright cyan
	ColorsPalette(12) =	RGB(252,0,0)		' bright red
	ColorsPalette(13) =	RGB(255,0,255)		' bright magenta
	ColorsPalette(14) =	RGB(255,255,0)		' bright yellow
	ColorsPalette(15) =	RGB(255,255,255)	' white
	ConHost.Colors.Items = ColorsPalette
End Sub
