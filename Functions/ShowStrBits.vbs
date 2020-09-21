'
' COM and VBScript strings are stored internally in UTF-16.
' This procedure shows in the console the hexadecimal representation of a
' string.
' It is designed as a learning and debugging tool to get a better
' understanding of strings' representations in memory.
' 
' Philippe Majerus, March 2020, updated May 2020.
'

Option Explicit

Sub ShowStrBits (Str)
	Dim Text, Streams, Stream, Writer, I
	Text = CStr(Str)
	Set Streams = CreateObject("AXSH.Streams")
	' Create a memory stream
	Set Stream = Streams.CreateMemoryStream()
	' Write String to stream
	Set Writer = Streams.CreateSequentialWriter(Stream)
	For I = 1 To Len(Text)
		Writer.WriteUint16 AscW(Mid(Text,I,1))
	Next
	Writer.Close
	' Return back to beginning of stream
	Streams.MoveToStart Stream
	' Show stream using Hexdump
	AXSH.Echo """" & Text &""" is "& (Len(Text)*2) &" bytes long." & vbCrLf	
	Hexdump Stream
End Sub
