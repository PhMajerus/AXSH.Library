'****************************************************************************
'* ByteStrings.vbs  (VBScript Module)
'* 
'* Byte-string is a Basic special type used to store byte data in string
'* variables.
'* This comes from the early days of BASIC when arrays were not yet
'* available, making it possible to store one-dimensional arrays of bytes.
'* 
'* VBScript uses Unicode instead of ANSI for its strings, making
'* byte-strings less straightforward to access.
'* This module provides helper methods to convert such encoding to and from
'* ANSI strings (characters 0 to 255, no Unicode), and arrays of bytes.
'* 
'* - Philippe Majerus
'* 
'****************************************************************************

Option Explicit

' Returns a byte-string containing the bytes of an ANSI text string.
Public Function EncodeAnsiString (strData)
	Dim Length, I, strBytes, Val
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
