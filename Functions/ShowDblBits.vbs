'
' VBScript Doubles are IEEE 754 64-bit floating-point values.
' This procedure shows in the console the binary representation of any
' Double and the decoding of its value. OLE and VBScript also stores
' Dates internally as double, so it can also show Dates bits.
' It is designed as a learning and debugging tool to get a better
' understanding of numbers and dates representations in memory.
' 
' Philippe Majerus, March 2020.
'

Option Explicit

Sub ShowDblBits (Dbl)
	Dim Val
	Val = CDbl(Dbl)
	
	'-------------------------------------
	' Convert Double to binary string
	'-------------------------------------
	
	Const Padding = "0000000000000000"
	Dim Streams, Stream, Reader, Writer, Ints, Binary, I
	Set Streams = CreateObject("AXSH.Streams")
	' Create a memory stream
	Set Stream = Streams.CreateMemoryStream()
	' Write Double to stream
	Set Writer = Streams.CreateWriter(Stream)
	Writer.WriteDouble Val
	Writer.Close
	' Return back to beginning of stream
	Streams.MoveToStart Stream
	' Read as four unsigned Integers, handled as Longs for VBScript support
	Set Reader = Streams.CreateReader(Stream)
	ReDim Ints(3)
	For I = 3 To 0 Step -1
		Ints(I) = CLng(Reader.ReadUint16())
	Next
	Reader.Close
	' Convert to binary string
	Binary = Right(Padding & Numbers.Format(Ints(0),2),16) & _
	         Right(Padding & Numbers.Format(Ints(1),2),16) & _
	         Right(Padding & Numbers.Format(Ints(2),2),16) & _
	         Right(Padding & Numbers.Format(Ints(3),2),16)
	
	'-------------------------------------
	' Format output
	'-------------------------------------
	
	Dim CSI, Sign, Exp, Mts
	CSI = Chr(27)&"[" ' ANSI/VT Control Sequence Introducer
	' Show bits
	AXSH.Echo " "&CSI&"96m"&ChrW(&h00B1)&CSI&"92m  exponent "&CSI&"91m                     fraction                     "&CSI&"m"
	AXSH.Echo " "&CSI&"97;46m"& Left(Binary,1) &CSI&"42m"& Mid(Binary,2,11) &CSI&"41m"& Right(Binary,52) &CSI&"m"
	AXSH.Echo " "&CSI&"36m6"&CSI&"32m66655555555"&CSI&"31m5544444444443333333333222222222211111111119876543210"&CSI&"m"
	AXSH.Echo " "&CSI&"36m3"&CSI&"32m21098765432"&CSI&"31m109876543210987654321098765432109876543210"&CSI&"90m    (bit#)"&CSI&"m"
	' Compute sign, exponent and mantissa
	Sign = Abs((Ints(0) And &h8000)/(2^15))
	Exp = (Ints(0) And &h7FF0)/(2^4)
	Mts = (((Ints(0) And &h000F)*(2^16) + Ints(1))*(2^16) + Ints(2))*(2^16) + Ints(3)
	' Show floating-point components
	If Exp <> 0 And Exp <> 2047 Then
		' Normalized
		AXSH.Echo " "&CSI&"96m"& Sign &"  "&CSI&"92m"& Exp & " "&CSI&"32m-1023 = "& (Exp-1023) &"  "&CSI&"91m"& FormatNumber(Mts,0,,,0) &" "&CSI&"31m/2^52 = "& CStr(Mts/2^52) &CSI&"m"
	Else
		' Subnormal or NaN
		AXSH.Echo " "&CSI&"96m"& Sign &"  "&CSI&"92m"& Exp & "  "&CSI&"91m"& FormatNumber(Mts,0,,,0) &" "&CSI&"31m/2^52 = "& CStr(Mts/2^52) &CSI&"m"
	End If
	
	'-------------------------------------
	' Explanations
	'-------------------------------------
	
	AXSH.Echo
	Exp = Exp - 1023 ' bias
	If Exp = -1023 Then
		If Mts = 0 Then
			AXSH.Echo "Exponent is all 0s and fraction=0 => Special value for "&ChrW(&h00B1)&"0"
			If Sign Then
				AXSH.Echo " -0"
			Else
				AXSH.Echo " 0"
			End If
		Else
			' Subnormal number
			AXSH.Echo "Exponent is all 0s => Subnormal number"
			Mts = Mts/2^52
			AXSH.Echo "Fraction does "&CSI&"4mnot"&CSI&"24m have an implied leading 1, m = "& CStr(Mts)
			If Sign Then
				AXSH.Echo " "&CSI&"96m- "&CSI&"m2^-1022 * "&CSI&"91m"& CStr(Mts) &CSI&"m = "& Val
			Else
				AXSH.Echo " "&CSI&"96m+ "&CSI&"m2^-1022 * "&CSI&"91m"& CStr(Mts) &CSI&"m = "& Val
			End If
		End If
	ElseIf Exp = 1024 Then
		' NaN and Infinities, not supported by VBScript, but we can handle a variant coming from another component
		AXSH.Echo "Exponent is all 1s => Special NaN & "&ChrW(&h00B1)&"Infinity"
		AXSH.Echo " "&CSI&"m"& Val
	Else
		AXSH.Echo "Exponent has a 1023 bias, exponent = "& Exp
		Mts = 1+(Mts/2^52) ' implicit leading 1
		AXSH.Echo "Fraction has an implied leading 1, mantissa = "& Mts
		If Sign Then
			AXSH.Echo " "&CSI&"96m- "&CSI&"92m2^"& Exp &CSI&"m * "&CSI&"91m"& Mts &CSI&"m = "& Val
		Else
			AXSH.Echo " "&CSI&"96m+ "&CSI&"92m2^"& Exp &CSI&"m * "&CSI&"91m"& Mts &CSI&"m = "& Val
		End If
	End If
End Sub
