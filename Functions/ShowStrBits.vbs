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
		Writer.WriteInt16 AscW(Mid(Text,I,1))
	Next
	Writer.Close
	' Return back to beginning of stream
	Streams.MoveToStart Stream
	' Convert control characters embedded in a string into their printable picture representations
	For I = 0 To 31
		Text = Replace(Text, Chr(I), ChrW(&h2400+I))
	Next
	Text = Replace(Text, Chr(127), ChrW(&h2421))
	' Show the string
	AXSH.Echo """" & Text &""" is "& (Len(Text)*2) &" bytes long." & vbCrLf	
	' Show stream using Hexdump
	Hexdump Stream
End Sub
