'
' Show the time as large text similar to a LED segments display.
' To use the current time, use DigitalClock Time
' 
' - Philippe Majerus - March 2020
'

Option Explicit

Sub DigitalClock (Time)
	If Not IsDate(Time) Then
		Err.Raise 5, , "Time must be a date/time value"
	End If
	
	Dim Segments, HL, VL, DT, Text, L, Vals, I, J, Banner
	
	HL = ChrW(&h2550)
	VL = ChrW(&h2551)
	DT = ChrW(&h2022)
	Segments = Array( _
		Array(" "&HL&HL&" ", VL&"  "&VL, "    ", VL&"  "&VL, " "&HL&HL&" "), _
		Array("    ", "   "&VL, "    ", "   "&VL, "    "), _
		Array(" "&HL&HL&" ", "   "&VL, " "&HL&HL&" ", VL&"   ", " "&HL&HL&" "), _
		Array(" "&HL&HL&" ", "   "&VL, " "&HL&HL&" ", "   "&VL, " "&HL&HL&" "), _
		Array("    ", VL&"  "&VL, " "&HL&HL&" ", "   "&VL, "    "), _
		Array(" "&HL&HL&" ", VL&"   ", " "&HL&HL&" ", "   "&VL, " "&HL&HL&" "), _
		Array(" "&HL&HL&" ", VL&"   ", " "&HL&HL&" ", VL&"  "&VL, " "&HL&HL&" "), _
		Array(" "&HL&HL&" ", "   "&VL, "    ", "   "&VL, "    "), _
		Array(" "&HL&HL&" ", VL&"  "&VL, " "&HL&HL&" ", VL&"  "&VL, " "&HL&HL&" "), _
		Array(" "&HL&HL&" ", VL&"  "&VL, " "&HL&HL&" ", "   "&VL, " "&HL&HL&" "), _
		Array(" ", DT, " ", DT, " ") _
	)
	
	Text = Right("0"&Hour(Time),2) & ":" & Right("0"&Minute(Time),2) & ":" & Right("0"&Second(Time),2)
	
	L = Len(Text)
	ReDim Vals(L-1)
	For I = 0 To L-1
		Vals(I) = Asc(Mid(Text,I+1,1)) - 48
	Next
	
	Banner = vbNullString
	For I = 0 To 4
		For J = 0 To L-1
			Banner = Banner & (" " & Segments(Vals(J))(I))
		Next
		If I < 4 Then Banner = Banner & vbCrLf
	Next
	
	AXSH.Echo Chr(27)&"[92m" & Banner & Chr(27)&"[m"
End Sub
