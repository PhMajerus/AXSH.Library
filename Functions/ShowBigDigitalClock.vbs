'
' Show the time as large text similar to a LED segments display.
' To use the current time, use DigitalClock Time or DigitalClock Now
' 
' - Philippe Majerus - March 2020
'

Option Explicit

Sub ShowBigDigitalClock (Time)
	AXSH.Echo Chr(27)&"[92m" & GetBigDigitalClock(Time) & Chr(27)&"[m"
End Sub
