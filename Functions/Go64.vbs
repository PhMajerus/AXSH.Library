'
' C=64-like environment for Majerus.net ActiveScript Shell with VBScript
' This isn't functionnal, it's only for fun.
' 
' - Philippe Majerus
'

Option Explicit

Sub Go64
	' Set typical C=64 colors palette
	Dim ConHost, Palette(15)
	Set ConHost = CreateObject("Majerus.Console")
	ConHost.Title = Replace(Console.Title,"VBScript","BASIC")
	ConHost.Font.Size = 18
	ConHost.Font.Name = "Terminal"
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
	ConHost.Colors.Items = Palette
	
	' Some other console tweaks to make it more similar
	With ConHost
		.Colors.BackColor = 1
		.Colors.ForeColor = 9
		.Configuration.CursorSize = 100
	End With
	With ConHost.Buffer
		.Width = 40
		.Height = 25
	End With
	
	Echo
	Echo PadEven("**** MICROSOFT VB SCRIPT V" & ScriptEngineMajorVersion() & " ****", ConHost.Buffer.Width, " ")
	Echo

	Dim TotalRam, FreeRam
	Dim WMI, WMI_Win32CS, CS, WMI_Win32Mem, Mem
	Set WMI = GetObject("winmgmts:\\.\root\cimv2")
	
	Set WMI_Win32CS = WMI.ExecQuery("SELECT TotalPhysicalMemory FROM Win32_ComputerSystem")
	For Each CS in WMI_Win32CS
		TotalRam = CS.TotalPhysicalMemory
	Next
	
	Set WMI_Win32Mem = WMI.ExecQuery("SELECT AvailableBytes FROM Win32_PerfFormattedData_PerfOS_Memory")
	For Each Mem in WMI_Win32Mem
		FreeRam = Mem.AvailableBytes
	Next
	
	Echo PadEven(CInt(TotalRam/1024/1024/1024) & "G RAM SYSTEM  " & CInt(FreeRam/1024/1024) & "M BYTES FREE", ConHost.Buffer.Width, " ")
	Echo
End Sub

' Use the iconic prompt
Function Prompt
	Prompt = "READY." & vbNewLine
End Function

Sub Load (filename, devicenumber, secondarynumber)
	Echo "SEARCHING FOR "&filename
	WSH.Sleep 1000
	Echo "LOADING"
	WSH.Sleep 10000
	Echo "You really expect this to work?!"
	Echo
End Sub

Sub Print (text)
	Echo text
End Sub
