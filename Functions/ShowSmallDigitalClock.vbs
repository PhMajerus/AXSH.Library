'
' Show the time as text similar to a LED segments display.
' To use the current time, use DigitalClock Time or DigitalClock Now
' 
' The returned string fits on a single line, but requires VT control
' sequences and proper terminal or console support for underline and
' overline. (such as Windows Terminal 1.2 and later has)
' 
' - Philippe Majerus - July 2020
'

Option Explicit

Sub ShowSmallDigitalClock (Time)
	AXSH.Echo Chr(27)&"[92m" & GetSmallDigitalClock(Time) & Chr(27)&"[m"
End Sub
