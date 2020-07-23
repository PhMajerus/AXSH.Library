'
' Get the time as text similar to a LED segments display.
' To use the current time, use DigitalClock Time or DigitalClock Now
' 
' The returned string fits on a single line, but requires VT control
' sequences and proper terminal or console support for underline and
' overline. (such as Windows Terminal 1.2 and later has)
' 
' - Philippe Majerus - July 2020
'

Option Explicit

Function GetSmallDigitalClock (Time)
	If Not IsDate(Time) Then
		Err.Raise 5, , "Time must be a date/time value"
	End If
	
	Dim Esc, Segments, Text, Banner, L, I
	
	Esc = Chr(27)
	Segments = Array( _
		"|"&Esc&"[4;53m "&Esc&"[55;24m|", _
		" | ", _
		"."&Esc&"[4;53;9m-"&Esc&"[29;55;24m'", _
		" "&Esc&"[4;53;9m-"&Esc&"[29;55;24m|", _
		"'"&Esc&"[9m-"&Esc&"[29m|", _
		"'"&Esc&"[4;53;9m-"&Esc&"[29;55;24m,", _
		"|"&Esc&"[4;53;9m-"&Esc&"[29;55;24m,", _
		" "&Esc&"[53m "&Esc&"[55m|", _
		"|"&Esc&"[4;53;9m-"&Esc&"[29;55;24m|", _
		"'"&Esc&"[4;53;9m-"&Esc&"[29;55;24m|", _
		":" _
	)
	
	Text = Right("0"&Hour(Time),2) & ":" & Right("0"&Minute(Time),2) & ":" & Right("0"&Second(Time),2)
	
	L = Len(Text)
	Banner = vbNullString
	For I = 0 To L-1
		Banner = Banner & Segments(Asc(Mid(Text,I+1,1)) - 48)
	Next
	
	GetSmallDigitalClock = Banner
End Function
