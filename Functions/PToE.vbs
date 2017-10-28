' Show the Periodic Table of Elements.

Option Explicit

Sub PToE
	Dim ANSI
	Set ANSI = CreateObject("Majerus.ANSI")
	AXSH.Echo ANSI.LoadAnsi(EnvVars.Expand("%UserProfile%\Documents\Majerus.net ActiveScript Shell\Resources\PToE.ans"))
End Sub
