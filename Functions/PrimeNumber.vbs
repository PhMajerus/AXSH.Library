' 
' Compute the first prime number following a given number, or the number
' itself if it is prime already.
' This function can be called repeatedly with its previous result +1 to
' step through prime numbers, or can be called with an arbitrary number
' to get the first prime number greater than or equal to it.
' It stops at 2147483629, which is the largest prime number VBScript can
' represent as a Long.
' 
' Example usage to list all prime numbers until it errors with overflow:
' I=0: Do: I=PrimeNumber(I+1): Echo I: Loop While True
' 

Option Explicit

Function PrimeNumber (Number)
	If Number < 0 Or Number <> Int(Number) Then
		Err.Raise 5, , "Number must be a positive integer"
	End If
	
	' VBScript uses signed Int (16-bit) and Long (32-bit) to represent integers
	' We cannot check for prime numbers above the largest positive Long, as it
	' would be handled as a Double and overflows when the Mod operator converts
	' it to a Long.
	Const MAX_LONG = 2147483647 ' literal for 2^31-1
	Dim IsPrime, I
	
	For PrimeNumber = Number To MAX_LONG
		' Check if number is prime
		' Handle corner cases for values 1, 2, and 3 first
		If PrimeNumber = 1 Then
			IsPrime = False
		ElseIf (PrimeNumber = 2) Or (PrimeNumber = 3) Then
			IsPrime = True
		ElseIf (PrimeNumber Mod 2 = 0) Or (PrimeNumber Mod 3 = 0) Then
			' It's a multiple of 2 or 3
			IsPrime = False
		Else
			' Handle other cases
			I = 5
			IsPrime = True
			Do While (I^2 <= PrimeNumber)
				If (PrimeNumber Mod I = 0) Or (PrimeNumber Mod (I+2) = 0) Then
					IsPrime = False
					Exit Do
				End If
				I = I + 6
			Loop
		End If
		
		If IsPrime Then Exit Function
	Next
	
	Err.Raise 6, "PrimeNumber error", "Overflow: next prime number is too large"
End Function
