' Displays a clock in binary notation
' Requires BitsDots.vbs

Option Explicit

Sub BinaryClock
	Dim T, Days, Months, I
	' Fix the current date so all computation is done on a consistent value
	T = Now()
	' Prepare days group
	Days = Array("S","M","T","W","T","F","S")
	For I = 0 To 6
		If I=Weekday(T)-1 Then
			Days(I) = Chr(27)&"[32m" & Days(I) & Chr(27)&"[31m"
		End If
	Next
	Days = Chr(27)&"[31m" & Join(Days,"")
	' Prepare months group
	Months = Array("J","F","M","A","M","J","J","A","S","O","N","D")
	For I = 0 To 11
		If I=Month(T)-1 Then
			Months(I) = Chr(27)&"[32m" & Months(I) & Chr(27)&"[31m"
		End If
	Next
	Months = Chr(27)&"[31m" & Join(Months,"")
	' Display binary clock
	Echo " " & Chr(27)&"[90m" & ChrW(&h250C) & String(12,ChrW(&h2500)) & _
		ChrW(&h2524) & " BINARY  CLOCK " & ChrW(&h251C) & _
		String(12,ChrW(&h2500)) & ChrW(&h2510) & Chr(27)&"[m"
	Echo " " & Chr(27)&"[90m" & ChrW(&h2502) & Space(41) & ChrW(&h2502) & Chr(27)&"[m"
	Echo " " & Chr(27)&"[90m"&ChrW(&h2502)&" " & Days & " " & Months & _
		Chr(27)&"[90m : D " & BitsDots(Day(T),8) & _
		Chr(27)&"[32m " & Year(T) & _
		Chr(27)&"[90m " & ChrW(&h2502) & Chr(27)&"[m"
	Echo " " & Chr(27)&"[90m" & ChrW(&h2502) & Space(41) & ChrW(&h2502) & Chr(27)&"[m"
	Echo " " & Chr(27)&"[90m" & ChrW(&h2502) & " H " & BitsDots(Hour(T),8) & _
		Chr(27)&"[90m : M " & BitsDots(Minute(T),8) & _
		Chr(27)&"[90m : S " & BitsDots(Second(T),8) & _
		Chr(27)&"[90m " & ChrW(&h2502) & Chr(27)&"[m"
	Echo " " & Chr(27)&"[90m" & ChrW(&h2502) & Space(41) & ChrW(&h2502) & Chr(27)&"[m"
	Echo " " & Chr(27)&"[90m" & ChrW(&h2514) & String(41,ChrW(&h2500)) & ChrW(&h2518) & Chr(27)&"[m"
End Sub
