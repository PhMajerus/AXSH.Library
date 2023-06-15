'
' Legacy MBF single-precision to string conversion function.
' 
' QBASIC (as well as older GW-BASIC and BASIC) used strings to store binary
' data to write and read to and from files. MKS$ was used to convert a
' 32-bit floating-point number into a string that could be used by files
' I/O functions to persist it to a file, and read it back using the CVS
' function.
' 
' This function provides the same conversion from single-precision in
' IEEE 754 format to the system MS-DOS codepage (OEM CP) string format.
' This is compatible with the MKS$ function in QBasic, but some older
' BASIC versions used Microsoft Binary Format (MBF) or BCD (decimal)
' floating-point number formats instead.
' Note MK* strings will often contain embedded nulls and control characters.
' 
' This has been tested to be compatible with QBASIC 1.1 on PC-compatible.
' Warning: Older Microsoft BASIC interpreters are using an incompatible
' format for MKS$/CVS. See BinaryConverter's FromMBF32 and FromMDF32.
'

Option Explicit

Function MKS(Val)
	Dim BinCV, Encodings
	Const cpOEMCP = 1 ' Default OEM Codepage
	Set BinCV = CreateObject("Majerus.BinaryConverter")
	Set Encodings = CreateObject("AXSH.Encodings")
	
	MKS = Encodings.BinaryToText(BinCV.FromSingle(Val), cpOEMCP)
End Function
