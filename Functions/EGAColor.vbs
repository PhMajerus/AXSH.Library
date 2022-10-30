'
' Returns the RGB OLEColor for an EGA color index.
' 
' Based on the original hardware colors of the IBM Enhanced Graphics
' Adapter card, as well as the EGA monitor signals, which used 2 bits per
' RGB channel. It isn't technically a palette, as these were the 64 colors
' the hardware was capable of producing, but the text and graphics modes
' were limited to 16 simultaneous colors.
' 
' Note the CGA (IBM Color Graphics Adapter) colors are not completely
' sequential because RGBI monitors replaced dark yellow with brown.
' The CGA palette are indexes 0,1,2,3,4,5,20,7,56,57,58,59,60,61,62,63.
' 
' Example usage, show 4x4x4 colors cube:
' Set ANSI = CreateObject("Majerus.ANSI")
' Function EC(R,G,B): EC=(R And 1)*32+(G And 1)*16+(B And 1)*8+(R And 2)*2+(G And 2)+(B And 2)\2: End Function
' For R=0 To 3: S="": For G=0 To 3: For B=0 To 3: I=EC(R,G,B): S=S+ANSI.BackColor(EGAColor(I))&" "&Right("00"&I,2)&" ": Next: S=S+Chr(27)&"[m  ": Next: Echo S: Next
'

Option Explicit

Function EGAColor (Index)
	Dim R,G,B
	If Index < 0 Or Index > 63 Then
		Err.Raise 5, , "Index must be between 0 and 63."
	End If
	
	R = (((Index\2) And 2)+((Index\32) And 1)) * 85
	G = ((Index And 2)+((Index\16) And 1)) * 85
	B = (((Index*2) And 2)+((Index\8) And 1)) * 85
	EGAColor = RGB(R, G, B)
End Function
