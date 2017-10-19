'/////////////////////////////////////////////////////////////////////////////////////////
'//  Add some procedures and functions that work similarly to old BASICA, GW-BASIC,...
'//  This is just to make retro-aficionados feel a bit more at home.

Option Explicit

Function Input (message)
	Echo(message)
	Input = GetLine()
End Function
