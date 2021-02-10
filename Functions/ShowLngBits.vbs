'
' VBScript Long values are signed 32-bit integers.
' This procedure shows in the console the binary representation of any
' Long and the decoding of its value.
' It is designed as a learning and debugging tool to get a better
' understanding of numbers and dates representations in memory.
' 
' Philippe Majerus, March 2020.
'

Option Explicit

Sub ShowLngBits (Lng)
	Dim Val
	Val = CLng(Lng)
	
	'-------------------------------------
	' Convert Long to binary string
	'-------------------------------------
	
	Const Padding = "0000000000000000"
	Dim Streams, Stream, Reader, Writer, Binary, I
	Set Streams = CreateObject("AXSH.Streams")
	' Create a memory stream
	Set Stream = Streams.CreateMemoryStream()
	' Write Currency to stream
	Set Writer = Streams.CreateWriter(Stream)
	Writer.WriteInt32 Val
	Writer.Close
	' Return back to beginning of stream
	Streams.MoveToStart Stream
	' Read as four unsigned Integers, handled as Longs for VBScript support
	Set Reader = Streams.CreateReader(Stream)
	' Convert to binary string
	Binary = vbNullString
	For I = 0 To 1
		Binary = Right(Padding & Numbers.Format(CLng(Reader.ReadUint16()),2),16) & Binary
	Next
	Reader.Close
	
	'-------------------------------------
	' Format output
	'-------------------------------------
	
	Dim CSI
	CSI = Chr(27)&"[" ' ANSI/VT Control Sequence Introducer
	' Show bits
	AXSH.Echo " "&CSI&"96m"&ChrW(&h00B1)&CSI&"94m            integer            "&CSI&"m"
	AXSH.Echo " "&CSI&"97;46m"& Left(Binary,1) &CSI&"44m"& Right(Binary,31) &CSI&"m"
	AXSH.Echo " "&CSI&"36m3"&CSI&"34m3222222222211111111119876543210"&CSI&"m"
	AXSH.Echo " "&CSI&"36m1"&CSI&"34m098765432109876543210"&CSI&"90m    (bit#)"&CSI&"m"
	
	'-------------------------------------
	' Explanations
	'-------------------------------------
	
	AXSH.Echo
	If Val < 0 Then
		AXSH.Echo "Sign bit is set, the number is a negative value in two's complement format."
	End If
	AXSH.Echo " "& FormatNumber(Val, 0,,,0)
End Sub
