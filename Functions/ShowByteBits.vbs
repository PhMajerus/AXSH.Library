'
' VBScript Byte values are unsigned 8-bit integers.
' This procedure shows in the console the binary representation of any
' Byte and the decoding of its value.
' It is designed as a learning and debugging tool to get a better
' understanding of numbers and dates representations in memory.
' 
' Philippe Majerus, March 2020.
'

Option Explicit

Sub ShowByteBits (ByteVal)
	Dim Val
	Val = CByte(ByteVal)
	
	'-------------------------------------
	' Convert Byte to binary string
	'-------------------------------------
	
	Const Padding = "00000000"
	Dim Binary
	Binary = Right(Padding & Numbers.Format(Val,2),8)
	
	'-------------------------------------
	' Format output
	'-------------------------------------
	
	Dim CSI
	CSI = Chr(27)&"[" ' ANSI/VT Control Sequence Introducer
	' Show bits
	AXSH.Echo " "&CSI&"94minteger "&CSI&"m"
	AXSH.Echo " "&CSI&"97;44m"& Binary &CSI&"m"
	AXSH.Echo " "&CSI&"34m76543210"&CSI&"m"
	AXSH.Echo " "&CSI&"90m  (bit#)"&CSI&"m"
	
	'-------------------------------------
	' Explanations
	'-------------------------------------
	
	AXSH.Echo
	AXSH.Echo " "& FormatNumber(Val, 0,,,0)
End Sub
