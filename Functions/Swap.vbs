'/////////////////////////////////////////////////////////////////////////////////////////
'//  Add some procedures and functions that work similarly to old BASICA, GW-BASIC,...
'//  This is just to make retro-aficionados feel a bit more at home.

Option Explicit

Sub Swap (ByRef A, ByRef B)
	' Note VBScript and VB6 arguments are ByRef by default, the opposite of VB.net which defaults to ByVal,
	' ByRef is specified for arguments here only for readability.
	Dim Tmp
	If IsObject(A) Then
		Set Tmp = A
	Else
		Tmp = A
	End If
	If IsObject(B) Then
		Set A = B
	Else
		A = B
	End If
	If IsObject(Tmp) Then
		Set B = Tmp
	Else
		B = Tmp
	End If
End Sub
