'
' Get system uptime in "HHMMSS" string format, days are ignored.
' 
' This was a reserved variable in C=64 BASIC.
' Note that the "$" character is not valid as part of an identifier
' in Visual Basic, so VBScript requires it to be enclosed between
' brackets [] to get over the check, as in [TI$].
' 
' Since it is implemented as a function instead of a special variable,
' it cannot be used to change the current system clock by assigning a
' value to it like on the C=64. On modern computers, your system time
' shouldn't be changed that lightly anyway.
' 
' From Commodore 64 user's guide:
' TI$ is a string which is constantly updated by the system.
' The first two characters contain the number of hours, the 3rd and 4th
' characters the number of minutes, and the 5th and 6th characters are the
' number of seconds. This variable can be given any numeric value, and will
' be updated from that point.
' 
' The Commodore 64 allowed setting the TI$ variable to set the real time of
' day, which would then get updated automatically.
' This function does not support changing the value and always computes the
' time from last boot-up time.
' To get the time of day in the same format, use the following expression
' instead :
' Right("0"&Hour(Now),2)&Right("0"&Minute(Now),2)&Right("0"&Second(Now),2)
'

Option Explicit

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
	Seconds = DateDiff("S", BootTime, NowTime)
	Minutes = Seconds \ 60
	Seconds = Seconds Mod 60
	Hours = Minutes \ 60
	Minutes = Minutes Mod 60
	Hours = Hours Mod 24 ' ignore whole days
	[TI$] = Right("00"&Hours, 2) & Right("00"&Minutes, 2) & Right("00"&Seconds, 2)
End Function
