'
' Compare all floating-point and integer formats
'
' To get the full precision of Decimal, provide the value as a string.
' 
' Example usage:
' NumberConversions "3.141592653589793238462643383279"
'

Option Explicit

Private Function NumberConversions_Highlight (Str, RefStr, RefDbl)
	Dim I, L, RE, M1, M2
	Set RE = New RegExp
	RE.Pattern = "^(\d\.\d*)([eE][+-]?\d+)?$"
	
	Set M1 = RE.Execute(Str)
	Set M2 = RE.Execute(CStr(RefDbl))
	
	' Should we compare as scientific notations, or lexicographically?
	' If both values are parsed by the regexp and their exponents match, compare as scientific.
	If (M1.Count <> 0) And (M2.Count <> 0) Then
		If (M1(0).SubMatches(1)=M2(0).SubMatches(1)) Then 
			Dim S1, S2, E1
			S1 = M1(0).SubMatches(0)
			S2 = M2(0).SubMatches(0)
			L = Len(S1)
			For I = 1 To L
				If Mid(S1,I,1) <> Mid(S2,I,1) Then Exit For
			Next
			NumberConversions_Highlight = Chr(27)&"[92m"&Left(S1,I-1)&Chr(27)&"[31m"&Mid(S1,I)&Chr(27)&"[92m"&M1(0).SubMatches(1)&Chr(27)&"[m"
			Exit Function
		End If
	End If
	
	L = Len(Str)
	For I = 1 To L
		If Mid(Str,I,1) <> Mid(RefStr,I,1) Then Exit For
	Next
	NumberConversions_Highlight = Chr(27)&"[92m"&Left(Str,I-1)&Chr(27)&"[31m"&Mid(Str,I)&Chr(27)&"[m"
End Function

Sub NumberConversions (Val)
	Dim Encodings, BinCv, Sng, Dbl, Cur, Dec, SV, DV, T, D32MP, D64MP, D128MP
	Const Al = "0123456789ABCDEF "
	
	' Ellipsis used for padding of different number of bits
	Const Ellipsis8 = " . . . . . . . . . . . . . . . . . . . . . . "
	Const Ellipsis16 = ". . . . . . . . . . . . . . . . . . . . . "
	Const Ellipsis32 = ". . . . . . . . . . . . . . . . . . "
	Const Ellipsis40 = " . . . . . . . . . . . . . . . . "
	Const Ellipsis64 = ". . . . . . . . . . . . "
	
	Set Encodings = CreateObject("AXSH.Encodings")
	Set BinCv = CreateObject("Majerus.BinaryConverter")
	Set Sng = CreateObject("Majerus.Automation.Single")
	Set Dbl = CreateObject("Majerus.Automation.Double")
	Set Cur = CreateObject("Majerus.Automation.Currency")
	Set Dec = CreateObject("Majerus.Automation.Decimal")
	
	DV = CDbl(Val)
	If VarType(Val) = vbString Then
		SV = Val
	Else
		SV = FormatNumber(Val,,True,False,False)
	End If
	
	' Note we use (Val) as arguments (with the extra parenthesis) to make VBScript pass the value by reference as it.
	' If we let VBScript pass it by value, it gets confused with Infinity and NaN values and raises an error on call.
	
	AXSH.Echo vbCrLf&Chr(27)&"[4mNumber conversions"&Chr(27)&"[24m"
	BinCv.ByteOrder = 0 ' boBigEndian
	AXSH.Echo Chr(27)&"[3;33mInteger formats"&Chr(27)&"[39;23m"
	On Error Resume Next
	T = BinCv.FromByte((Val))
	If Err.Number = 0 Then
		AXSH.Echo "Byte     : " & Encodings.BinaryToBase16(T,Al) & Chr(27)&"[90m " & Ellipsis8 & "= " & NumberConversions_Highlight(CStr(BinCv.ToByte(T)),SV,DV)
	Else
		AXSH.Echo "Byte     : " & Err.Description
	End If
	Err.Clear
	T = BinCv.FromSByte((Val))
	If Err.Number = 0 Then
		AXSH.Echo "Int8     : " & Encodings.BinaryToBase16(T,Al) & Chr(27)&"[90m " & Ellipsis8 & "= " & NumberConversions_Highlight(CStr(BinCv.ToSByte(T)),SV,DV)
	Else
		AXSH.Echo "Int8     : " & Err.Description
	End If
	Err.Clear
	T = BinCv.FromInt16((Val))
	If Err.Number = 0 Then
		AXSH.Echo "Int16/Int: " & Encodings.BinaryToBase16(T,Al) & Chr(27)&"[90m " & Ellipsis16 & "= " & NumberConversions_Highlight(CStr(BinCv.ToInt16(T)),SV,DV)
	Else
		AXSH.Echo "Int16/Int: " & Err.Description
	End If
	Err.Clear
	T = BinCv.FromInt32((Val))
	If Err.Number = 0 Then
		AXSH.Echo "Int32/Lng: " & Encodings.BinaryToBase16(T,Al) & Chr(27)&"[90m " & Ellipsis32 & "= " & NumberConversions_Highlight(CStr(BinCv.ToInt32(T)),SV,DV)
	Else
		AXSH.Echo "Int32/Lng: " & Err.Description
	End If
	On Error GoTo 0
	AXSH.Echo Chr(27)&"[3;33mFloating-point & fixed-point formats"&Chr(27)&"[39;23m"
	T = BinCv.FromSingle((Val))
	AXSH.Echo "Single   : " & Encodings.BinaryToBase16(T,Al) & Chr(27)&"[90m " & Ellipsis32 & "= " & NumberConversions_Highlight(Dbl.Str(BinCv.ToSingle(T)),SV,DV)
	T = BinCv.FromDouble((Val))
	AXSH.Echo "Double   : " & Encodings.BinaryToBase16(T,Al) & Chr(27)&"[90m " & Ellipsis64 & "= " & NumberConversions_Highlight(Dbl.Str(BinCv.ToDouble(T)),SV,DV)
	
	On Error Resume Next
	T = BinCv.FromCurrency((Val))
	If Err.Number = 0 Then
		AXSH.Echo "Currency : " & Encodings.BinaryToBase16(T,Al) & Chr(27)&"[90m " & Ellipsis64 & "= " & NumberConversions_Highlight(Cur.Str(BinCv.ToCurrency(T)),SV,DV)
	Else
		AXSH.Echo "Currency : " & Err.Description
	End If
	Err.Clear
	T = BinCv.FromDecimal((Val),True)
	If Err.Number = 0 Then
		AXSH.Echo "Decimal  : " & Encodings.BinaryToBase16(T,Al) & Chr(27)&"[90m 00 0E = " & NumberConversions_Highlight(Dec.Str(BinCv.ToDecimal(T,True)),SV,DV)
	Else
		AXSH.Echo "Decimal  : " & Err.Description
	End If
	On Error GoTo 0
	
	AXSH.Echo Chr(27)&"[3;33mMinifloats"&Chr(27)&"[2m (GPUs & NPUs/TPUs)"&Chr(27)&"[22;39;23m"
	T = BinCv.FromHalf((Val))
	AXSH.Echo "FP16/Half: " & Encodings.BinaryToBase16(T,Al) & Chr(27)&"[90m " & Ellipsis16 & "= " & NumberConversions_Highlight(Dbl.Str(BinCv.ToHalf(T)),SV,DV)
	T = BinCv.FromBfloat16((Val))
	AXSH.Echo "BFloat16 : " & Encodings.BinaryToBase16(T,Al) & Chr(27)&"[90m " & Ellipsis16 & "= " & NumberConversions_Highlight(Dbl.Str(BinCv.ToBfloat16(T)),SV,DV)
	T = BinCv.FromFP8E4M3((Val))
	AXSH.Echo "FP8 E4M3 : " & Encodings.BinaryToBase16(T,Al) & Chr(27)&"[90m " & Ellipsis8 & "= " & NumberConversions_Highlight(Dbl.Str(BinCv.ToFP8E4M3(T)),SV,DV)
	T = BinCv.FromFP8E5M2((Val))
	AXSH.Echo "FP8 E5M2 : " & Encodings.BinaryToBase16(T,Al) & Chr(27)&"[90m " & Ellipsis8 & "= " & NumberConversions_Highlight(Dbl.Str(BinCv.ToFP8E5M2(T)),SV,DV)
	
	AXSH.Echo Chr(27)&"[3;33mIEEE 754 decimal floating-point formats"&Chr(27)&"[m"
	Set D32MP = CreateObject("Majerus.Decimal32")
	T = D32MP.Convert((Val))
	AXSH.Echo "d32 BID  : " & Encodings.BinaryToBase16(D32MP.GetBIDBinary(T,0),Al) & Chr(27)&"[90m " & Ellipsis32 & "= " & NumberConversions_Highlight(D32MP.Str(T),SV,DV)
	AXSH.Echo "d32 DPD  : " & Encodings.BinaryToBase16(D32MP.GetDPDBinary(T,0),Al) & Chr(27)&"[90m " & Ellipsis32 & "= " & NumberConversions_Highlight(D32MP.Str(T),SV,DV)
	Set D64MP = CreateObject("Majerus.Decimal64")
	T = D64MP.Convert((Val))
	AXSH.Echo "d64 BID  : " & Encodings.BinaryToBase16(D64MP.GetBIDBinary(T,0),Al) & Chr(27)&"[90m " & Ellipsis64 & "= " & NumberConversions_Highlight(D64MP.Str(T),SV,DV)
	AXSH.Echo "d64 DPD  : " & Encodings.BinaryToBase16(D64MP.GetDPDBinary(T,0),Al) & Chr(27)&"[90m " & Ellipsis64 & "= " & NumberConversions_Highlight(D64MP.Str(T),SV,DV)
	Set D128MP = CreateObject("Majerus.Decimal128")
	T = D128MP.Convert((Val))
	AXSH.Echo "d128 BID : " & Encodings.BinaryToBase16(D128MP.GetBIDBinary(T,0),Al) & Chr(27)&"[90m = " & NumberConversions_Highlight(D128MP.Str(T),SV,DV)
	AXSH.Echo "d128 DPD : " & Encodings.BinaryToBase16(D128MP.GetDPDBinary(T,0),Al) & Chr(27)&"[90m = " & NumberConversions_Highlight(D128MP.Str(T),SV,DV)
	
	AXSH.Echo Chr(27)&"[3;33mLegacy Microsoft BASIC formats"&Chr(27)&"[2m (binary & decimal/BCD)"&Chr(27)&"[22;39;23m"
	On Error Resume Next
	T = BinCv.FromMBF32((Val))
	If Err.Number = 0 Then
		AXSH.Echo "MBF 32   : " & Encodings.BinaryToBase16(T,Al) & Chr(27)&"[90m " & Ellipsis32 & "= " & NumberConversions_Highlight(Dbl.Str(BinCv.ToMBF32(T)),SV,DV)
	Else
		AXSH.Echo "MBF 32   : " & Err.Description
	End If
	Err.Clear
	T = BinCv.FromMBF40((Val))
	If Err.Number = 0 Then
		AXSH.Echo "MBF 40   : " & Encodings.BinaryToBase16(T,Al) & Chr(27)&"[90m " & Ellipsis40 & "= " & NumberConversions_Highlight(Dbl.Str(BinCv.ToMBF40(T)),SV,DV)
	Else
		AXSH.Echo "MBF 40   : " & Err.Description
	End If
	Err.Clear
	T = BinCv.FromMBF64((Val))
	If Err.Number = 0 Then
		AXSH.Echo "MBF 64   : " & Encodings.BinaryToBase16(T,AL) & Chr(27)&"[90m " & Ellipsis64 & "= " & NumberConversions_Highlight(Dbl.Str(BinCv.ToMBF64(T)),SV,DV)
	Else
		AXSH.Echo "MBF 64   : " & Err.Description
	End If
	Err.Clear
	T = BinCv.FromMDF32((Val))
	If Err.Number = 0 Then
		AXSH.Echo "MDF 32   : " & Encodings.BinaryToBase16(T,AL) & Chr(27)&"[90m " & Ellipsis32 & "= " & NumberConversions_Highlight(Dbl.Str(BinCv.ToMDF32(T)),SV,DV)
	Else
		AXSH.Echo "MDF 32   : " & Err.Description
	End If
	Err.Clear
	T = BinCv.FromMDF64((Val))
	If Err.Number = 0 Then
		AXSH.Echo "MDF 64   : " & Encodings.BinaryToBase16(T,AL) & Chr(27)&"[90m " & Ellipsis64 & "= " & NumberConversions_Highlight(Dbl.Str(BinCv.ToMDF64(T)),SV,DV)
	Else
		AXSH.Echo "MDF 64   : " & Err.Description
	End If
	On Error GoTo 0
End Sub
