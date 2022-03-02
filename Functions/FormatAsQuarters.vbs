'
' Format a number rounded to the nearest quarter (0.25) as a string using
' Unicode vulgar fraction symbols (1/4, 1/2, and 3/4).
'

Option Explicit

Function FormatAsQuarters (Val)
	Dim Neg, I, F, Fraction
	
	If Not IsNumeric(Val) Then
		Err.Raise 5, , "Val argument must be a number"
	End If
	
	' Decompose number into sign, integer and decimal parts
	Neg = Val < 0
	F = Abs(Val)
	I = Int(F)
	F = F-I
	
	' Convert decimals to eighths
	F = Int((F / 0.25) + 0.5)
	If F = 4 Then
		I = I + 1
		F = 0
	End If
	
	' Build string
	FormatAsQuarters = vbNullString
	If Neg Then FormatAsQuarters = "-"
	FormatAsQuarters = FormatAsQuarters & I
	Select Case F
		Case 1: FormatAsQuarters = FormatAsQuarters & ChrW(&h00BC)
		Case 2: FormatAsQuarters = FormatAsQuarters & ChrW(&h00BD)
		Case 3: FormatAsQuarters = FormatAsQuarters & ChrW(&h00BE)
	End Select
End Function
