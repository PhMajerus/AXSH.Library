' This is a small library to provide a visual representation of binary
' Any positive integer can be converted to a VT string showing
' dots colored like LEDs on a diagnostic panel.
' This can be a fun accessory when teaching about binary.
' - Philippe Majerus, May 2017


Option Explicit


' Return an ANSI/VT string of bullets colored according to the values of the bits of the number.
' Bullets are grouped by 4, each group separated by a space.
' cBits argument sets the number of bits to show, any higher bit is ignored.
' Note this assume the number is a positive integer, fractional and negatives are not supported.
Function BitsDots(Number, cBits)
	Dim Prev, Dots, iBit, Bit
	Prev = -2
	Dots = ""

	For iBit = cBits To 1 Step -1
		If (((iBit Mod 4)=0) And (iBit <> cBits)) Then
			Dots = Dots & " "
		End If
		Bit = (Number And 2^(iBit-1)) <> 0
		If Bit <> Prev Then
			' Add coloring
			If Bit Then
				Dots = Dots & Chr(27)&"[32m"
			Else
				Dots = Dots & Chr(27)&"[31m"
			End If
			Prev = Bit
		End If
		Dots = Dots & ChrW(&H2022)
	Next
	
	Dots = Dots & Chr(27)&"[39m"

	BitsDots = Dots
End Function
