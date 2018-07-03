'****************************************************************************
'* ByteStrings.vbs  (VBScript Module)
'* 
'* Byte-string is a Basic special type used to store byte data in string
'* variables.
'* This comes from the early days of BASIC when arrays were not yet
'* available, making it possible to store one-dimensional arrays of bytes.
'* 
'* VBScript uses Unicode (UTF-16) instead of ANSI for its strings, making
'* byte-strings less straightforward to access.
'* This module provides helper methods to convert such encoding to and from
'* ANSI strings (characters 0 to 255, no Unicode), Unicode (converting
'* UTF-16 to UTF-8) and arrays of bytes.
'* An error 6, "Overflow: 'CByte'" will be raised if a character of a string
'* or a value of an array cannot fit in a single byte.
'* 
'* Note ByteStrings will get corrupted if they cross the 16-bit code
'* barrier, as Unicode (UTF-32) strings automatically get converted to
'* ANSI (8-bit) by the interoperability marshaller.
'* 
'* - Philippe Majerus, July 2018
'* 
'****************************************************************************

Option Explicit

' Returns a byte-string containing the UTF-8 bytes of a Unicode text string.
Public Function EncodeUTF8String(strData)
	Dim Length, I, strBytes, C, C2, B1, B2, B3, B4
	Length = Len(strData)
	strBytes = vbNullString
	I = 1
	While I <= Length
		C = AscW(Mid(strData, I, 1))
		If C < 0 Then C = &h10000 + C ' AscW returns a signed int, fix it to a positive long.
		
		' Combine any UTF-16 surrogate pair
		If C >= &hD800 And C <= &hDBFF Then
			I = I + 1
			C2 = AscW(Mid(strData, I, 1))
			If C2 < 0 Then C2 = &h10000 + C2 ' Fix signed int to positive long.
			If Not (C2 >= &hDC00 And C2 <= &hDFFF) Then
				' High surrogate without low surrogate
				Err.Raise 5, , "strData contains an invalid character"
			End If
			C = &h10000 + ((C - &hD800) * &h400) + (C2 - &hDC00)
		ElseIf C >= &hDC00 And C <= &hDFFF Then
			' Low surrogate without high surrogate before it
			Err.Raise 5, , "strData contains an invalid character"
		End If
		
		' Encode code point
		If C < &h80 Then
			B1 = C ' 0xxxxxxx
			strBytes = strBytes & ChrB(B1)
		ElseIf C < &h800 Then
			B1 = (C \ &h40) Or &hC0   ' 110xxxxx
			B2 = (C And &h3F) Or &h80 ' 10xxxxxx
			strBytes = strBytes & (ChrB(B1) & ChrB(B2))
		ElseIf C < &h10000 Then
			B1 = (C \ &h1000) Or &hE0          ' 1110xxxx
			B2 = ((C \ &h40) And &h3F) Or &h80 ' 10xxxxxx
			B3 = (C And &h3F) Or &h80          ' 10xxxxxx
			strBytes = strBytes & (ChrB(B1) & ChrB(B2) & ChrB(B3))
		Else
			B1 = (C \ &h40000) Or &hF0           ' 11110xxx
			B2 = ((C \ &h1000) And &h3F) Or &h80 ' 10xxxxxx
			B3 = ((C \ &h40) And &h3F) Or &h80   ' 10xxxxxx
			B4 = (C And &h3F) Or &h80            ' 10xxxxxx
			strBytes = strBytes & (ChrB(B1) & ChrB(B2) & ChrB(B3) & ChrB(B4))
		End If
		' Loop
		I = I + 1
	WEnd
	EncodeUTF8String = strBytes
End Function

' Returns a byte-string containing the bytes of an ANSI text string.
Public Function EncodeAnsiString (strData)
	Dim Length, I, strBytes, Char, Val
	Length = Len(strData)
	strBytes = vbNullString
	For I = 1 To Length
		' Convoluted Asc to catch Unicode chars overflows
		Val = CByte(AscW(Mid(strData, I, 1)))
		strBytes = strBytes & ChrB(Val)
	Next
	EncodeAnsiString = strBytes
End Function

' Returns a text string from a byte-string containing ANSI characters values.
Public Function DecodeAnsiString (strBytes)
	Dim Length, strAnsi, I, Val
	Length = LenB(strBytes)
	strAnsi = vbNullString
	For I = 1 To Length
		Val = AscB(MidB(strBytes, I, 1))
		strAnsi = strAnsi & Chr(Val)
	Next
	DecodeAnsiString = strAnsi
End Function

' Returns a byte-string containing the bytes from the array.
Public Function EncodeByteArray (aBytes)
	If Not IsRank1Array(aBytes) Then
		Err.Raise 5, , "aBytes must be a 1-dimensional array"
	End If
	
	Dim Length, I, strBytes, Val
	Length = UBound(aBytes) - LBound(aBytes)
	strBytes = vbNullString
	For I = 0 To Length
		Val = CByte(aBytes(I+LBound(aBytes)))
		strBytes = strBytes & ChrB(Val)
	Next
	EncodeByteArray = strBytes
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

' Helper function to verify a variant is a rank 1 array.
Private Function IsRank1Array(Array)
	On Error Resume Next
	Call UBound(Array,1)
	IsRank1Array = (Err.Number = 0)
	Call UBound(Array,2)
	If Err.Number = 0 Then
		IsRank1Array = False
	End If
	Err.Clear
	On Error GoTo 0
End Function
