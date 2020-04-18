'
' COM and VBScript strings are stored internally in UTF-16.
' This procedure shows in the console the hexadecimal representation of a
' string.
' It is designed as a learning and debugging tool to get a better
' understanding of strings' representations in memory.
' 
' Philippe Majerus, March 2020.
'

Option Explicit

Sub ShowStrBits (Str)
	Dim Text, Stream, BinStream
	Text = CStr(Str)
	
	AXSH.Echo """" & Text &""" is "& (Len(Text)*2) &" bytes long." & vbCrLf
	
	' Create a stream to contain the string
	Set Stream = CreateObject("ADODB.Stream")
	Stream.Open
	Stream.Type = 1 ' adTypeBinary	
	
	' ADODB.Stream with UTF-16 encoding includes a BOM.
	' Create another stream to encode the string...
	Set BinStream = CreateObject("ADODB.Stream")
	BinStream.Open
	BinStream.Type = 2 ' adTypeText
	BinStream.CharSet = "utf-16"
	BinStream.WriteText Text
	' ... and copy characters to main stream without the BOM.
	BinStream.Position = 2 ' skip BOM
	BinStream.CopyTo Stream
	BinStream.Close
	Stream.Position = 0
	
	' Show stream using Hexdump
	Hexdump Stream
	
	Stream.Close
End Sub
