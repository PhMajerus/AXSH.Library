'****************************************************************************
'* ByteStrings.vbs  (VBScript Module)
'* 
'* Byte-string is a Basic special type used to store byte data in string
'* variables.
'* This comes from the early days of BASIC when arrays were not yet
'* available, making it possible to store one-dimensional arrays of bytes.
'* VBScript can also convert binary buffers (VT_ARRAY|VT_UI1) to
'* Byte-strings to process them using LenB, MidB, AscB,ChrB,... functions.
'* 
'* VBScript uses Unicode (UTF-16) instead of ASCII or ANSI for its strings,
'* making byte-strings less straightforward to access.
'* This module provides helper methods to convert such encoding to and
'* from ANSI strings (characters 0 to 255, no Unicode), UTF-8 strings
'* (converting UTF-16 to UTF-8) and arrays of bytes.
'* An error 6, "Overflow: 'CByte'" will be raised if a character of a
'* string or a value of an array cannot fit in a single byte.
'* 
'* Note the EncodeAnsiString and DecodeAnsiString depends on the Windows
'* ANSI codepage defined by the current script locale, use GetLocale and
'* SetLocale before calling the function if needed.
'* 
'* Note ByteStrings will get corrupted if they cross the 16-bit code
'* barrier, as Unicode (UTF-32) strings automatically get converted to
'* ANSI (8-bit) by the interoperability marshaler.
'* 
'* - Philippe Majerus, July 2018, updated November 2019.
'* 
'****************************************************************************

Option Explicit

' Returns a byte-string containing the UTF-8 bytes of a Unicode text string.
Public Function EncodeUTF8String(strData)
	Dim Length, I, C, C2, B1, B2, B3, B4
	Length = Len(strData)
	EncodeUTF8String = vbNullString
	I = 1
	While I <= Length
		C = AscW(Mid(strData, I, 1))
		
		' Combine any UTF-16 surrogate pair
		If C >= &hD800 And C <= &hDBFF Then
			I = I + 1
			C2 = AscW(Mid(strData, I, 1))
			If Not (C2 >= &hDC00 And C2 <= &hDFFF) Then
				' High surrogate without low surrogate
				Err.Raise 5, , "strData contains an invalid character"
			End If
			C = &h10000 + ((C - &hD800) * &h400) + (C2 - &hDC00)
		ElseIf C >= &hDC00 And C <= &hDFFF Then
			' Low surrogate without high surrogate before it
			Err.Raise 5, , "strData contains an invalid character"
		Else
			' AscW returns a signed int, fix it to a positive long.
			If C < 0 Then C = &h10000 + C
		End If
		
		' Encode code point
		If C < &h80 Then
			B1 = C ' 0xxxxxxx
			EncodeUTF8String = EncodeUTF8String & ChrB(B1)
		ElseIf C < &h800 Then
			B1 = (C \ &h40) Or &hC0   ' 110xxxxx
			B2 = (C And &h3F) Or &h80 ' 10xxxxxx
			EncodeUTF8String = EncodeUTF8String & (ChrB(B1) & ChrB(B2))
		ElseIf C < &h10000 Then
			B1 = (C \ &h1000) Or &hE0          ' 1110xxxx
			B2 = ((C \ &h40) And &h3F) Or &h80 ' 10xxxxxx
			B3 = (C And &h3F) Or &h80          ' 10xxxxxx
			EncodeUTF8String = EncodeUTF8String & (ChrB(B1) & ChrB(B2) & ChrB(B3))
		Else
			B1 = (C \ &h40000) Or &hF0           ' 11110xxx
			B2 = ((C \ &h1000) And &h3F) Or &h80 ' 10xxxxxx
			B3 = ((C \ &h40) And &h3F) Or &h80   ' 10xxxxxx
			B4 = (C And &h3F) Or &h80            ' 10xxxxxx
			EncodeUTF8String = EncodeUTF8String & (ChrB(B1) & ChrB(B2) & ChrB(B3) & ChrB(B4))
		End If
		' Loop
		I = I + 1
	WEnd
End Function

' Returns a text string from a byte-string containing UTF-8 encoded characters values.
Public Function DecodeUTF8String (strBytes)
	Dim Length, I, C, B1, B2, B3, B4
	DecodeUTF8String = vbNullString
	Length = LenB(strBytes)
	I = 1
	While I <= Length
		C = vbNullString ' flag to check for error when we're done with sequence
		
		' Get and check first byte
		B1 = AscB(MidB(strBytes, I, 1))
		I = I + 1
		
		If (B1 And &h80) = 0 Then
			' One byte character
			B1 = B1 And &h7F ' 0xxxxxxx
			C = ChrW(B1)
		ElseIf I <= Length Then
			' Get and check second byte
			B2 = AscB(MidB(strBytes, I, 1))
			I = I + 1
			If (B2 And &hC0) = &h80 Then
				B2 = B2 And &h3F ' 10xxxxxx
				
				If (B1 And &hE0) = &hC0 Then
					' Two bytes character
					B1 = B1 And &h1F ' 110xxxxx
					C = ChrW((B1 * &h40) + B2)
				ElseIf I <= Length Then
					' Get and check third byte
					B3 = AscB(MidB(strBytes, I, 1))
					I = I + 1
					If ((B3 And &hC0) = &h80) Then
						B3 = B3 And &h3F ' 10xxxxxx
						
						If (B1 And &hF0) = &hE0 Then
							' Three bytes character
							B1 = B1 And &h0F ' 1110xxxx
							C = ChrW((B1 * &h1000) + (B2 * &h40) + B3)
						ElseIf (I <= Length) Then
							' Get and check forth byte
							B4 = AscB(MidB(strBytes, I, 1))
							I = I + 1
							If ((B4 And &hC0) = &h80) Then
								B4 = B4 And &h3F ' 10xxxxxx
								
								If (B1 And &hF8) = &hF0 Then
									' Four bytes character
									B1 = B1 And &h07 ' 11110xxx
									' Character from supplementary plane, requires UTF-16 encoding
									C = (B1 * &h40000) + (B2 * &h1000) + (B3 * &h40) + B4
									C = C - &h010000
									C = ChrW(&hD800 + (C \ &h400)) & ChrW(&hDC00 + (C And &h3FF))
								End If
							End If
						End If
					End If
				End If
			End If
		End If
		
		If C = vbNullString Then
			Err.Raise 5, , "strBytes is not a valid UTF-8 encoded byte-string"
		End If
		DecodeUTF8String = DecodeUTF8String & C
	WEnd
End Function

' Returns a byte-string containing the bytes of an ANSI text string.
' Warning: This method will silently misencode any character not part of the current ANSI codepage.
Public Function EncodeAnsiString (strData)
	Dim Length, I, Char, Val
	Length = Len(strData)
	EncodeAnsiString = vbNullString
	For I = 1 To Length
		Val = Asc(Mid(strData, I, 1))
		EncodeAnsiString = EncodeAnsiString & ChrB(Val)
	Next
End Function

' Returns a text string from a byte-string containing ANSI characters values.
Public Function DecodeAnsiString (strBytes)
	Dim Length, I, Val
	Length = LenB(strBytes)
	DecodeAnsiString = vbNullString
	For I = 1 To Length
		Val = AscB(MidB(strBytes, I, 1))
		DecodeAnsiString = DecodeAnsiString & Chr(Val)
	Next
End Function

' Returns a byte-string containing the bytes from the array.
Public Function EncodeByteArray (aBytes)
	If Not IsRank1Array(aBytes) Then
		Err.Raise 5, , "aBytes must be a 1-dimensional array"
	End If
	
	Dim Length, I, Val
	Length = UBound(aBytes) - LBound(aBytes)
	EncodeByteArray = vbNullString
	For I = 0 To Length
		Val = CByte(aBytes(I+LBound(aBytes)))
		EncodeByteArray = EncodeByteArray & ChrB(Val)
	Next
End Function

' Returns an array of bytes from a byte-string.
Public Function DecodeByteArray (strBytes)
	Dim Length, I, aBytes(), Val
	Length = LenB(strBytes)
	ReDim aBytes(Length-1)
	For I = 1 To Length
		Val = AscB(MidB(strBytes, I, 1))
		aBytes(I-1) = Val
	Next
	DecodeByteArray = aBytes
End Function

' Returns a byte-string containing the the bytes of hexadecimal pairs of characters of a string
Public Function EncodeHexString (strHex)
	Dim Length, I
	Length = Len(strHex)
	If Length Mod 2 <> 0 Then
		Err.Raise 5, , "strHex is not a valid Hex string"
	End If
	EncodeHexString = vbNullString
	For I = 1 To Length Step 2
		EncodeHexString = EncodeHexString & ChrB(CByte("&h"&Mid(strHex,I,2)))
	Next
End Function

' Returns an hexadecimal string from a byte-string.
Public Function DecodeHexString (strBytes)
	Dim Length, I
	Length = LenB(strBytes)
	DecodeHexString = vbNullString
	For I = 1 To Length
		DecodeHexString = DecodeHexString & Right("0" & Hex(AscB(MidB(strBytes,I,1))), 2)
	Next
End Function

' Helper function to verify a variant is a rank 1 array.
Private Function IsRank1Array(Array)
	On Error Resume Next
	Call UBound(Array,1)
	IsRank1Array = (Err.Number = 0)
	Call UBound(Array,2)
	If Err.Number = 0 Then
		IsRank1Array = False
	End If
	On Error GoTo 0 ' also clears Err
End Function
