'
' Encodes a text string into ASCII HTML-safe markup by replacing reserved
' markup characters and non-ASCII characters by numeric character references
' and character entity references.
' 
' This encoding is similar to Server.HTMLEncode method in Classic ASP:
' https://docs.microsoft.com/previous-versions/iis/6.0-sdk/ms525347%28v%3dvs.90%29
' 
' Philippe Majerus, February 2020
'

Option Explicit

Function EncodeHTML (Text)
	Dim I, C, A, A2
	EncodeHTML = vbNullString
	For I = 1 To Len(Text)
		C = Mid(Text, I, 1)
		A = AscW(C)
		' Combine any UTF-16 surrogate pair
		If A >= &hD800 And A <= &hDBFF Then
			I = I + 1
			A2 = AscW(Mid(Text, I, 1))
			If Not (A2 >= &hDC00 And A2 <= &hDFFF) Then
				' High surrogate without low surrogate
				Err.Raise 5, , "The text to be encoded contains an invalid character"
			End If
			A = &h10000 + ((A - &hD800) * &h400) + (A2 - &hDC00)
		ElseIf A >= &hDC00 And A <= &hDFFF Then
			' Low surrogate without high surrogate before it
			Err.Raise 5, , "The text to be encoded contains an invalid character"
		ElseIf A < 0 Then 
			' AscW returns a signed int, fix it to a positive long.
			A = &h10000 + A
		End If
		
		Select Case C
		Case "<" EncodeHTML = EncodeHTML & "&lt;"
		Case ">" EncodeHTML = EncodeHTML & "&gt;"
		Case "&" EncodeHTML = EncodeHTML & "&amp;"
		Case """" EncodeHTML = EncodeHTML & "&quot;"
		Case Else
			If A >= 128 Then
				EncodeHTML = EncodeHTML & ("&#"& A &";")
			Else
				EncodeHTML = EncodeHTML & C
			End If
		End Select
	Next
End Function
