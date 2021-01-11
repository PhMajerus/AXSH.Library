' Return a string containing only lines that match a regular expression from a multi-lines text.
' Usage: Echo Grep(ExecCmd("ipconfig"),"\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b")

Option Explicit

Function Grep(strText, strPatternOrRegExp)
	Dim RE, A, L, I, B, J, Matches, M
	If (TypeName(strPatternOrRegExp) = "IRegExp2") Then
		Set RE = strPatternOrRegExp
	Else
		Set RE = New RegExp
		RE.Pattern = strPatternOrRegExp
		RE.IgnoreCase = True
	End If
	A = Split(strText, vbCrLf)
	ReDim B(-1)
	J = -1
	L = UBound(A)
	For I = 0 To L
		Set Matches = RE.Execute(A(I))
		If Matches.Count <> 0 Then
			Set M = Matches(0)
			J = J+1
			ReDim Preserve B(J)
			B(J) = Left(A(I), M.FirstIndex) & Chr(27)&"[31;1m" & Mid(A(I), M.FirstIndex+1, M.Length) & Chr(27)&"[m" & Mid(A(I), M.FirstIndex+M.Length+1)
		End If
	Next
	Grep = Join(B, vbCrLf)
End Function
