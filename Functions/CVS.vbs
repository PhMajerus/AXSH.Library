'
' Legacy string to MBF single-precision conversion function.
' 
' This is designed to restore a single-precision number previously converted
' to a string using the MKS function, or MKS$ in legacy BASIC.
' 
' This function provides the same conversion from the default MS-DOS codepage
' (OEM CP) string to single-precision format.
' 
' This has been tested to be compatible with GW-BASIC 3.23 on PC-compatible.
' Warning: Some Microsoft BASIC interpreter are using an incompatible format
' for MKS$/CVS, notably MSX-BASIC.
'

Option Explicit

Function CVS(sVal)
	Dim BinCV, Encodings, B
	Set BinCV = CreateObject("Majerus.BinaryConverter")
	Set Encodings = CreateObject("AXSH.Encodings")
	
	CVS = BinCV.ToMBF32(Encodings.TextToBinary(sVal, 1))
End Function
