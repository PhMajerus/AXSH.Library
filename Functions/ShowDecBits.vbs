'
' OLE and VBScript Decimal are 96-bit integer numbers scaled by a power of 10
' between 0 and 28, plus a separate sign.
' This procedure shows in the console the binary representation of any
' Decimal and the decoding of its value.
' It is designed as a learning and debugging tool to get a better
' understanding of numbers and dates representations in memory.
' 
' Philippe Majerus, March 2020.
'

Option Explicit

Sub ShowDecBits (Dec)
	Dim Val
	If VarType(Dec) = vbDecimal Then
		' Avoid an object creation if correct type has been provided
		Val = Dec
	Else
		Val = CreateObject("Majerus.Automation.Decimal").CDec(Dec)
	End If
	
	'-------------------------------------
	' Convert Decimal to binary string
	'-------------------------------------
	
	Const Padding = "0000000000000000"
	Dim Streams, Stream, Reader, Writer, Ints, Binary, I
	Set Streams = CreateObject("AXSH.Streams")
	' Create a memory stream
	Set Stream = Streams.CreateMemoryStream()
	' Write Decimal to stream
	Set Writer = Streams.CreateWriter(Stream)
	Writer.WriteDecimal Val
	Writer.Close
	' Return back to beginning of stream
	Streams.MoveToStart Stream
	' Read as eight unsigned Integers, handled as Longs for VBScript support
	Set Reader = Streams.CreateReader(Stream)
	ReDim Ints(7)
	For I = 7 To 0 Step -1
		Ints(I) = CLng(Reader.ReadUint16())
	Next
	Reader.Close
	' Convert to binary string
	Binary = Right(Padding & Numbers.Format(Ints(0),2),16) & _
	         Right(Padding & Numbers.Format(Ints(1),2),16) & _
	         Right(Padding & Numbers.Format(Ints(2),2),16) & _
	         Right(Padding & Numbers.Format(Ints(3),2),16) & _
	         Right(Padding & Numbers.Format(Ints(4),2),16) & _
	         Right(Padding & Numbers.Format(Ints(5),2),16) & _
	         Right(Padding & Numbers.Format(Ints(6),2),16) & _
	         Right(Padding & Numbers.Format(Ints(7),2),16)
	
	'-------------------------------------
	' Format output
	'-------------------------------------
	
	Dim CSI
	CSI = Chr(27)&"[" ' ANSI/VT Control Sequence Introducer
	' Show bits
	AXSH.Echo " "&CSI&"93m               absolute decimal value (mid & low)               "&CSI&"m"
	AXSH.Echo " "&CSI&"97;43m"& Left(Binary,64) &CSI&"m"
	AXSH.Echo " "&CSI&"33m1111111111111111111111111111999999999988888888887777777777666666"&CSI&"m"
	AXSH.Echo " "&CSI&"33m2222222211111111110000000000987654321098765432109876543210987654"&CSI&"m"
	AXSH.Echo " "&CSI&"33m7654321098765432109876543210  _  _"&CSI&"90m                        (bit#)"&CSI&"m"
	AXSH.Echo "                                "&CSI&"33m\/"&CSI&"m"
	AXSH.Echo " "&CSI&"93m absolute decimal value (high)  "&CSI&"96m"&ChrW(&h00B1)&" sign  "&CSI&"92m scale  "&CSI&"37m  reserved "&CSI&"90m(VT) "&CSI&"m"
	AXSH.Echo " "&CSI&"97;43m"& Mid(Binary,65,32) &CSI&"46m"& Mid(Binary,97,1) &CSI&"100m"& Mid(Binary,98,7) &CSI&"42m"& Mid(Binary,105,8) &CSI&"100m" & Right(Binary,16) &CSI&"m"
	AXSH.Echo " "&CSI&"33m66665555555555444444444433333333"&CSI&"36m3"&CSI&"90m3222222"&CSI&"32m22221111"&CSI&"90m1111119876543210"&CSI&"m"
	AXSH.Echo " "&CSI&"33m32109876543210987654321098765432"&CSI&"36m1"&CSI&"90m0987654"&CSI&"32m32109876"&CSI&"90m543210"&CSI&"90m    (bit#)"&CSI&"m"
	
	'-------------------------------------
	' Explanations
	'-------------------------------------
	
	Dim ValHi, ValLo, Scale, Sign
	AXSH.Echo
	ValHi = Ints(4)*2^16 + Ints(5)
	ValLo = Ints(0)*2^48 + Ints(1)*2^32 + Ints(2)*2^16 + Ints(3)
	Scale = Ints(6) And &hFF
	Sign = Ints(6) And &h8000&
	If Sign Then
		AXSH.Echo " "&CSI&"96m- "&CSI&"m( "&CSI&"93m"& FormatNumber(ValHi,0,,,0) &" "&CSI&"m*2^64 + "&CSI&"93m"& FormatNumber(ValLo,0,,,0) &CSI&"m ) / "&CSI&"92m10^"& Scale &CSI&"m = "& FormatNumber(Val,Scale,,,0)
	Else
		AXSH.Echo " "&CSI&"96m+ "&CSI&"m( "&CSI&"93m"& FormatNumber(ValHi,0,,,0) &" "&CSI&"m*2^64 + "&CSI&"93m"& FormatNumber(ValLo,0,,,0) &CSI&"m ) / "&CSI&"92m10^"& Scale &CSI&"m = "& FormatNumber(Val,Scale,,,0)
	End If
End Sub
