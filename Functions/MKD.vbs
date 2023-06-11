'
' Legacy MBF double-precision to string conversion function.
' 
' Old BASIC and GW-BASIC used strings to store binary data to write and read
' to and from files. MKD$ was used to convert a 64-bit MBF floating-point
' number into a string that could be used by files I/O functions to persist
' it to a file, and read it back using the CVD function.
' 
' This function provides the same conversion from integer to the system
' MS-DOS codepage (OEM CP) string format.
' Note MK* strings will often contain embedded nulls and control characters.
' 
' This has been tested to be compatible with GW-BASIC 3.23 on PC-compatible,
' with some off by 1 or 2 in the last byte because VBScript parses to
' IEEE 754 double-precision before converting to MBF64, losing 3 bits of
' precision in the process.
' Warning: Some Microsoft BASIC interpreter are using an incompatible format
' for MKD$/CVD, notably MSX-BASIC.
'

Option Explicit

Function MKD(Val)
	Dim BinCV, Encodings
	Set BinCV = CreateObject("Majerus.BinaryConverter")
	Set Encodings = CreateObject("AXSH.Encodings")
	
	MKD = Encodings.BinaryToText(BinCV.FromMBF64(Val), 1)
End Function
