'
' Format a number rounded to the nearest fifth (0.2) as a string using
' Unicode vulgar fraction symbols (1/5, 2/5, 3/5, and 4/5).
'

Option Explicit

Function FormatAsFifths (Val)
	Dim Neg, I, F, Fraction
	
	If Not IsNumeric(Val) Then
		Err.Raise 5, , "Val argument must be a number"
	End If
	
	' Decompose number into sign, integer and decimal parts
	Neg = Val < 0
	F = Abs(Val)
	I = Int(F)
	F = F-I
	
	' Convert decimals to fifths
	F = Int((F / 0.2) + 0.5)
	If F = 5 Then
		I = I + 1
		F = 0
	End If
	
	' Build string
	FormatAsFifths = vbNullString
	If Neg Then FormatAsFifths = "-"
	FormatAsFifths = FormatAsFifths & I
	If F > 0 Then FormatAsFifths = FormatAsFifths & ChrW(&h2154+F)
End Function
