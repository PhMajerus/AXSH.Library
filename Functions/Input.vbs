'/////////////////////////////////////////////////////////////////////////////////////////
'//  Add some procedures and functions that work similarly to old BASICA, GW-BASIC,...
'//  This is just to make retro-aficionados feel a bit more at home.

Option Explicit

Sub Input (message, ByRef variable)
	Echo(message)
	variable = GetLine()
End Sub
