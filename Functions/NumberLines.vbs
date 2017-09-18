' This provides a quick way to add lines numbers to a multi-lines text.
' Note the output uses VT coloring and will only display properly in a modern console.

Option Explicit

' Add line number prefixes in dark gray.
Function NumberLines(strText)
	Dim A, L, I, CC, Ln
	A = Split(strText, vbCrLf)
	L = UBound(A)
	CC = Int(Log(L+1) / Log(10)) + 1
	For I = 0 To L
		Ln = CStr(I+1)
		A(I) = Chr(27)&"[90m" & Space(CC-Len(Ln)) & Ln & ChrW(&H2502) & Chr(27)&"[m" & A(I)
	Next
	NumberLines = Join(A, vbCrLf)
End Function
