'
' Legacy string to integer conversion function.
' 
' This is designed to restore an integer previously converted to a string
' using the MKI function, or MKI$ in legacy QBASIC and older BASIC.
' 
' This function provides the same conversion from the default MS-DOS codepage
' (OEM CP) string to integer format.
' 
' This has been tested to be compatible with QBASIC 1.1 and GW-BASIC 3.23 on
' PC-compatible.
'

Option Explicit

Function CVI(sVal)
	Dim BinCV, Encodings
	Const cpOEMCP = 1 ' Default OEM Codepage
	Set BinCV = CreateObject("Majerus.BinaryConverter")
	Set Encodings = CreateObject("AXSH.Encodings")
	
	CVI = BinCV.ToInt16(Encodings.TextToBinary(sVal, cpOEMCP))
End Function
