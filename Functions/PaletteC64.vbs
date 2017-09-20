'
' Change the console palette to the standard colors as used by CGA
' and matching default 16-colors palette used by EGA and VGA.
'
'  - Philippe Majerus

Option Explicit

Sub PaletteC64
	Dim ConHost, ColorsPalette(15)
	Set ConHost = CreateObject("Majerus.Console")
	ColorsPalette(0)  = &h000000 ' 0 black
	ColorsPalette(1)  = &h792835 ' 6 dark blue
	ColorsPalette(2)  = &h438D58 ' 5 dark green
	ColorsPalette(3)  = &h003943 ' 9 dark brown (dark cyan)
	ColorsPalette(4)  = &h2B3768 ' 2 dark red
	ColorsPalette(5)  = &h863D6F ' 4 dark magenta
	ColorsPalette(6)  = &h254F6F ' 8 light brown (dark yellow)
	ColorsPalette(7)  = &h959595 ' F light gray
	ColorsPalette(8)  = &h444444 ' B dark gray
	ColorsPalette(9)  = &hB55E6C ' E bright blue
	ColorsPalette(10) = &h84D29A ' D bright green
	ColorsPalette(11) = &hB2A470 ' 3 bright cyan
	ColorsPalette(12) = &h59679A ' A bright red
	ColorsPalette(13) = &h6C6C6C ' C mid gray (bright magenta)
	ColorsPalette(14) = &h6FC7B8 ' 7 bright yellow
	ColorsPalette(15) = &hFFFFFF ' 1 white
	ConHost.Colors.Items = ColorsPalette
End Sub
