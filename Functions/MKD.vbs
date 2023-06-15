'
' Legacy MBF double-precision to string conversion function.
' 
' QBASIC (as well as older GW-BASIC and BASIC) used strings to store binary
' data to write and read to and from files. MKD$ was used to convert a
' 64-bit floating-point number into a string that could be used by files
' I/O functions to persist it to a file, and read it back using the CVD
' function.
' 
' This function provides the same conversion from double-precision in
' IEEE 754 format to the system MS-DOS codepage (OEM CP) string format.
' This is compatible with the MKD$ function in QBasic, but some older
' BASIC versions used Microsoft Binary Format (MBF) or BCD (decimal)
' floating-point number formats instead.
' Note MK* strings will often contain embedded nulls and control characters.
' 
' This has been tested to be compatible with QBASIC 1.1 on PC-compatible.
' Warning: Older Microsoft BASIC interpreters are using an incompatible
' format for MKD$/CVD. See BinaryConverter's FromMBF64 and FromMDF64.
'

Option Explicit

Function MKD(Val)
	Dim BinCV, Encodings
	Const cpOEMCP = 1 ' Default OEM Codepage
	Set BinCV = CreateObject("Majerus.BinaryConverter")
	Set Encodings = CreateObject("AXSH.Encodings")
	
	MKD = Encodings.BinaryToText(BinCV.FromDouble(Val), cpOEMCP)
End Function
