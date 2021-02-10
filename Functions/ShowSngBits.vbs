'
' VBScript Singles are IEEE 754 32-bit floating-point values.
' This procedure shows in the console the binary representation of any
' Single and the decoding of its value.
' It is designed as a learning and debugging tool to get a better
' understanding of numbers and dates representations in memory.
' 
' Philippe Majerus, March 2020.
'

Option Explicit

Sub ShowSngBits (Sng)
	Dim Val
	Val = CSng(Sng)
	
	'-------------------------------------
	' Convert Single to binary string
	'-------------------------------------
	
	Const Padding = "0000000000000000"
	Dim Streams, Stream, Reader, Writer, Ints, Binary, I
	Set Streams = CreateObject("AXSH.Streams")
	' Create a memory stream
	Set Stream = Streams.CreateMemoryStream()
	' Write Single to stream
	Set Writer = Streams.CreateWriter(Stream)
	Writer.WriteSingle Val
	Writer.Close
	' Return back to beginning of stream
	Streams.MoveToStart Stream
	' Read as two unsigned Integers, handled as Longs for VBScript support
	Set Reader = Streams.CreateReader(Stream)
	ReDim Ints(1)
	For I = 1 To 0 Step -1
		Ints(I) = CLng(Reader.ReadUint16())
	Next
	Reader.Close
	' Convert to binary string
	Binary = Right(Padding & Numbers.Format(Ints(0),2),16) & _
	         Right(Padding & Numbers.Format(Ints(1),2),16)
	
	'-------------------------------------
	' Format output
	'-------------------------------------
	
	Dim CSI, Sign, Exp, Mts
	CSI = Chr(27)&"[" ' ANSI/VT Control Sequence Introducer
	' Show bits
	AXSH.Echo " "&CSI&"96m"&ChrW(&h00B1)&CSI&"92m  exp.  "&CSI&"91m       fraction        "&CSI&"m"
	AXSH.Echo " "&CSI&"97;46m"& Left(Binary,1) &CSI&"42m"& Mid(Binary,2,8) &CSI&"41m"& Right(Binary,23) &CSI&"m"
	AXSH.Echo " "&CSI&"36m3"&CSI&"32m32222222"&CSI&"31m22211111111119876543210"&CSI&"m"
	AXSH.Echo " "&CSI&"36m1"&CSI&"32m09876543"&CSI&"31m2109876543210"&CSI&"90m    (bit#)"&CSI&"m"
	' Compute sign, exponent and mantissa
	Sign = Abs((Ints(0) And &h8000)/(2^15))
	Exp = (Ints(0) And &h7F80)/(2^7)
	Mts = (Ints(0) And &h007F)*(2^16) + Ints(1)
	' Show floating-point components
	If Exp <> 0 And Exp <> 127 Then
		' Normalized
		AXSH.Echo " "&CSI&"96m"& Sign &"  "&CSI&"92m"& Exp & " "&CSI&"32m-127 = "& (Exp-127) &"  "&CSI&"91m"& FormatNumber(Mts,0,,,0) &" "&CSI&"31m/2^23 = "& CStr(CSng(Mts/2^23)) &CSI&"m"
	Else
		' Subnormal or NaN
		AXSH.Echo " "&CSI&"96m"& Sign &"  "&CSI&"92m"& Exp & "  "&CSI&"91m"& FormatNumber(Mts,0,,,0) &" "&CSI&"31m/2^23 = "& CStr(CSng(Mts/2^23)) &CSI&"m"
	End If
	
	'-------------------------------------
	' Explanations
	'-------------------------------------
	
	AXSH.Echo
	Exp = Exp - 127 ' bias
	If Exp = -127 Then
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
			Mts = CSng(Mts/2^23)
			AXSH.Echo "Fraction does "&CSI&"4mnot"&CSI&"24m have an implied leading 1, m = "& CStr(Mts)
			If Sign Then
				AXSH.Echo " "&CSI&"96m- "&CSI&"m2^-126 * "&CSI&"91m"& CStr(Mts) &CSI&"m = "& Val
			Else
				AXSH.Echo " "&CSI&"96m+ "&CSI&"m2^-126 * "&CSI&"91m"& CStr(Mts) &CSI&"m = "& Val
			End If
		End If
	ElseIf Exp = 128 Then
		' NaN and Infinities, not supported by VBScript, but we can handle a variant coming from another component
		AXSH.Echo "Exponent is all 1s => Special NaN & "&ChrW(&h00B1)&"Infinity"
		AXSH.Echo " "&CSI&"m"& Val
	Else
		AXSH.Echo "Exponent has a 127 bias, exponent = "& Exp
		Mts = CSng(1+(Mts/2^23)) ' implicit leading 1
		AXSH.Echo "Fraction has an implied leading 1, mantissa = "& Mts
		If Sign Then
			AXSH.Echo " "&CSI&"96m- "&CSI&"92m2^"& Exp &CSI&"m * "&CSI&"91m"& Mts &CSI&"m = "& Val
		Else
			AXSH.Echo " "&CSI&"96m+ "&CSI&"92m2^"& Exp &CSI&"m * "&CSI&"91m"& Mts &CSI&"m = "& Val
		End If
	End If
End Sub
