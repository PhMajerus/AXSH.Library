'
' C=64-like environment for Majerus.net ActiveScript Shell with VBScript
' This isn't functionnal, it's only for fun.
' 
' - Philippe Majerus
'

Option Explicit

Sub Go64
	Dim Key
	' Cursor should be on same line
	AXSH.Echo "ARE YOU SURE?"
	Key = Empty
	While Key<>"y" And Key<>"n"
		Key = LCase(GetChar(False))
	WEnd
	If Key = "n" Then Exit Sub
	
	' Use the iconic prompt
	ExecuteGlobal "Function Prompt: Prompt = vbNewLine & ""READY."" & vbNewLine: End Function"
	
	Dim Console, Palette(15)
	Set Console = CreateObject("Majerus.Console")
	With Console
		.Title = Replace(Console.Title, "VBScript", "BASIC")
		
		' Set a similar bold and blocky font
		With .Font
			.Name = "Terminal"
			.Size = 16 ' 12x16
		End With
		
		' Set typical C=64 colors palette
		Palette(0) =	RGB(0,0,0)		' 0 black
		Palette(1) =	RGB(53,40,121)		' 6 dark blue
		Palette(2) =	RGB(88,141,67)		' 5 dark green
		Palette(3) =	RGB(67,57,0)		' dark brown (dark cyan)
		Palette(4) =	RGB(104,55,43)		' 2 dark red
		Palette(5) =	RGB(111,61,134)		' 4 dark magenta
		Palette(6) =	RGB(111,79,37)		' 8 light brown (dark yellow)
		Palette(7) =	RGB(149,149,149)	' F light gray
		Palette(8) =	RGB(68,68,68)		' B dark gray
		Palette(9) =	RGB(108,94,181)		' E bright blue
		Palette(10) =	RGB(154,210,132)	' D bright green
		Palette(11) =	RGB(112,164,178)	' 3 bright cyan
		Palette(12) =	RGB(154,103,89)		' A bright red
		Palette(13) =	RGB(108,108,108)	' C mid gray (bright magenta)
		Palette(14) =	RGB(184,199,111)	' 7 bright yellow
		Palette(15) =	RGB(255,255,255)	' 1 white
		.Colors.Items = Palette
		
		' Some other console tweaks to make it more similar
		.Colors.BackColor = 1
		.Colors.ForeColor = 9
		.Configuration.CursorSize = 100
		With .Buffer
			.Width = 40
			.Height = 25
		End With
	End With
	
	AXSH.Configuration.ErrorColor = ""
	
	AXSH.Echo
	AXSH.Echo Strings.CSet("**** MICROSOFT VB SCRIPT V" & ScriptEngineMajorVersion() & " ****", Console.Buffer.Width)
	AXSH.Echo
	
	Dim TotalRam, FreeRam
	Dim WMI, WMI_Win32CS, CS, WMI_Win32OS, OS
	Set WMI = GetObject("winmgmts:\\.\root\cimv2")
	
	Set WMI_Win32CS = WMI.ExecQuery("SELECT TotalPhysicalMemory FROM Win32_ComputerSystem")
	For Each CS in WMI_Win32CS
		TotalRam = CS.TotalPhysicalMemory
	Next
	
	Set WMI_Win32OS = WMI.ExecQuery("SELECT FreePhysicalMemory FROM Win32_OperatingSystem")
	For Each OS in WMI_Win32OS
		FreeRam = OS.FreePhysicalMemory
	Next
	
	AXSH.Echo Strings.CSet(CInt(TotalRam/1024/1024/1024) & "G RAM SYSTEM  " & CInt(FreeRam/1024) & "M BYTES FREE", Console.Buffer.Width)
End Sub


Sub Load (filename, devicenumber, secondarynumber)
	AXSH.Echo "SEARCHING FOR "&filename
	WSH.Sleep 1000
	AXSH.Echo "LOADING"
	WSH.Sleep 4000
	AXSH.Echo "?USER EXPECTATIONS ERROR"
	' Did you really expect this to work ?!
End Sub

Sub Print (text)
	AXSH.Echo text
End Sub
