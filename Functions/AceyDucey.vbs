'
' Acey Ducey game for ActiveScript Shell
' 
' VBScript procedure version by Philippe Majerus
' Based on original BASIC version by by Bill Palmby or Prairie View, Illinois
' It was the first game of the book Basic Computer Games, published by Creative Computing in 1978.
'

Option Explicit

Sub AceyDucey
	Dim Q, A, B, T, M, C, CardName
	CardName = Array("2","3","4","5","6","7","8","9","10","Jack","Queen","King","Ace")
	
	' Welcome message
	AXSH.Echo
	AXSH.Echo " " & Chr(27)&"[44;90m?"&ChrW(&h2500)&ChrW(&h2500)&ChrW(&h2510)&Chr(27)&"[107m "&Chr(27)&"[47m "&Chr(27)&"[m" & "   Acey Ducey card game"
	AXSH.Echo " " & Chr(27)&"[44;90m"&ChrW(&h2502)&"[]"&ChrW(&h2502)&Chr(27)&"[107m "&Chr(27)&"[47m "&Chr(27)&"[m" & "   Original game by Bill Palmby"
	AXSH.Echo " " & Chr(27)&"[44;90m"&ChrW(&h2514)&ChrW(&h2500)&ChrW(&h2500)&"?"&Chr(27)&"[107;30m"&ChrW(&h2660)&Chr(27)&"[47;31m"&ChrW(&h2665)&Chr(27)&"[m" & "   Reprogrammed game by Philippe Majerus"
	AXSH.Echo
	
	' Rules
	AXSH.Echo "Acey-Ducey is played in the following manner:"
	AXSH.Echo "The dealer (computer) deals two cards face up."
	AXSH.Echo "You have an option to bet or not bet depending"
	AXSH.Echo "on whether or not you feel the card will have"
	AXSH.Echo "a value between the first two."
	AXSH.Echo "If you do not want to bet, input a 0."
	
	Q = 100
	
	Do
		' Start round
		AXSH.Echo
		AXSH.Echo "You now have "& Q &" dollars."
		AXSH.Echo
		
		' Deal two cards
		AXSH.Echo "Here are your next two cards:"
		' Pick a random card for A as a number between 0 and 12
		A = Int(13*RND())
		' Pick a random card for B, but to avoid being the same value as A,
		' get a number between 0 and 11 and fix to 12 by incrementing if it's >= A.
		' We also simply swap them if B < A.
		' This avoids having to loop on generating random numbers until we are lucky
		' enough to get two with B > A like the original version did.
		B = Int(12*Rnd())
		If B>=A Then
			B = B + 1
		Else
			' Swap to have A be the lowest one
			T = A
			A = B
			B = T
		End If
		' Show the two cards
		AXSH.Echo CardName(A)
		AXSH.Echo CardName(B)
		AXSH.Echo
		
		' Get player's bet
		Do
			AXSH.Echo "What is your bet?"
			M = Null
			On Error Resume Next
			Do
				Err.Clear
				M = CInt(AXSH.GetLine)
			Loop While (Err.Number <> 0) Or (M < 0)
			On Error GoTo 0
			If M>Q Then
				AXSH.Echo
				AXSH.Echo "Sorry, my friend, but you bet too much."
				AXSH.Echo "You have only "& Q &" dollars to bet."
				M = Null
			End If
		Loop While IsNull(M)
		AXSH.Echo
		If M = 0 Then
			AXSH.Echo "Chicken!!"
		Else
			' Pick and show third card
			C = Int(13*Rnd())
			AXSH.Echo CardName(C)
			
			' Check result
			If C > A And C < B Then
				' Won
				AXSH.Echo "You win!!!"
				Q = Q + M
			Else
				' Lost
				AXSH.Echo "Sorry, you lose"
				Q = Q - M
				
				If Q <= 0 Then
					' Game over
					AXSH.Echo
					AXSH.Echo "Sorry, friend, but you blew your wad."
					AXSH.Echo "Hope you had fun though!"
					Exit Sub
				End If
			End If
		End If
	Loop While True
End Sub
