'****************************************************************************
'* MorseCode.vbs  (VBScript Module)
'* 
'* ITU Morse Code encoder for VBScript.
'* 
'* This module provides a single encode method to convert a string into
'* its morse code representation using middle dots and dashes.
'* Based on standard ITU-R M.1677-1 (https://www.itu.int/rec/R-REC-M.1677)
'* 
'* - Philippe Majerus, February 2018, updated October 2020.
'* 
'****************************************************************************

Option Explicit

' Characters used for morse code
Private Dot, Dash
Dot = ChrW(&h00B7) ' Middle Dot
Dash = ChrW(&h002D) ' Hyphen-Minus

' International Morse Code (ITU) as Unicode strings
Private EncodingTable
Set EncodingTable = CreateObject("Scripting.Dictionary")
With EncodingTable
	.Add "A", Dot & Dash
	.Add "B", Dash & Dot & Dot & Dot
	.Add "C", Dash & Dot & Dash & Dot
	.Add "D", Dash & Dot & Dot
	.Add "E", Dot
	.Add "F", Dot & Dot & Dash & Dot
	.Add "G", Dash & Dash & Dot
	.Add "H", Dot & Dot & Dot & Dot
	.Add "I", Dot & Dot
	.Add "J", Dot & Dash & Dash & Dash
	.Add "K", Dash & Dot & Dash
	.Add "L", Dot & Dash & Dot & Dot
	.Add "M", Dash & Dash
	.Add "N", Dash & Dot
	.Add "O", Dash & Dash & Dash
	.Add "P", Dot & Dash & Dash & Dot
	.Add "Q", Dash & Dash & Dot & Dash
	.Add "R", Dot & Dash & Dot
	.Add "S", Dot & Dot & Dot
	.Add "T", Dash
	.Add "U", Dot & Dot & Dash
	.Add "V", Dot & Dot & Dot & Dash
	.Add "W", Dot & Dash & Dash
	.Add "X", Dash & Dot & Dot & Dash
	.Add "Y", Dash & Dot & Dash & Dash
	.Add "Z", Dash & Dash & Dot & Dot
	.Add "1", Dot & Dash & Dash & Dash & Dash
	.Add "2", Dot & Dot & Dash & Dash & Dash
	.Add "3", Dot & Dot & Dot & Dash & Dash
	.Add "4", Dot & Dot & Dot & Dot & Dash
	.Add "5", Dot & Dot & Dot & Dot & Dot
	.Add "6", Dash & Dot & Dot & Dot & Dot
	.Add "7", Dash & Dash & Dot & Dot & Dot
	.Add "8", Dash & Dash & Dash & Dot & Dot
	.Add "9", Dash & Dash & Dash & Dash & Dot
	.Add "0", Dash & Dash & Dash & Dash & Dash
	.Add " ", " "
	.Add ".", Dot & Dash & Dot & Dash & Dot & Dash
	.Add ",", Dash & Dash & Dot & Dot & Dash & Dash
	.Add ":", Dash & Dash & Dash & Dot & Dot & Dot
	.Add "?", Dot & Dot & Dash & Dash & Dot & Dot
	.Add "'", Dot & Dash & Dash & Dash & Dash & Dot
	.Add "-", Dash & Dot & Dot & Dot & Dot & Dash
	.Add "/", Dash & Dot & Dot & Dash & Dot
	.Add "(", Dash & Dot & Dash & Dash & Dot
	.Add ")", Dash & Dot & Dash & Dash & Dot & Dash
	.Add """", Dot & Dash & Dot & Dot & Dash & Dot
	.Add "=", Dash & Dot & Dot & Dot & Dash
	.Add "+", Dot & Dash & Dot & Dash & Dot
	.Add ChrW(&h00D7), Dash & Dot & Dot & Dash ' multiplication sign
	.Add "@", Dot & Dash & Dash & Dot & Dash & Dot
End With

Public Function Encode (Text)
	Dim UText, Length, SB(), I, Char
	UText = UCase(Text)
	Length = Len(UText)
	ReDim SB(Length-1)
	For I = 0 To Length-1
		Char = Mid(UText, 1+I, 1)
		If Not EncodingTable.Exists(Char) Then
			Err.Raise 5, , "Character """ & Char & """ is not available in ITU Morse Code"
		End If
		SB(I) = EncodingTable(Char)
	Next
	Encode = Join(SB, Chr(160))
End Function

Public Sub AudioPlayback (MorseCode)
	Dim Con, Sep, S, L, I
	Const msDot = 50 ' Duration of a dot
	Set Con = CreateObject("Majerus.Console")
	Sep = ChrW(&hE000)
	' Convert inter-words spaces into specific symbols
	With New RegExp
		.Pattern = "[\s\xA0]{2,3}"
		.Global = True
		S = .Replace(MorseCode, Sep)
	End With
	' Convert middle dot to normal dot and non-break space to normal space
	S = Replace(S, Dot, ".")
	S = Replace(S, Chr(160), " ")
	
	L = Len(S)
	For I = 1 To L
		Select Case Mid(S, I, 1)
			Case "."
				Con.Beep 700, msDot
			Case "-"
				Con.Beep 700, msDot*3
			Case " "
				AXSH.Sleep msDot*3
			Case Sep
				AXSH.Sleep msDot*7
			Case Else
				Err.Raise 5, , "MorseCode contains unsupported characters"
		End Select
		AXSH.Sleep msDot
	Next
End Sub
