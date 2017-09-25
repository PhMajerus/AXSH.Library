' Calendar view for ActiveScript Shell with VBScript
' - Philippe Majerus, September 2017
'
' Set Calendar_FirstDayOfWeek global variable to change the first day of the week.
'
' Usage: Calendar Now  or  Calendar "2010-02-16"

Option Explicit


' Initialize first day of week as Sunday
On Error Resume Next ' IsEmpty with undeclared variable will trigger an error in explicit mode
If IsEmpty(Calendar_FirstDayOfWeek) Then
	Dim Calendar_FirstDayOfWeek ' declare global variable
	Calendar_FirstDayOfWeek = 1
End If
On Error GoTo 0
' You can override this at any time before calling the function,
' for example: Calendar_FirstDayOfWeek = 2 ' Set first day of week as Monday.


' Helper function to rotate a one-dimensional array (circular shift)
Function Calendar_Rotate(List, Count)
	If Count=0 Then
		Calendar_Rotate = List
	Else
		Dim NewList, Size, I
		Size = UBound(List)
		ReDim NewList(Size)
		For I = 0 To Size
			NewList(I) = List((I+Count) Mod (Size+1))
		Next
		Calendar_Rotate = NewList
	End If
End Function

Sub Calendar(Date)
	Dim Months, Days, PrevMonthDays, CellDay, HL, DHL, CL, L, C, Cells(6)
	
	Months = Array("January","February","March","April","May","June","July","August","September","October","November","December")
	Days = Array("Su","Mo","Tu","We","Th","Fr","Sa")
	
	Days = Calendar_Rotate (Days, Calendar_FirstDayOfWeek-1)
	PrevMonthDays = ((Weekday(Date)-1) + (7-((Calendar_FirstDayOfWeek-1) Mod 7)) + (7-((Day(Date)-1) Mod 7)) ) Mod 7
	CellDay = DateAdd("d",-((Day(Date)-1)+PrevMonthDays), Date)
	
	HL = ChrW(&h2500)&ChrW(&h2500)&ChrW(&h2500)&ChrW(&h2500)
	DHL = ChrW(&h2550)&ChrW(&h2550)&ChrW(&h2550)&ChrW(&h2550)
	CL = ChrW(&h253C)
	Echo " " & ChrW(&h250C) & String(34,ChrW(&h2500)) & ChrW(&h2510)
	Echo " " & ChrW(&h2502) & CSet(Months(Month(Date)-1)&" "&Year(Date),34) & ChrW(&h2502)
	Echo " " & ChrW(&h251C) & HL & ChrW(&h252C) & HL & ChrW(&h252C) & HL & ChrW(&h252C) & HL & ChrW(&h252C) & HL & ChrW(&h252C) & HL & ChrW(&h252C) & HL & ChrW(&h2524)
	Echo " " & ChrW(&h2502) & " "&Join(Days," "&ChrW(&h2502)&" ")&" " & ChrW(&h2502)
	Echo " " & ChrW(&h255E) & DHL & ChrW(&h256A) & DHL & ChrW(&h256A) & DHL & ChrW(&h256A) & DHL & ChrW(&h256A) & DHL & ChrW(&h256A) & DHL & ChrW(&h256A) & DHL & ChrW(&h2561)
	
	For L=0 To 5
		If L > 0 Then
			Echo " " & ChrW(&h251C) & HL & ChrW(&h253C) & HL & ChrW(&h253C) & HL & ChrW(&h253C) & HL & ChrW(&h253C) & HL & ChrW(&h253C) & HL & ChrW(&h253C) & HL & ChrW(&h2524)
		End If
		For C=0 To 6
			If Not Month(CellDay) = Month(Date) Then
				Cells(C) = Chr(27)&"[90m " & [RSet](CStr(Day(CellDay)),2) & " " & Chr(27)&"[m"
			ElseIf Day(CellDay) = Day(Date) Then
				Cells(C) = Chr(27)&"[34m"&ChrW(&h2590)&Chr(27)&"[44;97m" & [RSet](CStr(Day(CellDay)),2) & Chr(27)&"[49;34m"&ChrW(&h258C) & Chr(27)&"[m"
			Else
				Cells(C) = Chr(27)&"[37m " & [RSet](CStr(Day(CellDay)),2) & " " & Chr(27)&"[m"
			End If
			CellDay = DateAdd("d",1,CellDay)
		Next
		Echo " " & ChrW(&h2502) & Join(Cells,ChrW(&h2502)) & ChrW(&h2502)
	Next
	
	Echo " " & ChrW(&h2514) & HL & ChrW(&h2534) & HL & ChrW(&h2534) & HL & ChrW(&h2534) & HL & ChrW(&h2534) & HL & ChrW(&h2534) & HL & ChrW(&h2534) & HL & ChrW(&h2518)
End Sub
