'/////////////////////////////////////////////////////////////////////////////////////////
'//  Add some procedures and functions that work similarly to old BASICA, GW-BASIC,...
'//  This is just to make retro-aficionados feel a bit more at home.

Option Explicit

Sub Locate (Line, Column)
	Console.Buffer.MoveTo Line-1, Column-1
End Sub
