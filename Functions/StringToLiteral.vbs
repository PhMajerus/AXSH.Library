'
' This provides a way to convert a string into a literal for use in VBScript
' source code.
' This function escapes every character not part of the common low-ASCII
' characters set. This makes sure the literal can be used in plain ANSI
' script files, where high-ASCII depends on computer's current locale.
' It makes it easy to convert text from an existing string, or imported from
' another format, into a literal ready to embed in your .vbs files or Eval.
' 
' - Philippe Majerus, September 21 2017, updated January 24 2020.
'

Option Explicit

Function StringToLiteral(strText)
	Dim sBuffer, bInStr, I, C, A
	Const Quot = """"
	sBuffer = vbNullString
	bInStr = False
	For I = 1 To Len(strText)
		C = Mid(strText, I, 1)
		A = AscW(C)
		If A>=32 And A<=126 Then
			If Not bInStr Then
				If Len(sBuffer) > 0 Then
					sBuffer = sBuffer & "&"
				End If
				bInStr = True
				sBuffer = sBuffer & Quot
			End If
			If C=Quot Then
				sBuffer = sBuffer & Quot&Quot
			Else
				sBuffer = sBuffer & C
			End If
		Else
			If bInStr Then
				sBuffer = sBuffer & Quot
				bInStr = False
			End If
			If Len(sBuffer) > 0 Then
				sBuffer = sBuffer & "&"
			End If
			Select Case C
				Case vbCr ' (and CrLf)
					If Mid(strText,I+1,1)=vbLf Then
						sBuffer = sBuffer & "vbCrLf"
						I = I+1
					Else
						sBuffer = sBuffer & "vbCr"
					End If
				Case vbLf sBuffer = sBuffer & "vbLf"
				Case vbFormFeed sBuffer = sBuffer & "vbFormFeed"
				Case vbTab sBuffer = sBuffer & "vbTab"
				Case vbVerticalTab sBuffer = sBuffer & "vbVerticalTab"
				Case vbNullChar sBuffer = sBuffer & "vbNullChar"
				' Note VBScript has no built-in vbBack
				Case Else
					If A>=0 And A<128 Then
						sBuffer = sBuffer & "Chr(" & Asc(C) & ")"
					Else
						sBuffer = sBuffer & "ChrW(&h" & Hex(A) & ")"
					End If
			End Select			
		End If
	Next
	If bInStr Then
		sBuffer = sBuffer & Quot
	End If
	StringToLiteral = sBuffer
End Function
