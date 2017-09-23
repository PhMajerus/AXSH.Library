'
' Change the console palette to colors from the C=64 colors palette,
' while trying to keep colors indexes similar.
'
'  - Philippe Majerus

Option Explicit

Sub PaletteC64
	Dim ConHost, ColorsPalette(15)
	Set ConHost = CreateObject("Majerus.Console")
	ColorsPalette(0) =	RGB(0,0,0)		' 0 black
	ColorsPalette(1) =	RGB(53,40,121)		' 6 dark blue
	ColorsPalette(2) =	RGB(88,141,67)		' 5 dark green
	ColorsPalette(3) =	RGB(67,57,0)		' dark brown (dark cyan)
	ColorsPalette(4) =	RGB(104,55,43)		' 2 dark red
	ColorsPalette(5) =	RGB(111,61,134)		' 4 dark magenta
	ColorsPalette(6) =	RGB(111,79,37)		' 8 light brown (dark yellow)
	ColorsPalette(7) =	RGB(149,149,149)	' F light gray
	ColorsPalette(8) =	RGB(68,68,68)		' B dark gray
	ColorsPalette(9) =	RGB(108,94,181)		' E bright blue
	ColorsPalette(10) =	RGB(154,210,132)	' D bright green
	ColorsPalette(11) =	RGB(112,164,178)	' 3 bright cyan
	ColorsPalette(12) =	RGB(154,103,89)		' A bright red
	ColorsPalette(13) =	RGB(108,108,108)	' C mid gray (bright magenta)
	ColorsPalette(14) =	RGB(184,199,111)	' 7 bright yellow
	ColorsPalette(15) =	RGB(255,255,255)	' 1 white
	ConHost.Colors.Items = ColorsPalette
End Sub
