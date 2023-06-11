'
' Legacy string to MBF double-precision conversion function.
' 
' This is designed to restore a single-precision number previously converted
' to a string using the MKD function, or MKD$ in legacy BASIC.
' 
' This function provides the same conversion from the default MS-DOS codepage
' (OEM CP) string to double-precision format.
' 
' This has been tested to be compatible with GW-BASIC 3.23 on PC-compatible,
' with some rounding difference because VBScript stores numbers as IEEE 754
' double-precision, losing 3 bits of precision in the conversion.
' Warning: Some Microsoft BASIC interpreter are using an incompatible format
' for MKD$/CVD, notably MSX-BASIC.
'

Option Explicit

Function CVD(sVal)
	Dim BinCV, Encodings, B
	Set BinCV = CreateObject("Majerus.BinaryConverter")
	Set Encodings = CreateObject("AXSH.Encodings")
	
	CVD = BinCV.ToMBF64(Encodings.TextToBinary(sVal, 1))
End Function
