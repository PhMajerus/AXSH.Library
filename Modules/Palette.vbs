' 
' Palette module for AXSH.
' Provides methods to easily change the console palette
' - Philippe Majerus
'


Option Explicit


' Change the console palette to a more balanced and less contrasted palette,
' while keeping enough contrast for ANSI-art.
' This is the default ActiveScript Shell palette.
' by Philippe Majerus
Sub Standard
	Dim ConHost, ColorsPalette(15)
	Set ConHost = CreateObject("Majerus.Console")
	ColorsPalette(0) =	RGB(30,30,30)		' black
	ColorsPalette(1) =	RGB(47,47,146)		' dark blue
	ColorsPalette(2) =	RGB(47,146,47)		' dark green
	ColorsPalette(3) =	RGB(63,163,163)		' dark cyan
	ColorsPalette(4) =	RGB(146,47,47)		' dark red
	ColorsPalette(5) =	RGB(163,63,163)		' dark magenta
	ColorsPalette(6) =	RGB(163,163,63)		' dark yellow
	ColorsPalette(7) =	RGB(163,163,163)	' light gray
	ColorsPalette(8) =	RGB(96,96,96)		' dark gray
	ColorsPalette(9) =	RGB(96,96,196)		' bright blue
	ColorsPalette(10) =	RGB(96,196,96)		' bright green
	ColorsPalette(11) =	RGB(113,212,212)	' bright cyan
	ColorsPalette(12) =	RGB(196,96,96)		' bright red
	ColorsPalette(13) =	RGB(212,113,212)	' bright magenta
	ColorsPalette(14) =	RGB(212,212,113)	' bright yellow
	ColorsPalette(15) =	RGB(229,229,229)	' white
	ConHost.Colors.Items = ColorsPalette
End Sub

' Change the console palette to a more balanced and less contrasted palette,
' which reverses the colors brightnesses while keeping original ANSI contrasts.
' This palette is designed to make it easy to switch from dark to light without
' changing any VT sequence.
' It isn't just reshuffling the standard palette, as the colors aren't symmetrical.
' Designed for ActiveScript Shell
' by Philippe Majerus
Sub StandardLight
	Dim ConHost, ColorsPalette(15)
	Set ConHost = CreateObject("Majerus.Console")
	ColorsPalette(0) =	RGB(229,229,229)	' white
	ColorsPalette(1) =	RGB(146,146,246)	' bright blue
	ColorsPalette(2) =	RGB(146,246,146)	' bright green
	ColorsPalette(3) =	RGB(63,163,163)		' bright cyan
	ColorsPalette(4) =	RGB(246,146,146)	' bright red
	ColorsPalette(5) =	RGB(163,63,163)		' bright magenta
	ColorsPalette(6) =	RGB(163,163,63)		' bright yellow
	ColorsPalette(7) =	RGB(96,96,96)		' dark gray
	ColorsPalette(8) =	RGB(163,163,163)	' light gray
	ColorsPalette(9) =	RGB(96,96,196)		' dark blue
	ColorsPalette(10) =	RGB(96,196,96)		' dark green
	ColorsPalette(11) =	RGB(13,113,113)		' dark cyan
	ColorsPalette(12) =	RGB(196,96,96)		' dark red
	ColorsPalette(13) =	RGB(113,13,113)		' dark magenta
	ColorsPalette(14) =	RGB(113,113,13)		' dark yellow
	ColorsPalette(15) =	RGB(30,30,30)		' black
	ConHost.Colors.Items = ColorsPalette
End Sub

' A palette with even brightness for all bright and all dark colors.
' Designed for ActiveScript Shell
' by Philippe Majerus
Sub Even
	Dim ConHost, ColorsPalette(15)
	Set ConHost = CreateObject("Majerus.Console")
	ColorsPalette(0) =	RGB(30,30,30)		' black
	ColorsPalette(1) =	RGB(63,63,163)		' dark blue
	ColorsPalette(2) =	RGB(63,163,63)		' dark green
	ColorsPalette(3) =	RGB(30,130,129)		' dark cyan
	ColorsPalette(4) =	RGB(163,63,63)		' dark red
	ColorsPalette(5) =	RGB(129,30,130)		' dark magenta
	ColorsPalette(6) =	RGB(130,129,30)		' dark yellow
	ColorsPalette(7) =	RGB(163,163,163)	' light gray
	ColorsPalette(8) =	RGB(96,96,96)		' dark gray
	ColorsPalette(9) =	RGB(130,130,229)	' bright blue
	ColorsPalette(10) =	RGB(130,229,130)	' bright green
	ColorsPalette(11) =	RGB(96,196,196)		' bright cyan
	ColorsPalette(12) =	RGB(229,130,130)	' bright red
	ColorsPalette(13) =	RGB(196,96,196)		' bright magenta
	ColorsPalette(14) =	RGB(196,196,96)		' bright yellow
	ColorsPalette(15) =	RGB(229,229,229)	' white
	ConHost.Colors.Items = ColorsPalette
End Sub

' A palette with even brightness for all bright and all dark colors.
' Designed for ActiveScript Shell
' by Philippe Majerus
Sub EvenLight
	Dim ConHost, ColorsPalette(15)
	Set ConHost = CreateObject("Majerus.Console")
	ColorsPalette(0) =	RGB(229,229,229)	' white
	ColorsPalette(1) =	RGB(130,130,229)	' bright blue
	ColorsPalette(2) =	RGB(130,229,130)	' bright green
	ColorsPalette(3) =	RGB(96,196,196)		' bright cyan
	ColorsPalette(4) =	RGB(229,130,130)	' bright red
	ColorsPalette(5) =	RGB(196,96,196)		' bright magenta
	ColorsPalette(6) =	RGB(196,196,96)		' bright yellow
	ColorsPalette(7) =	RGB(96,96,96)		' dark gray
	ColorsPalette(8) =	RGB(163,163,163)	' light gray
	ColorsPalette(9) =	RGB(63,63,163)		' dark blue
	ColorsPalette(10) =	RGB(63,163,63)		' dark green
	ColorsPalette(11) =	RGB(30,130,129)		' dark cyan
	ColorsPalette(12) =	RGB(163,63,63)		' dark red
	ColorsPalette(13) =	RGB(129,30,130)		' dark magenta
	ColorsPalette(14) =	RGB(130,129,30)		' dark yellow
	ColorsPalette(15) =	RGB(30,30,30)		' black
	ConHost.Colors.Items = ColorsPalette
End Sub

' Change the console palette to the monochrome green phosphor
' typical of the original MDA with an IBM 5151 monitor.
Sub MDA
	Dim ConHost, ColorsPalette(15)
	Set ConHost = CreateObject("Majerus.Console")
	ColorsPalette(0) =	RGB(46,53,50)		' black
	ColorsPalette(1) =	RGB(48,154,53)		' dark blue
	ColorsPalette(2) =	RGB(48,154,53)		' dark green
	ColorsPalette(3) =	RGB(48,154,53)		' dark cyan
	ColorsPalette(4) =	RGB(48,154,53)		' dark red
	ColorsPalette(5) =	RGB(48,154,53)		' dark magenta
	ColorsPalette(6) =	RGB(48,154,53)		' dark yellow
	ColorsPalette(7) =	RGB(50,255,56)		' light gray
	ColorsPalette(8) =	RGB(48,154,53)		' dark gray
	ColorsPalette(9) =	RGB(50,255,56)		' bright blue
	ColorsPalette(10) =	RGB(50,255,56)		' bright green
	ColorsPalette(11) =	RGB(50,255,56)		' bright cyan
	ColorsPalette(12) =	RGB(50,255,56)		' bright red
	ColorsPalette(13) =	RGB(50,255,56)		' bright magenta
	ColorsPalette(14) =	RGB(50,255,56)		' bright yellow
	ColorsPalette(15) =	RGB(50,255,56)		' white
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

' Change the console palette to colors from the C=64 colors palette,
' while trying to keep colors indexes similar to CGA.
' This is designed to bring back memories when seeing ANSI-art in C=64
' colors, but isn't a compatible palette and doesn't match C=64 indexes.
Sub C64
	Dim ConHost, ColorsPalette(15)
	Set ConHost = CreateObject("Majerus.Console")
	ColorsPalette(0) =	RGB(0,0,0)		' 0 black
	ColorsPalette(1) =	RGB(53,40,121)		' 6 dark blue
	ColorsPalette(2) =	RGB(88,141,67)		' 5 dark green
	ColorsPalette(3) =	RGB(67,57,0)		' 9 dark brown (dark cyan)
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

' Change the console palette to colors from the Apple II colors palette,
' while trying to keep colors indexes similar to CGA.
' This is designed to bring back memories when seeing ANSI-art in Apple II
' colors, but isn't a compatible palette and doesn't match Apple II indexes.
Sub A2
	Dim ConHost, ColorsPalette(15)
	Set ConHost = CreateObject("Majerus.Console")
	ColorsPalette(0) =	RGB(0,0,0)		' 0 black
	ColorsPalette(1) =	RGB(96,78,189)		' 2 dark blue
	ColorsPalette(2) =	RGB(0,163,96)		' 4 dark green
	ColorsPalette(3) =	RGB(208,195,255)	' 7 light blue
	ColorsPalette(4) =	RGB(227,30,96)		' 1 magenta
	ColorsPalette(5) =	RGB(255,68,253)		' 3 purple
	ColorsPalette(6) =	RGB(96,114,3)		' 8 brown
	ColorsPalette(7) =	RGB(156,156,156)	' 5 grey #1
	ColorsPalette(8) =	RGB(156,156,156)	' A grey #2
	ColorsPalette(9) =	RGB(20,207,253)		' 6 medium blue
	ColorsPalette(10) =	RGB(20,245,60)		' C green
	ColorsPalette(11) =	RGB(114,255,208)	' E aqua
	ColorsPalette(12) =	RGB(255,106,60)		' 9 orange
	ColorsPalette(13) =	RGB(255,160,208)	' B pink
	ColorsPalette(14) =	RGB(208,221,141)	' D yellow
	ColorsPalette(15) =	RGB(255,255,255)	' F white
	ConHost.Colors.Items = ColorsPalette
End Sub

' Change the console palette to the original Windows conhost palette.
' (The standard Windows console palette finally changed in Windows 10 Ver. 1709)
Sub WindowsLegacy
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
Sub Windows
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
