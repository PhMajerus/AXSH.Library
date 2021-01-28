'
' Higher or Lower game for Majerus.net ActiveScript Shell with VBScript
' Philippe Majerus, July 10, 2017
'

Option Explicit

Sub HigherOrLower
	Dim vbEsc, Number, Tries, Prompts, Guess
	vbEsc = Chr(27)
	
	Echo vbCrLf&"  "&vbEsc&"[92m/\"&vbEsc&"[31m"&ChrW(&h2502)&vbEsc&"[91m"&ChrW(&h2502)&"    "&vbEsc&"[92m)_/"&ChrW(&h2219)&"_ / _ _"&vbEsc&"[m"&vbCrLf&" "&vbEsc&"[92m/"&vbEsc&"[32m__"&vbEsc&"[92m\"&vbEsc&"[31m"&ChrW(&h203E)&vbEsc&"[91m/  "&vbEsc&"[92m/ //(//)(-/   "&vbEsc&"[91m/      "&vbEsc&"[91m_ _"&vbEsc&"[m"&vbCrLf&"  "&vbEsc&"[92m"&ChrW(&h2502)&ChrW(&h2502)&vbEsc&"[31m\"&vbEsc&"[91m/      "&vbEsc&"[92m_/     "&vbEsc&"[90mor "&vbEsc&"[91m(_()((/(-/"&vbEsc&"[m"&vbCrLf
	
	' Make sure the pseudorandom number generator has been initialized.
	' Randomize PRNG seed only once, do it if current seed is VB's initial seed.
	If Rnd(0) = 0.01953125 Then Randomize
	
	' Pick a random number between 1 and 100
	Number = Int(Rnd * 100 + 1)
	
	Tries = 1
	Prompts = Array("Make your first guess.","Make your second guess.","Make your third guess.","Make your fourth guess.","Make your fifth guess. "&vbEsc&"[90m"&ChrW(&h266A)&vbEsc&"[m","Make you sixth and last guess. "&vbEsc&"[90m"&ChrW(&h266B)&vbEsc&"[m")
	
	Echo "I'm thinking of a number between 1 and 100."
	Echo "Try to guess my number in six tries at most."

	For Tries = 1 To 6
		Echo
		Echo vbEsc&"[94m?"&vbEsc&"[m " & Prompts(Tries-1)
		
		' Get a valid input from the user
		Guess = Null
		On Error Resume Next
		Do
			Err.Clear
			Guess = CInt(GetLine)
		Loop While (Err.Number <> 0) Or (Guess < 1) Or (Guess > 100)
		On Error GoTo 0
		
		If Guess = Number Then
			Echo
			If Tries = 1 Then
				Echo vbEsc&"[93m"&ChrW(&h263B)&vbEsc&"[m Incredible! You guessed my number on your first try!"
			Else
				Echo vbEsc&"[93m"&ChrW(&h263B)&vbEsc&"[m Congratulations! You guessed my number in " & Tries & " tries."
			End If
			Exit For
		ElseIf Guess < Number Then
			Echo vbEsc&"[92m"&ChrW(&h2191)&vbEsc&"[m My number is higher than " & Guess & "."
		Else'If Guess > Number Then
			Echo vbEsc&"[91m"&ChrW(&h2193)&vbEsc&"[m My number is lower than " & Guess & "."
		End If
	Next
	
	If Tries > 6 Then
		Echo
		Echo vbEsc&"[95m"&ChrW(&h2020)&vbEsc&"[m You failed! My number was " & Number & "."
	End If
	
	Echo
End Sub
