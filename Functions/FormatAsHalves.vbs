'
' Format a number rounded to the nearest half (0.5) as a string using the
' Unicode vulgar fraction one half symbol (1/2).
'

Option Explicit

Function FormatAsHalves (Val)
	Dim Neg, I, F, Fraction
	
	If Not IsNumeric(Val) Then
		Err.Raise 5, , "Val argument must be a number"
	End If
	
	' Decompose number into sign, integer and decimal parts
	Neg = Val < 0
	F = Abs(Val)
	I = Int(F)
	F = F-I
	
	' Convert decimals to halves
	F = Int((F / 0.5) + 0.5)
	If F = 2 Then
		I = I + 1
		F = 0
	End If
	
	' Build string
	FormatAsHalves = vbNullString
	If Neg Then FormatAsHalves = FormatAsHalves & "-"
	FormatAsHalves = FormatAsHalves & I
	If F > 0 Then FormatAsHalves = FormatAsHalves & ChrW(&h00BD)
End Function
