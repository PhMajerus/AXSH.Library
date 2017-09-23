'
' Change the console palette to the standard Dark+ palette used in Visual Studio Code.
' A less contrasted than PaletteModern, without any hard black or white.
'
'  - Philippe Majerus

Option Explicit

Sub PaletteVSCode
	Dim ConHost, ColorsPalette(15)
	Set ConHost = CreateObject("Majerus.Console")
	ColorsPalette(0) =	RGB(30,30,30)		' black
	ColorsPalette(1) =	RGB(36,114,200)		' dark blue
	ColorsPalette(2) =	RGB(13,188,121)		' dark green
	ColorsPalette(3) =	RGB(17,168,205)		' dark cyan
	ColorsPalette(4) =	RGB(205,49,49)		' dark red
	ColorsPalette(5) =	RGB(188,63,188)		' dark magenta
	ColorsPalette(6) =	RGB(229,229,16)		' dark yellow
	ColorsPalette(7) =	RGB(204,204,204)	' light gray
	ColorsPalette(8) =	RGB(102,102,102)	' dark gray
	ColorsPalette(9) =	RGB(59,142,234)		' bright blue
	ColorsPalette(10) =	RGB(35,209,139)		' bright green
	ColorsPalette(11) =	RGB(41,184,219)		' bright cyan
	ColorsPalette(12) =	RGB(241,76,76)		' bright red
	ColorsPalette(13) =	RGB(214,112,214)	' bright magenta
	ColorsPalette(14) =	RGB(245,245,67)		' bright yellow
	ColorsPalette(15) =	RGB(229,229,229)	' white
	ConHost.Colors.Items = ColorsPalette
End Sub
