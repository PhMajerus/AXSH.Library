'
' Change the console palette to the light background version of
' the Solarized palette designed by Ethan Schoonover.
' This does not respect the console and ANSI palette, but instead
' reverses background tones and content tones so existing scripts
' designed for light content on dark background automatically
' show as light background. Accent colors are left intact.
'
' Credits: Ethan Schoonover (http://ethanschoonover.com/solarized)
'
'  - Philippe Majerus

Option Explicit

Sub PaletteSolarizedLight
	Dim ConHost, ColorsPalette(15)
	Set ConHost = CreateObject("Majerus.Console")
	ColorsPalette(0) =	RGB(238,232,213)	' base2 (black)
	ColorsPalette(1) =	RGB(38,139,210)		' blue (blue)
	ColorsPalette(2) =	RGB(133,153,0)		' green (green)
	ColorsPalette(3) =	RGB(42,161,152)		' cyan (cyan)
	ColorsPalette(4) =	RGB(220,50,47)		' red (red)
	ColorsPalette(5) =	RGB(211,54,130)		' magenta (magenta)
	ColorsPalette(6) =	RGB(181,137,0)		' yellow (yellow)
	ColorsPalette(7) =	RGB(7,54,66)		' base02 (white)
	ColorsPalette(8) =	RGB(253,246,227)	' base3 (brblack)
	ColorsPalette(9) =	RGB(101,123,131)	' base00 (brblue)
	ColorsPalette(10) =	RGB(147,161,161)	' base1 (brgreen)
	ColorsPalette(11) =	RGB(88,110,117)		' base01 (brcyan)
	ColorsPalette(12) =	RGB(203,75,22)		' orange (brred)
	ColorsPalette(13) =	RGB(108,113,196)	' violet (brmagenta)
	ColorsPalette(14) =	RGB(131,148,150)	' base0 (bryellow)
	ColorsPalette(15) =	RGB(0,43,54)		' base03 (brwhite)
	ConHost.Colors.Items = ColorsPalette
End Sub
