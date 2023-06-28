'
' VBScript does not natively support LongLong values (signed 64-bit integers),
' however LongLong can be stored in variants and passed around by other
' components, including VBA in 64-bit applications.
' This procedure shows in the console the binary representation of any
' LongLong and the decoding of its value.
' It is designed as a learning and debugging tool to get a better
' understanding of numbers and dates representations in memory.
' 
' Philippe Majerus, June 2023.
'

Option Explicit

Sub ShowLngLngBits (LngLng)
	Dim LLRT, Val
	Set LLRT = CreateObject("Majerus.Automation.Int64")
	Val = LLRT.CLngLng(LngLng)
	
	'-------------------------------------
	' Convert LongLong to binary string
	'-------------------------------------
	
	Const Padding = "0000000000000000"
	Dim Streams, Stream, Reader, Writer, Binary, I
	Set Streams = CreateObject("AXSH.Streams")
	' Create a memory stream
	Set Stream = Streams.CreateMemoryStream()
	' Write LongLong to stream
	Set Writer = Streams.CreateWriter(Stream)
	Writer.WriteInt64 Val
	Writer.Close
	' Return back to beginning of stream
	Streams.MoveToStart Stream
	' Read as four unsigned Integers, handled as Longs for VBScript support
	Set Reader = Streams.CreateReader(Stream)
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
	AXSH.Echo " "&CSI&"96m"&ChrW(&h00B1)&CSI&"94m                            integer                            "&CSI&"m"
	AXSH.Echo " "&CSI&"97;46m"& Left(Binary,1) &CSI&"44m"& Right(Binary,63) &CSI&"m"
	AXSH.Echo " "&CSI&"36m6"&CSI&"34m665555555555444444444443333333333222222222211111111119876543210"&CSI&"m"
	AXSH.Echo " "&CSI&"36m3"&CSI&"34m21098765432109876543210987654321098765432109876543210"&CSI&"90m    (bit#)"&CSI&"m"
	
	'-------------------------------------
	' Explanations
	'-------------------------------------
	
	AXSH.Echo
	If LLRT.GetSign(Val) < 0 Then
		AXSH.Echo "Sign bit is set, the number is a negative value in two's complement format."
	End If
	AXSH.Echo " "& LLRT.Str(Val)
	AXSH.Echo vbCrLf&"Be aware LongLong numbers are not supported for arithmetic in VBScript."
End Sub
