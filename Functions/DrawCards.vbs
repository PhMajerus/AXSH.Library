' 
' Draw Cards for ActiveScript Shell with JScript.
' Shows random cards from a standard 52-cards deck.
' 
' - Philippe Majerus, January 2018.
' 

Option Explicit

' Make sure the pseudorandom number generator has been initialized.
' Randomize PRNG seed only once, do it if current seed is VB's initial seed.
If Rnd(0) = 0.01953125 Then Randomize

Sub DrawCards(CCards)
	' Prepare 52-cards deck
	Dim Deck, ESC, HL, VL, TL, TR, BL, BR, SS, HS, DS, CS
	ESC = Chr(27)
	HL = ChrW(&h2500)
	VL = ChrW(&h2502)
	TL = ChrW(&h250C)
	TR = ChrW(&h2510)
	BL = ChrW(&h2514)
	BR = ChrW(&h2518)
	SS = ChrW(&h2660)
	HS = ChrW(&h2665)
	DS = ChrW(&h2666)
	CS = ChrW(&h2663)
	Deck = Array( _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30mA    "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m  "&SS&"  "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m    A"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m2 "&SS&"  "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m     "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m  "&SS&" 2"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m3 "&SS&"  "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m  "&SS&"  "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m  "&SS&" 3"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m4"&SS&" "&SS&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m     "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m "&SS&" "&SS&"4"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m5"&SS&" "&SS&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m  "&SS&"  "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m "&SS&" "&SS&"5"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m6"&SS&" "&SS&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m "&SS&" "&SS&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m "&SS&" "&SS&"6"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m7"&SS&SS&SS&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m "&SS&" "&SS&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m "&SS&" "&SS&"7"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m8"&SS&SS&SS&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m "&SS&" "&SS&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m "&SS&SS&SS&"8"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m9"&SS&SS&SS&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m "&SS&SS&SS&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m "&SS&SS&SS&"9"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m10"&HL&TR&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m "&VL&SS&VL&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m "&BL&HL&"10"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30mJ"&SS&ESC&"[94m"&HL&TR&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&" "&ESC&"[94m"&VL&ESC&"[30m/"&ESC&"[94m"&VL&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&" "&ESC&"[94m"&BL&HL&ESC&"[30m"&SS&"J"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30mQ"&SS&ESC&"[94m"&HL&TR&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&" "&ESC&"[94m"&VL&ESC&"[30m/"&ESC&"[94m"&VL&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&" "&ESC&"[94m"&BL&HL&ESC&"[30m"&SS&"Q"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30mK"&SS&ESC&"[94m"&HL&TR&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&" "&ESC&"[94m"&VL&ESC&"[30m/"&ESC&"[94m"&VL&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&" "&ESC&"[94m"&BL&HL&ESC&"[30m"&SS&"K"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31mA    "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m  "&HS&"  "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m    A"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m2 "&HS&"  "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m     "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m  "&HS&" 2"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m3 "&HS&"  "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m  "&HS&"  "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m  "&HS&" 3"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m4"&HS&" "&HS&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m     "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m "&HS&" "&HS&"4"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m5"&HS&" "&HS&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m  "&HS&"  "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m "&HS&" "&HS&"5"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m6"&HS&" "&HS&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m "&HS&" "&HS&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m "&HS&" "&HS&"6"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m7"&HS&HS&HS&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m "&HS&" "&HS&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m "&HS&" "&HS&"7"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m8"&HS&HS&HS&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m "&HS&" "&HS&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m "&HS&HS&HS&"8"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m9"&HS&HS&HS&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m "&HS&HS&HS&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m "&HS&HS&HS&"9"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m10"&HL&TR&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m "&VL&HS&VL&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m "&BL&HL&"10"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31mJ"&HS&ESC&"[94m"&HL&TR&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&" "&ESC&"[94m"&VL&ESC&"[31m/"&ESC&"[94m"&VL&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&" "&ESC&"[94m"&BL&HL&ESC&"[31m"&HS&"J"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31mQ"&HS&ESC&"[94m"&HL&TR&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&" "&ESC&"[94m"&VL&ESC&"[31m/"&ESC&"[94m"&VL&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&" "&ESC&"[94m"&BL&HL&ESC&"[31m"&HS&"Q"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31mK"&HS&ESC&"[94m"&HL&TR&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&" "&ESC&"[94m"&VL&ESC&"[31m/"&ESC&"[94m"&VL&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&" "&ESC&"[94m"&BL&HL&ESC&"[31m"&HS&"K"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31mA    "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m  "&DS&"  "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m    A"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m2 "&DS&"  "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m     "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m  "&DS&" 2"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m3 "&DS&"  "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m  "&DS&"  "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m  "&DS&" 3"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m4"&DS&" "&DS&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m     "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m "&DS&" "&DS&"4"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m5"&DS&" "&DS&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m  "&DS&"  "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m "&DS&" "&DS&"5"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m6"&DS&" "&DS&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m "&DS&" "&DS&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m "&DS&" "&DS&"6"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m7"&DS&DS&DS&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m "&DS&" "&DS&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m "&DS&" "&DS&"7"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m8"&DS&DS&DS&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m "&DS&" "&DS&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m "&DS&DS&DS&"8"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m9"&DS&DS&DS&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m "&DS&DS&DS&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m "&DS&DS&DS&"9"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m10"&HL&TR&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m "&VL&DS&VL&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31m "&BL&HL&"10"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31mJ"&DS&ESC&"[94m"&HL&TR&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&" "&ESC&"[94m"&VL&ESC&"[31m/"&ESC&"[94m"&VL&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&" "&ESC&"[94m"&BL&HL&ESC&"[31m"&DS&"J"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31mQ"&DS&ESC&"[94m"&HL&TR&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&" "&ESC&"[94m"&VL&ESC&"[31m/"&ESC&"[94m"&VL&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&" "&ESC&"[94m"&BL&HL&ESC&"[31m"&DS&"Q"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[31mK"&DS&ESC&"[94m"&HL&TR&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&" "&ESC&"[94m"&VL&ESC&"[31m/"&ESC&"[94m"&VL&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&" "&ESC&"[94m"&BL&HL&ESC&"[31m"&DS&"K"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30mA    "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m  "&CS&"  "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m    A"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m2 "&CS&"  "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m     "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m  "&CS&" 2"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m3 "&CS&"  "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m  "&CS&"  "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m  "&CS&" 3"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m4"&CS&" "&CS&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m     "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m "&CS&" "&CS&"4"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m5"&CS&" "&CS&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m  "&CS&"  "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m "&CS&" "&CS&"5"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m6"&CS&" "&CS&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m "&CS&" "&CS&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m "&CS&" "&CS&"6"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m7"&CS&CS&CS&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m "&CS&" "&CS&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m "&CS&" "&CS&"7"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m8"&CS&CS&CS&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m "&CS&" "&CS&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m "&CS&CS&CS&"8"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m9"&CS&CS&CS&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m "&CS&CS&CS&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m "&CS&CS&CS&"9"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m10"&HL&TR&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m "&VL&CS&VL&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30m "&BL&HL&"10"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30mJ"&CS&ESC&"[94m"&HL&TR&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&" "&ESC&"[94m"&VL&ESC&"[30m/"&ESC&"[94m"&VL&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&" "&ESC&"[94m"&BL&HL&ESC&"[30m"&CS&"J"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30mQ"&CS&ESC&"[94m"&HL&TR&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&" "&ESC&"[94m"&VL&ESC&"[30m/"&ESC&"[94m"&VL&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&" "&ESC&"[94m"&BL&HL&ESC&"[30m"&CS&"Q"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m"), _
		Array(ESC&"[107;37m"&TL&HL&HL&HL&HL&HL&TR&ESC&"[m", ESC&"[107;37m"&VL&ESC&"[30mK"&CS&ESC&"[94m"&HL&TR&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&" "&ESC&"[94m"&VL&ESC&"[30m/"&ESC&"[94m"&VL&" "&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&VL&" "&ESC&"[94m"&BL&HL&ESC&"[30m"&CS&"K"&ESC&"[37m"&VL&ESC&"[m", ESC&"[107;37m"&BL&HL&HL&HL&HL&HL&BR&ESC&"[m") _
		)
	
	If CCards < 1 Or CCards > UBound(Deck)+1 Then
		Err.Raise 5,,"CCards must be between 1 and "&CStr(UBound(Deck)+1)
	End If
	
	' Build hand
	Dim Hand(), I, CI
	ReDim Hand(CCards-1)
	For I = 0 To CCards-1
		' Pick a card in deck
		CI = Int(Rnd*(UBound(Deck)+1))
		' Copy card to hand
		Hand(I) = Deck(CI)
		' Remove card from deck
		Arrays.Splice Deck, CI, 1, Empty
	Next
	
	' Show hand
	Dim A(4), L
	For L = 0 To 4
		A(L) = ""
		For I = LBound(Hand) To UBound(Hand)
			A(L) = A(L) & " " & Hand(I)(L)
		Next
	Next
	AXSH.Echo Join(A, vbNewLine)
End Sub
