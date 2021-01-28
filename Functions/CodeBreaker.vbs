'
' A game of Bulls & Cows using VT colors
' 
' Usage:
' Codebreaker 6,4,10 ' for a standard difficulty game
' 
' - Philippe Majerus, March 2019.
'

Option Explicit

Function Codebreaker_InputGuess (Console, CColors, CHoles, MinColor, MaxColor, Digits)
	Dim CSI, EL, SCP, RCP
	CSI = Chr(27) & "["  ' Control Sequence Introducer
	EL  = CSI & "K"  ' Erase in Line
	SCP = CSI & "s"  ' Save Cursor Position
	RCP = CSI & "u"  ' Restore Cursor Position
	
	Dim Guess, Key, Digit
	Guess = ""
	Console.Write "Guess: " & SCP
	Do
		Key = AXSH.GetChar(False)
		If Key = Chr(8) And Len(Guess) > 0 Then ' Backspace
			Guess = Mid(Guess,1,Len(Guess)-1)
			Console.Write RCP & Codebreaker_CodeToString(Guess, Digits) & EL
		ElseIf IsNumeric(Key) Then
			Key = CInt(Key)
			If Len(Guess) < CHoles And Key >= MinColor And Key <= MaxColor Then
				Guess = Guess & Key
				Console.Write RCP & Codebreaker_CodeToString(Guess, Digits) & EL
			End If
		End If
	Loop Until Key=vbCr And Len(Guess) = CHoles
	Codebreaker_InputGuess = Guess
End Function

Function Codebreaker_CodeToString (Code, Digits)
	Dim SR, L, I
	SR = ""
	L = Len(Code)
	For I = 1 To L
		SR = SR & Digits(Mid(Code,I,1))
	Next
	SR = SR & Chr(27)&"[m"
	Codebreaker_CodeToString = SR
End Function

Function Codebreaker_MatchesToString (Matches)
	Codebreaker_MatchesToString = String(Matches \ 2, ":") & String(Matches Mod 2, ".")
End Function

' Call with values 6, 4, 10 for default difficulty.
Sub Codebreaker (Colors, Holes, Tries)
	Dim CColors, CHoles, CTries, MinColor, MaxColor
	Dim Console, CSI, CHA, EL, RCP
	Dim Digits, Code, Guess, TriesCount
	Dim I, J, ACode, AGuess, Bulls, Cows
	
	' Handle and convert arguments
	If Not IsNumeric(Colors) Then Err.Raise 5, , "Colors must be a number from 1 to 9, standard is 6"
	CColors = CInt(Colors)
	If CColors < 1 Or CColors > 9 Then Err.Raise 5, , "Colors must be a number from 1 to 9, standard is 6"
	If Not IsNumeric(Holes) Then Err.Raise 5, , "Holes must be a number from 1 to 10, standard is 4"
	CHoles = CInt(Holes)
	If CHoles < 1 Or CHoles > 10 Then Err.Raise 5, , "Holes must be a number from 1 to 10, standard is 4"
	If Not IsNumeric(Tries) Then Err.Raise 5, , "Tries must be a number from 1 to 99, standard is 10"
	CTries = CInt(Tries)
	If CTries < 1 Or CTries > 99 Then Err.Raise 5, , "Tries must be a number from 1 to 99, standard is 10"
	
	If CColors = 9 Then
		MinColor = 0
		MaxColor = 8
	Else
		MinColor = 1
		MaxColor = CColors
	End If
	
	Set Console = CreateObject("Majerus.Console")
	CSI = Chr(27) & "["  ' Control Sequence Introducer
	CHA = CSI & "G"  ' Cursor Horizontal Absolute
	EL  = CSI & "K"  ' Erase in Line
	
	' Colors to indicate codes
	Digits = Array( _
		CSI&"90m(0)",                     _
		CSI&"94m("&CSI&"34m1"&CSI&"94m)", _
		CSI&"92m("&CSI&"32m2"&CSI&"92m)", _
		CSI&"96m("&CSI&"36m3"&CSI&"96m)", _
		CSI&"91m("&CSI&"31m4"&CSI&"91m)", _
		CSI&"95m("&CSI&"35m5"&CSI&"95m)", _
		CSI&"93m("&CSI&"33m6"&CSI&"93m)", _
		CSI&"97m("&CSI&"37m7"&CSI&"97m)", _
		CSI&"90m("&CSI&"37m8"&CSI&"90m)")
	
	' Title
	Console.WriteLine vbCrLf&" "&CSI&"32mo"&CSI&"36mo"&CSI&"37mo"&CSI&"35mo"&CSI&"31m."&CSI&"90m."&CSI&"m   "&CSI&"91m_  _  _  _ "&CSI&"37m _  _  _  _     _  _"&CSI&"m"&vbCrLf&" "&CSI&"35mo"&CSI&"36mo"&CSI&"33mo"&CSI&"32mo"&CSI&"31m:"&CSI&"90m."&CSI&"m  "&CSI&"91m| `| || \|_`"&CSI&"37m|_)|_)|_`|_||_/|_`|_)"&CSI&"m"&vbCrLf&" "&CSI&"33mo"&CSI&"36mo"&CSI&"31mo"&CSI&"32mo"&CSI&"31m::"&CSI&"m  "&CSI&"91m|_,|_||_/|_,"&CSI&"37m|_)| \|_,| || \|_,| \"&CSI&"m"&vbCrLf
	
	' Make sure the pseudorandom number generator has been initialized.
	' Randomize PRNG seed only once, do it if current seed is VB's initial seed.
	If Rnd(0) = 0.01953125 Then Randomize
	
	' Generate random code
	Code = ""
	For I = 1 To CHoles
		Code = Code & CStr(Int((Rnd * CColors) + MinColor))
	Next
	
	' Game
	ReDim ACode(CHoles-1)
	ReDim AGuess(CHoles-1)
	Console.WriteLine "Try to guess my secret code in "& CTries &" tries or less."
	Console.WriteLine CSI&"90m("& CHoles &" digits long, "& MinColor &" to "& MaxColor &", repeats allowed)"&CSI&"m"&vbCrLf
	
	For TriesCount = 1 To CTries
		Guess = Codebreaker_InputGuess(Console, CColors, CHoles, MinColor, MaxColor, Digits)
		Console.Write CHA & "Try#" & Left(CStr(TriesCount)&" ", 2) & " " & Codebreaker_CodeToString(Guess, Digits) & EL
		
		' Compute hints
		For I = 0 To CHoles-1
			ACode(I) = Mid(Code, I+1, 1)
			AGuess(I) = Mid(Guess, I+1, 1)
		Next
		Bulls = 0
		For I = 0 To CHoles-1
			If AGuess(I) = ACode(I) Then
				ACode(I) = Empty
				AGuess(I) = Empty
				Bulls = Bulls + 1
			End If
		Next
		Cows = 0
		For I = 0 To CHoles-1
			If Not IsEmpty(AGuess(I)) Then
				For J = 0 To CHoles-1
					If AGuess(I) = ACode(J) Then
						ACode(J) = Empty
						Cows = Cows + 1
						Exit For
					End If
				Next
			End If
		Next
		Console.WriteLine "  "&CSI&"91m"& Codebreaker_MatchesToString(Bulls) &CSI&"97m"+ Codebreaker_MatchesToString(Cows) &CSI&"m "&vbTab&"("& Bulls &" in right position, "& Cows &" in different position)"
		
		If Guess = Code Then
			Exit For ' early exit if code has been broken
		End If
	Next
	
	' Check if player won or failed
	If Guess = Code Then
		Console.WriteLine "You found my secret code in " & TriesCount & " tries!"
	Else
		Console.WriteLine "You failed, my code was"
		Console.WriteLine "       " & Codebreaker_CodeToString(Code, Digits)
	End If
End Sub
