'
' Get system uptime in "HHMMSS" string format, days are ignored.
' 
' This was a reserved variables in C=64 BASIC.
' Note that the "$" character is not valid as part of an identifier
' in Visual Basic, so VBScript requires it to be enclosed between
' brackets [] to get over the check, as in [TI$].
' 
' From Commodore 64 user's guide:
' TI$ is a string which is constantly updated by the system.
' The first two characters contain the number of hours, the 3rd and 4th
' characters the number of minutes, and the 5th and 6th characters are the
' number of seconds. This variable can be given any numeric value, and will
' be updated from that point.
'


Function [TI$] ' C=64 also accepted TIME$ as a long name
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
	
	' Convert to "HHMMSS" string format
	Dim NowTime, Seconds, Minutes, Hours
	NowTime = Now ' avoid calling the Now function over and over
	Seconds = Abs(DateDiff("S", NowTime, BootTime))
	Minutes = Seconds \ 60
	Seconds = Seconds Mod 60
	Hours = Minutes \ 60
	Minutes = Minutes Mod 60
	Hours = Hours Mod 24
	[TI$] = Right("00"&Hours, 2) & Right("00"&Minutes, 2) & Right("00"&Seconds, 2)
End Function
