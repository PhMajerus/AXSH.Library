' 
' Palette module for AXSH.
' Provides methods to easily change the console palette
' - Philippe Majerus
'


Option Explicit


' Change the console palette to a more balanced and less contrasted palette,
' while keeping enough contrast for ANSI-art.
' This is the default ActiveScript Shell palette.
Sub Standard
	Dim ConHost, ColorsPalette(15)
	Set ConHost = CreateObject("Majerus.Console")
	ColorsPalette(0) =	RGB(13,13,13)		' black
	ColorsPalette(1) =	RGB(15,15,138)		' dark blue
	ColorsPalette(2) =	RGB(15,138,15)		' dark green
	ColorsPalette(3) =	RGB(15,138,138)		' dark cyan
	ColorsPalette(4) =	RGB(138,15,15)		' dark red
	ColorsPalette(5) =	RGB(138,15,138)		' dark magenta
	ColorsPalette(6) =	RGB(138,138,15)		' dark yellow
	ColorsPalette(7) =	RGB(179,179,179)	' light gray
	ColorsPalette(8) =	RGB(84,84,84)		' dark gray
	ColorsPalette(9) =	RGB(82,82,224)		' bright blue
	ColorsPalette(10) =	RGB(82,224,82)		' bright green
	ColorsPalette(11) =	RGB(82,224,224)		' bright cyan
	ColorsPalette(12) =	RGB(224,82,82)		' bright red
	ColorsPalette(13) =	RGB(224,82,224)		' bright magenta
	ColorsPalette(14) =	RGB(224,224,82)		' bright yellow
	ColorsPalette(15) =	RGB(242,242,242)	' white
	ConHost.Colors.Items = ColorsPalette
End Sub

' Change the console palette to the RGBI (4-bits) palette, similar
' to CGA but with simple dark yellow (ochre) instead of brown.
Sub RGBI
	Dim ConHost, ColorsPalette(15)
	Set ConHost = CreateObject("Majerus.Console")
	ColorsPalette(0) =	RGB(0,0,0)		' black
	ColorsPalette(1) =	RGB(0,0,170)		' dark blue
	ColorsPalette(2) =	RGB(0,170,0)		' dark green
	ColorsPalette(3) =	RGB(0,170,170)		' dark cyan
	ColorsPalette(4) =	RGB(170,0,0)		' dark red
	ColorsPalette(5) =	RGB(170,0,170)		' dark magenta
	ColorsPalette(6) =	RGB(170,170,0)		' dark yellow
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

' Change the console palette to the standard colors as used by CGA
' and matching default 16-colors palette used by EGA and VGA.
Sub CGA
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

' Change the console palette to colors from the C=64 colors palette,
' while trying to keep colors indexes similar.
Sub C64
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

' Change the console palette to the original Windows conhost palette.
' (The standard Windows console palette finally changed in Windows 10 Ver. 1709)
Sub Legacy
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

' The new Windows console palette from Windows 10 Ver. 1709 and later.
Sub Modern
	Dim ConHost, ColorsPalette(15)
	Set ConHost = CreateObject("Majerus.Console")
	ColorsPalette(0) =	RGB(12,12,12)		' black
	ColorsPalette(1) =	RGB(0,55,218)		' dark blue
	ColorsPalette(2) =	RGB(19,161,14)		' dark green
	ColorsPalette(3) =	RGB(58,150,221)		' dark cyan
	ColorsPalette(4) =	RGB(197,15,31)		' dark red
	ColorsPalette(5) =	RGB(136,23,152)		' dark magenta
	ColorsPalette(6) =	RGB(193,156,0)		' dark yellow
	ColorsPalette(7) =	RGB(204,204,204)	' light gray
	ColorsPalette(8) =	RGB(118,118,118)	' dark gray
	ColorsPalette(9) =	RGB(59,120,255)		' bright blue
	ColorsPalette(10) =	RGB(22,198,12)		' bright green
	ColorsPalette(11) =	RGB(97,214,214)		' bright cyan
	ColorsPalette(12) =	RGB(231,72,86)		' bright red
	ColorsPalette(13) =	RGB(180,0,158)		' bright magenta
	ColorsPalette(14) =	RGB(249,241,165)	' bright yellow
	ColorsPalette(15) =	RGB(242,242,242)	' white
	ConHost.Colors.Items = ColorsPalette
End Sub

' Change the console palette to the standard Dark+ palette used in Visual Studio Code.
' A less contrasted than PaletteModern, without any hard black or white.
Sub VSCode
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

' Change the console palette to the Solarized palette designed by Ethan Schoonover
' Solarized is a palette that does not respect the console and ANSI
' palettes, but provides replacement monotones and accent colors
' that reduces contrasting brightness while preserving contrasting
' hues, making text more comfortable to read.
'
' Credits: Ethan Schoonover (http://ethanschoonover.com/solarized)
Sub Solarized
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

' Change the console palette to the light background version of
' the Solarized palette designed by Ethan Schoonover.
' This does not respect the console and ANSI palette, but instead
' reverses background tones and content tones so existing scripts
' designed for light content on dark background automatically
' show as light background. Accent colors are left intact.
'
' Credits: Ethan Schoonover (http://ethanschoonover.com/solarized)
Sub SolarizedLight
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
