'
' Legacy integer to string conversion function.
' 
' Old BASIC and GW-BASIC used strings to store binary data to write and read
' to and from files. MKI$ was used to convert a 16-bit integer into a string
' that could be used by files I/O functions to persist it to a file, and read
' it back using the CVI function.
' 
' This function provides the same conversion from integer to the system
' MS-DOS codepage (OEM CP) string format.
' Note MK* strings will often contain embedded nulls and control characters.
' 
' This has been tested to be compatible with GW-BASIC 3.23 on PC-compatible,
' and MSX-BASIC 
'

Option Explicit

Function MKI(Val)
	Dim BinCV, Encodings
	Set BinCV = CreateObject("Majerus.BinaryConverter")
	Set Encodings = CreateObject("AXSH.Encodings")
	
	MKI = Encodings.BinaryToText(BinCV.FromInt16(Val), 1)
End Function
