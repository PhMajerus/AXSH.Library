'
' Legacy MBF single-precision to string conversion function.
' 
' Old BASIC and GW-BASIC used strings to store binary data to write and read
' to and from files. MKS$ was used to convert a 32-bit MBF floating-point
' number into a string that could be used by files I/O functions to persist
' it to a file, and read it back using the CVS function.
' 
' This function provides the same conversion from integer to the system
' MS-DOS codepage (OEM CP) string format.
' Note MK* strings will often contain embedded nulls and control characters.
' 
' This has been tested to be compatible with GW-BASIC 3.23 on PC-compatible.
' Warning: Some Microsoft BASIC interpreter are using an incompatible format
' for MKS$/CVS, notably MSX-BASIC.
'

Option Explicit

Function MKS(Val)
	Dim BinCV, Encodings
	Set BinCV = CreateObject("Majerus.BinaryConverter")
	Set Encodings = CreateObject("AXSH.Encodings")
	
	MKS = Encodings.BinaryToText(BinCV.FromMBF32(Val), 1)
End Function
