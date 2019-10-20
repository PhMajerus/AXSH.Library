'
' Get system uptime in jiffies
' 
' This was a reserved variable in C=64 BASIC.
' It returns the current uptime of the computer in jiffies (1/60 of a second),
' modulo 24 hours (cycle repeats from 0 after 24h).
' 
' From Commodore 64 user's guide:
' The variable TI is updated every 1/60th of a second.
' It starts at 0 when the computer is turned on, and is reset only
' by changing the value of TI$.
' 
' Note this implementation uses the real system uptime, you cannot
' reset it by changing TI$.
'

Option Explicit

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
	
	' Get the timespan in days unit, the OLE Date internal format
	Dim TimeSpan
	TimeSpan = Now - BootTime
	
	' The C=64 restarted the TI counter after 24 hours,
	' so only keep the fractional part.
	TimeSpan = TimeSpan - Fix(TimeSpan)
	
	' Get the timespan in jiffies
	TI = CLng(Int(TimeSpan * 24 * 60 * 60 * 60))
End Function
