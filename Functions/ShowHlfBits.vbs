'
' Variants cannot store half-precision floating-point values, but it can be
' interesting to convert a Single or Double to one and see how it is
' represented in memory.
' This procedure shows in the console the binary representation of any
' half-precision and the decoding of its value.
' It is designed as a learning and debugging tool to get a better
' understanding of numbers and dates representations in memory.
' 
' Philippe Majerus, May 2023.
'

Option Explicit

Sub ShowHlfBits (Hlf)
	Dim Val
	Val = CSng(Hlf)
	
	'-------------------------------------
	' Convert Single to binary16 string
	'-------------------------------------
	
	Const Padding = "00000000"
	Dim Streams, Stream, Reader, Writer, Int, Binary, I
	Set Streams = CreateObject("AXSH.Streams")
	' Create a memory stream
	Set Stream = Streams.CreateMemoryStream()
	' Write as Half to stream
	Set Writer = Streams.CreateWriter(Stream)
	Writer.WriteHalf Val
	Writer.Close
	' Return back to beginning of stream
	Streams.MoveToStart Stream
	' Read as an unsigned Integers, handled as Longs for VBScript support
	Set Reader = Streams.CreateReader(Stream)
	Int = CLng(Reader.ReadUint16())
	' Return back to beginning of stream
	Streams.MoveToStart Stream
	' Read as Half to get correct binary16-rounded value
	Val = Reader.ReadHalf()
	Reader.Close
	' Convert to binary string
	Binary = Right(Padding & Numbers.Format(Int,2),16)
	
	'-------------------------------------
	' Format output
	'-------------------------------------
	
	Dim CSI, Sign, Exp, Mts
	CSI = Chr(27)&"[" ' ANSI/VT Control Sequence Introducer
	' Show bits
	AXSH.Echo " "&CSI&"96m"&ChrW(&h00B1)&CSI&"92m exp."&CSI&"91m mantissa "&CSI&"m"
	AXSH.Echo " "&CSI&"97;46m"& Left(Binary,1) &CSI&"42m"& Mid(Binary,2,5) &CSI&"41m"& Right(Binary,10) &CSI&"m"
	AXSH.Echo " "&CSI&"36m1"&CSI&"32m11111"&CSI&"31m9876543210"&CSI&"m"
	AXSH.Echo " "&CSI&"36m5"&CSI&"32m43210"&CSI&"90m    (bit#)"&CSI&"m"
	' Compute sign, exponent and mantissa
	Sign = Abs((Int And &h8000)/(2^15))
	Exp = (Int And &h7C00)/(2^10)
	Mts = (Int And &h03FF)
	' Show floating-point components
	If Exp <> 0 And Exp <> 31 Then
		' Normalized
		AXSH.Echo " "&CSI&"96m"& Sign &"  "&CSI&"92m"& Exp & " "&CSI&"32m-15 = "& (Exp-15) &"  "&CSI&"91m"& FormatNumber(Mts,0,,,0) &" "&CSI&"31m/2^10 = "& CStr(CSng(Mts/2^10)) &CSI&"m"
	Else
		' Subnormal or NaN
		AXSH.Echo " "&CSI&"96m"& Sign &"  "&CSI&"92m"& Exp & "  "&CSI&"91m"& FormatNumber(Mts,0,,,0) &" "&CSI&"31m/2^10 = "& CStr(CSng(Mts/2^10)) &CSI&"m"
	End If
	
	'-------------------------------------
	' Explanations
	'-------------------------------------
	
	AXSH.Echo
	Exp = Exp - 15 ' bias
	If Exp = -15 Then
		If Mts = 0 Then
			AXSH.Echo "Exponent is all 0s and mantissa=0 => Special value for "&ChrW(&h00B1)&"0"
			If Sign Then
				AXSH.Echo " -0"
			Else
				AXSH.Echo " 0"
			End If
		Else
			' Subnormal number
			AXSH.Echo "Exponent is all 0s => Subnormal number"
			Mts = CSng(Mts/2^10)
			AXSH.Echo "Mantissa does "&CSI&"4mnot"&CSI&"24m have an implied leading 1, mantissa = "& CStr(Mts)
			If Sign Then
				AXSH.Echo " "&CSI&"96m- "&CSI&"m2^-14 * "&CSI&"91m"& CStr(Mts) &CSI&"m = "& Val
			Else
				AXSH.Echo " "&CSI&"96m+ "&CSI&"m2^-14 * "&CSI&"91m"& CStr(Mts) &CSI&"m = "& Val
			End If
		End If
	ElseIf Exp = 16 Then
		' NaN and Infinities, not supported by VBScript, but we can handle a variant coming from another component
		AXSH.Echo "Exponent is all 1s => Special NaN & "&ChrW(&h00B1)&"Infinity"
		AXSH.Echo " "&CSI&"m"& Val
	Else
		AXSH.Echo "Exponent has a 15 bias, exponent = "& Exp
		Mts = CSng(1+(Mts/2^10)) ' implicit leading 1
		AXSH.Echo "Mantissa has an implied leading 1, mantissa = "& Mts
		If Sign Then
			AXSH.Echo " "&CSI&"96m- "&CSI&"92m2^"& Exp &CSI&"m * "&CSI&"91m"& Mts &CSI&"m = "& Val
		Else
			AXSH.Echo " "&CSI&"96m+ "&CSI&"92m2^"& Exp &CSI&"m * "&CSI&"91m"& Mts &CSI&"m = "& Val
		End If
	End If
End Sub
