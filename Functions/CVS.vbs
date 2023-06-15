'
' Legacy string to MBF single-precision conversion function.
' 
' This is designed to restore a single-precision number previously converted
' to a string using the MKS function, or MKS$ in legacy QBASIC.
' 
' This function provides the same conversion from the default MS-DOS codepage
' (OEM CP) string to single-precision format.
' 
' This has been tested to be compatible with QBASIC 1.1 on PC-compatible.
' Warning: Older Microsoft BASIC interpreters are using an incompatible
' format for MKS$/CVS. See BinaryConverter's FromMBF32 and FromMDF32.
'

Option Explicit

Function CVS(sVal)
	Dim BinCV, Encodings, B
	Set BinCV = CreateObject("Majerus.BinaryConverter")
	Set Encodings = CreateObject("AXSH.Encodings")
	
	CVS = BinCV.ToSingle(Encodings.TextToBinary(sVal, 1))
End Function
