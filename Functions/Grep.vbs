' Return a string containing only lines that match a regular expression from a multi-lines text.
' Usage: Echo Grep(CMD.IpConfig(),"\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b")

Option Explicit

Function Grep(strText, strPattern)
	Dim re, A, L, I, B, J
	Set re = New RegExp
	re.Pattern = strPattern
	re.IgnoreCase = True
	A = Split(strText, vbCrLf)
	ReDim B(-1)
	J = -1
	L = UBound(A)
	For I = 0 To L
		If re.Test(A(I)) Then
			J = J+1
			ReDim Preserve B(J)
			B(J) = A(I)
		End If
	Next
	Grep = Join(B, vbCrLf)
End Function
