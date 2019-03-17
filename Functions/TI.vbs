'
' Get system uptime in jiffies
' 
' This was a reserved variables in C=64 BASIC.
' It returns the current uptime of the computer in jiffies (1/60 of a second).
' 
' From Commodore 64 user's guide:
' The variable TI is updated every 1/60th of a second.
' It starts at 0 when the computer is turned on, and is reset only
' by changing the value of TI$.
'

Function TI ' C=64 also accepted TIME as a long name, but TIME is already provided for current clock time in VBScript.
	' Retrieve the last boot-up time from WMI
	Dim WbemDT, WMI, OSes, Item, BootTime
	Set WbemDT = CreateObject("WbemScripting.SWbemDateTime")
	Set WMI = GetObject("winmgmts:\\.\root\cimv2")
	Set OSes = WMI.InstancesOf("Win32_OperatingSystem")
	For Each Item in OSes
		WbemDT.Value = Item.LastBootUpTime
		Exit For
	Next
	BootTime = WbemDT.GetVarDate
	
	' Get the timespan in days unit, thanks to OLE Date internal format
	Dim TimeSpan
	TimeSpan = CDbl(Now) - CDbl(BootTime)
	
	' Get the timespan in jiffies
	TI = Int(TimeSpan * 24 * 60 * 60 * 60)
End Function
