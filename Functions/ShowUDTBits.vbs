'
' This procedure shows in the console the information about a UDT stored in a
' Variant.
' 
' This script file also contains helper procedures to display the contents of
' some UDT types such as quadruples (binary128), and more planned for later.
' These are called accordingly for those UDT types.
'

Option Explicit

Private Sub ShowUDTBits_BINARY128 (Quadruple)
	Dim F128RT, Encodings, Binary
	Set F128RT = CreateObject("Majerus.Quadruple")
	Set Encodings = CreateObject("AXSH.Encodings")
	Binary = Encodings.BinaryToBase2(F128RT.GetBinary(Quadruple,0))
	
	Dim CSI
	CSI = Chr(27)&"[" ' ANSI/VT Control Sequence Introducer
	' Show bits
	AXSH.Echo
	AXSH.Echo " "&CSI&"96m"&ChrW(&h00B1)&CSI&"92m   exponent  "&CSI&"91m                      mantissa                  "&CSI&"m"
	AXSH.Echo " "&CSI&"97;46m"& Left(Binary,1) &CSI&"42m"& Mid(Binary,2,15) &CSI&"41m"& Mid(Binary,17,48) &CSI&"m"
	AXSH.Echo " "&CSI&"36m1"&CSI&"32m111111111111111"&CSI&"31m111111111111999999999988888888887777777777666666"&CSI&"m"
	AXSH.Echo " "&CSI&"36m2"&CSI&"32m222222211111111"&CSI&"31m110000000000987654321098765432109876543210987654"&CSI&"m"
	AXSH.Echo " "&CSI&"36m7"&CSI&"32m654321098765432"&CSI&"31m109876543210"&CSI&"90m                              (bit#)"&CSI&"m"
	AXSH.Echo
	AXSH.Echo " "&CSI&"97;41m"& Right(Binary,64) &CSI&"m"
	AXSH.Echo " "&CSI&"31m6666555555555544444444443333333333222222222211111111119876543210"&CSI&"m"
	AXSH.Echo " "&CSI&"31m321098765432109876543210987654321098765432109876543210"&CSI&"90m    (bit#)"&CSI&"m"
	AXSH.Echo
	
	AXSH.Echo " = " & F128RT.Str(Quadruple)
	' More explanations about Binary128 format coming later
End Sub

Sub ShowUDTBits (UDT)
	Dim RecType
	RecType = CreateObject("Majerus.Automation").GetRecordTypeName(UDT)
	AXSH.Echo "User-defined type: " & RecType
	
	Select Case RecType
	Case "BINARY128_UDT":
		ShowUDTBits_BINARY128 UDT
	End Select
End Sub
