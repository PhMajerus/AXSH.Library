'
' Legacy integer to string conversion function.
' 
' QBASIC (as well as older GW-BASIC and BASIC) used strings to store binary
' data to write and read to and from files. MKS$ was used to convert a
' 32-bit floating-point number into a string that could be used by files
' I/O functions to persist it to a file, and read it back using the CVS
' function.
'
' Old BASIC, GW-BASIC, and QBASIC used strings to store binary data to write
' and read to and from files. MKI$ was used to convert a 16-bit integer into
' a string that could be used by files I/O functions to persist it to a
' file, and read it back using the CVI function.
' 
' This function provides the same conversion from integer to the system
' MS-DOS codepage (OEM CP) string format.
' Note MK* strings will often contain embedded nulls and control characters.
' 
' This has been tested to be compatible with QBASIC 1.1 and GW-BASIC 3.23 on
' PC-compatible.
'

Option Explicit

Function MKI(Val)
	Dim BinCV, Encodings
	Set BinCV = CreateObject("Majerus.BinaryConverter")
	Set Encodings = CreateObject("AXSH.Encodings")
	
	MKI = Encodings.BinaryToText(BinCV.FromInt16(Val), 1)
End Function
