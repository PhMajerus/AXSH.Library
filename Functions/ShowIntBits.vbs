'
' VBScript Integer values are signed 16-bit integers.
' This procedure shows in the console the binary representation of any
' Integer and the decoding of its value.
' It is designed as a learning and debugging tool to get a better
' understanding of numbers and dates representations in memory.
' 
' Philippe Majerus, March 2020.
'

Option Explicit

Sub ShowIntBits (IntVal)
	Dim Val
	Val = CInt(IntVal)
	If Val < 0 Then
		' Convert to unsigned Int
		Val = 2^16+Val
	End If
	
	'-------------------------------------
	' Convert Integer to binary string
	'-------------------------------------
	
	Const Padding = "0000000000000000"
	Dim Binary
	Binary = Right(Padding & Numbers.Format(Val,2),16)
	
	'-------------------------------------
	' Format output
	'-------------------------------------
	
	Dim CSI
	CSI = Chr(27)&"[" ' ANSI/VT Control Sequence Introducer
	' Show bits
	AXSH.Echo " "&CSI&"96m"&ChrW(&h00B1)&CSI&"94m    integer    "&CSI&"m"
	AXSH.Echo " "&CSI&"97;46m"& Left(Binary,1) &CSI&"44m"& Right(Binary,15) &CSI&"m"
	AXSH.Echo " "&CSI&"36m1"&CSI&"34m111119876543210"&CSI&"m"
	AXSH.Echo " "&CSI&"36m5"&CSI&"34m43210"&CSI&"90m    (bit#)"&CSI&"m"
	
	'-------------------------------------
	' Explanations
	'-------------------------------------
	
	AXSH.Echo
	If Val >= 2^15 Then
		' Convert to signed Int
		Val = Val-2^16
		AXSH.Echo "Sign bit is set, the number is a negative value in two's complement format."
	End If
	AXSH.Echo " "& FormatNumber(Val, 0,,,0)
End Sub
