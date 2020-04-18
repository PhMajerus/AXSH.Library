'
' OLE and VBScript Currency values are signed 64-bit integers scaled by
' 10000, representing ten thousandths precisely.
' This procedure shows in the console the binary representation of any
' Currency and the decoding of its value.
' It is designed as a learning and debugging tool to get a better
' understanding of numbers and dates representations in memory.
' 
' Philippe Majerus, March 2020.
'

Option Explicit

Sub ShowCurBits (Cur)
	Dim Val
	Val = CCur(Cur)
	
	'-------------------------------------
	' Convert Currency to binary string
	'-------------------------------------
	
	Const Padding = "0000000000000000"
	Dim Streams, Stream, Reader, Writer, Binary, I
	Set Streams = CreateObject("AXSH.Streams")
	' Create a memory stream
	Set Stream = Streams.CreateMemoryStream()
	' Write Currency to stream
	Set Writer = Streams.CreateSequentialWriter(Stream)
	Writer.WriteCurrency Val
	Writer.Close
	' Return back to beginning of stream
	Streams.MoveToStart Stream
	' Read as four unsigned Integers, handled as Longs for VBScript support
	Set Reader = Streams.CreateSequentialReader(Stream)
	' Convert to binary string
	Binary = vbNullString
	For I = 0 To 3
		Binary = Right(Padding & Numbers.Format(CLng(Reader.ReadUint16()),2),16) & Binary
	Next
	Reader.Close
	
	'-------------------------------------
	' Format output
	'-------------------------------------
	
	Dim CSI
	CSI = Chr(27)&"[" ' ANSI/VT Control Sequence Introducer
	' Show bits
	AXSH.Echo " "&CSI&"96m"&ChrW(&h00B1)&CSI&"95m                        ten thousandths                        "&CSI&"m"
	AXSH.Echo " "&CSI&"97;46m"& Left(Binary,1) &CSI&"45m"& Right(Binary,63) &CSI&"m"
	AXSH.Echo " "&CSI&"36m6"&CSI&"35m666555555555544444444443333333333222222222211111111119876543210"&CSI&"m"
	AXSH.Echo " "&CSI&"36m3"&CSI&"35m21098765432109876543210987654321098765432109876543210"&CSI&"90m    (bit#)"&CSI&"m"
	
	'-------------------------------------
	' Explanations
	'-------------------------------------
	
	AXSH.Echo
	AXSH.Echo "Currency always represents ten thousandths, / 10000"
	' We need to use the Currency value to format with full precision, this is performed by formatting it as it is,
	' as scaling it back could overflow a Currency or lose precision if converted to a Double, and remove the decimal
	' separator for display instead of actually performing *10000.
	AXSH.Echo " "&CSI&"95m"& Replace(FormatNumber(Val, 4,,,0),".","") &CSI&"m / 10000 = "& FormatNumber(Val, 4,,,0)
End Sub
