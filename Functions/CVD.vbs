'
' Legacy string to MBF double-precision conversion function.
' 
' This is designed to restore a double-precision number previously converted
' to a string using the MKD function, or MKD$ in legacy QBASIC.
' 
' This function provides the same conversion from the default MS-DOS codepage
' (OEM CP) string to double-precision format.
' 
' This has been tested to be compatible with QBASIC 1.1 on PC-compatible.
' Warning: Older Microsoft BASIC interpreters are using an incompatible
' format for MKD$/CVD. See BinaryConverter's FromMBF64 and FromMDF64.
'

Option Explicit

Function CVD(sVal)
	Dim BinCV, Encodings, B
	Set BinCV = CreateObject("Majerus.BinaryConverter")
	Set Encodings = CreateObject("AXSH.Encodings")
	
	CVD = BinCV.ToDouble(Encodings.TextToBinary(sVal, 1))
End Function
