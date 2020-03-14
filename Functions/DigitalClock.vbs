'
' Show the time as large text similar to a LED segments display.
' To use the current time, use DigitalClock Time or DigitalClock Now
' 
' - Philippe Majerus - March 2020
'

Option Explicit

Sub DigitalClock (Time)
	If Not IsDate(Time) Then
		Err.Raise 5, , "Time must be a date/time value"
	End If
	
	Dim Segments, BH, BV, BL, SP, EL, Text, L, Vals, I, J, Banner
	
	BH = ChrW(&h2550)
	BV = ChrW(&h2551)
	BL = ChrW(&h25CB)
	SP = " "
	EL = "    "
	Segments = Array( _
		Array(SP&BH&BH&SP, BV&"  "&BV, EL, BV&"  "&BV, SP&BH&BH&SP), _
		Array(EL, "   "&BV, EL, "   "&BV, EL), _
		Array(SP&BH&BH&SP, "   "&BV, SP&BH&BH&SP, BV&"   ", SP&BH&BH&SP), _
		Array(SP&BH&BH&SP, "   "&BV, SP&BH&BH&SP, "   "&BV, SP&BH&BH&SP), _
		Array(EL, BV&"  "&BV, SP&BH&BH&SP, "   "&BV, EL), _
		Array(SP&BH&BH&SP, BV&"   ", SP&BH&BH&SP, "   "&BV, SP&BH&BH&SP), _
		Array(SP&BH&BH&SP, BV&"   ", SP&BH&BH&SP, BV&"  "&BV, SP&BH&BH&SP), _
		Array(SP&BH&BH&SP, "   "&BV, EL, "   "&BV, EL), _
		Array(SP&BH&BH&SP, BV&"  "&BV, SP&BH&BH&SP, BV&"  "&BV, SP&BH&BH&SP), _
		Array(SP&BH&BH&SP, BV&"  "&BV, SP&BH&BH&SP, "   "&BV, SP&BH&BH&SP), _
		Array(SP, BL, SP, BL, SP) _
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
			Banner = Banner & (SP & Segments(Vals(J))(I))
		Next
		If I < 4 Then Banner = Banner & vbCrLf
	Next
	
	AXSH.Echo Chr(27)&"[92m" & Banner & Chr(27)&"[m"
End Sub
