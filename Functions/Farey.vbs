'*
'* Use the Farey algorithm to find rational approximations of floating-point
'* numbers, which is the most simplified fraction that can represent the
'* number.
'* This can be an easy way to present more human-readable representations of
'* numbers. The returned value is not necessarily the exact value, but
'* the closest approximation possible within the specified limit.
'* A comparison with the actual value should be used before settling on using
'* a rational approximation at all.
'* 
'* Value is the number to convert to a fraction.
'* Limit is the maximum denominator, excluded.
'* The result is returned as an object with Numerator and Denominator
'* properties, as well as Value and String properties to convert to
'* a number or a string respectively.
'* 
'* Example usage:
'* Show Farey(Math.PI, 10)
'* ?Farey(Math.PI, 1000)
'*

Option Explicit

Class Farey_Rational
	Private m_Numerator, m_Denominator
	
	Sub Class_Initialize
		m_Numerator = 1
		m_Denominator = 1
	End Sub
	
	Public Property Get Numerator
		Numerator = m_Numerator
	End Property
	Public Property Let Numerator (Value)
		m_Numerator = Value
	End Property
	
	Public Property Get Denominator
		Denominator = m_Denominator
	End Property
	Public Property Let Denominator (Value)
		m_Denominator = Value
	End Property
	
	Public Property Get Value
		Value = Numerator / Denominator
	End Property
	
	Public Default Property Get String
		String = Numerator & "/" & Denominator
	End Property
End Class

Function Farey (Value, Limit)
	Dim Lower, Upper, Mediant
	
	' Speed up computation for integers.
	If Int(Value) = CDbl(Value) Then
		Set Farey = New Farey_Rational
		Farey.Numerator = Value
		Farey.Denominator = 1
		Exit Function
	End If
	
	If Value < 0 Then
		Set Farey = Farey(-Value, Limit)
		Farey.Numerator = -Farey.Numerator
		Exit Function
	End If
	
	' Start with full range from 0 to infinity
	Set Lower = New Farey_Rational
	Lower.Numerator = 0
	Lower.Denominator = 1
	Set Upper = New Farey_Rational
	Upper.Numerator = 1
	Upper.Denominator = 0
	Set Mediant = New Farey_Rational
	Mediant.Numerator = 1
	Mediant.Denominator = 1
	
	Do While Limit > Mediant.Denominator
		If Value * Mediant.Denominator > Mediant.Numerator Then
			' The value is between mediant and upper,
			' use mediant to upper as our new range.
			Set Lower = Mediant
		Else
			' The value is between lower and mediant,
			' use lower to mediant as our new range.
			Set Upper = Mediant
		End If
		
		If Value * Mediant.Denominator = Mediant.Numerator Then
			' The value is exactly the mediant fraction,
			' no more iterations required.
			Exit Do
		End If
		
		' Calculate Farey mediant fraction of current range for
		' next iteration
		Set Mediant = New Farey_Rational
		Mediant.Numerator = Lower.Numerator + Upper.Numerator
		Mediant.Denominator = Lower.Denominator + Upper.Denominator
	Loop
	
	' Return the bound that's closer to the actual value.
	If (Value - Lower.Value) <= (Upper.Value - Value) Then
		Set Farey = Lower
	Else
		Set Farey = Upper
	End If
End Function
