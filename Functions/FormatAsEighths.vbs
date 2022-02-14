'
' Format a number rounded to the nearest eighth (0.125) as a string using
' Unicode vulgar fraction symbols (1/8, 1/4, 3/8, 1/2, 5/8, 3/4, and 7/8).
'

Option Explicit

Function FormatAsEighths (Val)
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
	F = Int((F / 0.125) + 0.5)
	If F = 8 Then
		I = I + 1
		F = 0
	End If
	
	' Build string
	FormatAsEighths = vbNullString
	If Neg Then FormatAsEighths = FormatAsEighths & "-"
	FormatAsEighths = FormatAsEighths & I
	Select Case F
		Case 1: FormatAsEighths = FormatAsEighths & ChrW(&h215B)
		Case 2: FormatAsEighths = FormatAsEighths & ChrW(&h00BC)
		Case 3: FormatAsEighths = FormatAsEighths & ChrW(&h215C)
		Case 4: FormatAsEighths = FormatAsEighths & ChrW(&h00BD)
		Case 5: FormatAsEighths = FormatAsEighths & ChrW(&h215D)
		Case 6: FormatAsEighths = FormatAsEighths & ChrW(&h00BE)
		Case 7: FormatAsEighths = FormatAsEighths & ChrW(&h215E)
	End Select
End Function
