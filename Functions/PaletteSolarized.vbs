'
' Change the console palette to the Solarized palette designed by Ethan Schoonover
' Solarized is a palette that does not respect the console and ANSI
' palettes, but provides replacement monotones and accent colors
' that reduces contrasting brightness while preserving contrasting
' hues, making text more comfortable to read.
'
' Credits: Ethan Schoonover (http://ethanschoonover.com/solarized)
'
'  - Philippe Majerus

Option Explicit

Sub PaletteSolarized
	Dim ConHost, ColorsPalette(15)
	Set ConHost = CreateObject("Majerus.Console")
	ColorsPalette(0) =	RGB(7,54,66)		' base02 (black)
	ColorsPalette(1) =	RGB(38,139,210)		' blue (blue)
	ColorsPalette(2) =	RGB(133,153,0)		' green (green)
	ColorsPalette(3) =	RGB(42,161,152)		' cyan (cyan)
	ColorsPalette(4) =	RGB(220,50,47)		' red (red)
	ColorsPalette(5) =	RGB(211,54,130)		' magenta (magenta)
	ColorsPalette(6) =	RGB(181,137,0)		' yellow (yellow)
	ColorsPalette(7) =	RGB(238,232,213)	' base2 (white)
	ColorsPalette(8) =	RGB(0,43,54)		' base03 (brblack)
	ColorsPalette(9) =	RGB(131,148,150)	' base0 (brblue)
	ColorsPalette(10) =	RGB(88,110,117)		' base01 (brgreen)
	ColorsPalette(11) =	RGB(147,161,161)	' base1 (brcyan)
	ColorsPalette(12) =	RGB(203,75,22)		' orange (brred)
	ColorsPalette(13) =	RGB(108,113,196)	' violet (brmagenta)
	ColorsPalette(14) =	RGB(101,123,131)	' base00 (bryellow)
	ColorsPalette(15) =	RGB(253,246,227)	' base3 (brwhite)
	ConHost.Colors.Items = ColorsPalette
End Sub
