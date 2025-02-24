'
' Compare all floating-point and integer formats
'
' To get the full precision of Decimal, provide the value as a string.
' 
' Example usage:
' NumberConversions "3.141592653589793238462643383279"
'

Option Explicit

' Helper to convert a number string that uses a fixed or exponent-based format into its normalized form.
Private Function NumberConversions_NormalizeNumberString (Dec)
	Dim RE, M, Man, L, Exp
	Set RE = New RegExp
	RE.Pattern = "^([+-])?(\d+)?(?:\.(\d+))?(?:[eE]([+-]?\d+))?$"
	Set M = RE.Execute(Dec)
	If M.Count = 0 Then
		NumberConversions_NormalizeNumberString = Dec
		Exit Function
	End If
	Set M = M(0).SubMatches
	
	' Convert to scientific notation
	Man = M(1) & M(2) ' full mantissa as string
	L = Len(Man) ' number of digits
	If M(3)<>vbNullString Then
		Exp = CInt(M(3)) ' exponent as number
	Else
		Exp = 0
	End If
	
	' Adjust exp according to existing decimal point if present
	Exp = Exp + Len(M(1))-1
	
	' Handle as a special case if decimal point is exactly
	' the first character, so adding a leading 0 can avoid
	' having to use a decimal exponent. This can be removed
	' if scientific notation is always preferred.
	If exp = -1 Then
		NumberConversions_NormalizeNumberString = "0." & Man
	Else
		NumberConversions_NormalizeNumberString = Left(Man,1)
		If Len(Man) > 1 Then
			NumberConversions_NormalizeNumberString = NumberConversions_NormalizeNumberString & "." & Mid(Man,2)
		End If
		If Exp > 0 Then
			NumberConversions_NormalizeNumberString = NumberConversions_NormalizeNumberString & "E+" & Exp
		ElseIf Exp < 0 Then
			NumberConversions_NormalizeNumberString = NumberConversions_NormalizeNumberString & "E" & Exp
		End If
	End If
	If M(0) = "-" Then
		NumberConversions_NormalizeNumberString = "-" & NumberConversions_NormalizeNumberString
	End If
End Function

Private Function NumberConversions_Highlight (Str, RefStr, RefDbl)
	Dim S, I, L, RE, M1, M2
	S = NumberConversions_NormalizeNumberString(Str)
	Set RE = New RegExp
	RE.Pattern = "^(\d\.\d*)([eE][+-]?\d+)?$"
	
	Set M1 = RE.Execute(S)
	Set M2 = RE.Execute(RefStr)
	
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
	
	L = Len(S)
	For I = 1 To L
		If Mid(S,I,1) <> Mid(RefStr,I,1) Then Exit For
	Next
	NumberConversions_Highlight = Chr(27)&"[92m"&Left(S,I-1)&Chr(27)&"[31m"&Mid(S,I)&Chr(27)&"[m"
End Function

Sub NumberConversions (Val)
	Dim Bin, BinCv, Sng, Dbl, Cur, Dec, SV, DV, T, B128MP, D32MP, D64MP, D128MP
	
	' Ellipsis used for padding of different number of bits
	Const Ellipsis   = " . . . . . . . . . . . . . . . . . . . . . . . "
	Const Ellipsis8  =   " . . . . . . . . . . . . . . . . . . . . . . "
	Const Ellipsis16 =      ". . . . . . . . . . . . . . . . . . . . . "
	Const Ellipsis32 =            ". . . . . . . . . . . . . . . . . . "
	Const Ellipsis40 =               " . . . . . . . . . . . . . . . . "
	Const Ellipsis64 =                        ". . . . . . . . . . . . "
	
	Set Bin = CreateObject("Majerus.Automation.Binary")
	Set BinCv = CreateObject("Majerus.BinaryConverter")
	Set Sng = CreateObject("Majerus.Automation.Single")
	Set Dbl = CreateObject("Majerus.Automation.Double")
	Set Cur = CreateObject("Majerus.Automation.Currency")
	Set Dec = CreateObject("Majerus.Automation.Decimal")
	
	On Error Resume Next
	DV = CDbl(Val)
	If Err.Number <> 0 Then
		DV = Dbl.NaN
	End If
	If VarType(Val) = vbString Then
		SV = Val
	Else
		SV = FormatNumber(Val,,True,False,False)
	End If
	SV = NumberConversions_NormalizeNumberString(SV)
	AXSH.Echo "String format: " & SV
	
	' Note we use (Val) as arguments (with the extra parenthesis) to make VBScript pass the value by reference as it.
	' If we let VBScript pass it by value, it gets confused with Infinity and NaN values and raises an error on call.
	
	AXSH.Echo vbCrLf&Chr(27)&"[4mNumber conversions"&Chr(27)&"[24m"
	BinCv.ByteOrder = 0 ' boBigEndian
	AXSH.Echo Chr(27)&"[3;33mInteger formats"&Chr(27)&"[39;23m"
	T = BinCv.FromByte((Val))
	If Err.Number = 0 Then
		AXSH.Echo "Byte     : " & Bin.Hex(T,1) & Chr(27)&"[90m " & Ellipsis8 & "= " & NumberConversions_Highlight(CStr(BinCv.ToByte(T)),SV,DV)
	Else
		AXSH.Echo "Byte     : " & Err.Description
	End If
	Err.Clear
	T = BinCv.FromSByte((Val))
	If Err.Number = 0 Then
		AXSH.Echo "Int8/Shrt: " & Bin.Hex(T,1) & Chr(27)&"[90m " & Ellipsis8 & "= " & NumberConversions_Highlight(CStr(BinCv.ToSByte(T)),SV,DV)
	Else
		AXSH.Echo "Int8/Shrt: " & Err.Description
	End If
	Err.Clear
	T = BinCv.FromInt16((Val))
	If Err.Number = 0 Then
		AXSH.Echo "Int16/Int: " & Bin.Hex(T,1) & Chr(27)&"[90m " & Ellipsis16 & "= " & NumberConversions_Highlight(CStr(BinCv.ToInt16(T)),SV,DV)
	Else
		AXSH.Echo "Int16/Int: " & Err.Description
	End If
	Err.Clear
	T = BinCv.FromInt32((Val))
	If Err.Number = 0 Then
		AXSH.Echo "Int32/Lng: " & Bin.Hex(T,1) & Chr(27)&"[90m " & Ellipsis32 & "= " & NumberConversions_Highlight(CStr(BinCv.ToInt32(T)),SV,DV)
	Else
		AXSH.Echo "Int32/Lng: " & Err.Description
	End If
	AXSH.Echo Chr(27)&"[3;33mFloating-point & fixed-point formats"&Chr(27)&"[2m (native)"&Chr(27)&"[22;39;23m"
	T = BinCv.FromSingle((Val))
	If Err.Number = 0 Then
		AXSH.Echo "Single   : " & Bin.Hex(T,1) & Chr(27)&"[90m " & Ellipsis32 & "= " & NumberConversions_Highlight(Dbl.Str(BinCv.ToSingle(T)),SV,DV)
	Else
		AXSH.Echo "Single   : " & Err.Description
	End If
	Err.Clear
	T = BinCv.FromDouble((Val))
	If Err.Number = 0 Then
		AXSH.Echo "Double   : " & Bin.Hex(T,1) & Chr(27)&"[90m " & Ellipsis64 & "= " & NumberConversions_Highlight(Dbl.Str(BinCv.ToDouble(T)),SV,DV)
	Else
		AXSH.Echo "Double   : " & Err.Description
	End If
	Err.Clear
	
	T = BinCv.FromCurrency((Val))
	If Err.Number = 0 Then
		AXSH.Echo "Currency : " & Bin.Hex(T,1) & Chr(27)&"[90m " & Ellipsis64 & "= " & NumberConversions_Highlight(Cur.Str(BinCv.ToCurrency(T)),SV,DV)
	Else
		AXSH.Echo "Currency : " & Err.Description
	End If
	Err.Clear
	T = BinCv.FromDecimal((Val),True)
	If Err.Number = 0 Then
		AXSH.Echo "Decimal  : " & Bin.Hex(T,1) & Chr(27)&"[90m 00 0E = " & NumberConversions_Highlight(Dec.Str(BinCv.ToDecimal(T,True)),SV,DV)
	Else
		AXSH.Echo "Decimal  : " & Err.Description
	End If
	
	AXSH.Echo Chr(27)&"[3;33mIEEE 754 binary floating-point formats"&Chr(27)&"[2m (extras)"&Chr(27)&"[22;39;23m"
	Set B128MP = CreateObject("Majerus.Quadruple")
	T = B128MP.Convert((Val))
	AXSH.Echo "Quadruple: " & Bin.Hex(B128MP.GetBinary(T,0),1) & Chr(27)&"[90m = " & NumberConversions_Highlight(B128MP.Str(T),SV,DV)	
	
	AXSH.Echo Chr(27)&"[3;33mMinifloats"&Chr(27)&"[2m (GPUs & NPUs/TPUs)"&Chr(27)&"[22;39;23m"
	T = BinCv.FromHalf((Val))
	If Err.Number = 0 Then
		AXSH.Echo "FP16/Half: " & Bin.Hex(T,1) & Chr(27)&"[90m " & Ellipsis16 & "= " & NumberConversions_Highlight(Dbl.Str(BinCv.ToHalf(T)),SV,DV)
	Else
		AXSH.Echo "FP16/Half: " & Err.Description
	End If
	Err.Clear
	T = BinCv.FromBfloat16((Val))
	If Err.Number = 0 Then
		AXSH.Echo "BFloat16 : " & Bin.Hex(T,1) & Chr(27)&"[90m " & Ellipsis16 & "= " & NumberConversions_Highlight(Dbl.Str(BinCv.ToBfloat16(T)),SV,DV)
	Else
		AXSH.Echo "BFloat16 : " & Err.Description
	End If
	Err.Clear
	T = BinCv.FromFP8E4M3((Val))
	If Err.Number = 0 Then
		AXSH.Echo "FP8 E4M3 : " & Bin.Hex(T,1) & Chr(27)&"[90m " & Ellipsis8 & "= " & NumberConversions_Highlight(Dbl.Str(BinCv.ToFP8E4M3(T)),SV,DV)
	Else
		AXSH.Echo "FP8 E4M3 : " & Err.Description
	End If
	Err.Clear
	T = BinCv.FromFP8E5M2((Val))
	If Err.Number =  0 Then
		AXSH.Echo "FP8 E5M2 : " & Bin.Hex(T,1) & Chr(27)&"[90m " & Ellipsis8 & "= " & NumberConversions_Highlight(Dbl.Str(BinCv.ToFP8E5M2(T)),SV,DV)
	Else
		AXSH.Echo "FP8 E5M2 : " & Err.Description
	End If
	Err.Clear
	
	AXSH.Echo Chr(27)&"[3;33mIEEE 754 decimal floating-point formats"&Chr(27)&"[m"
	Set D32MP = CreateObject("Majerus.Decimal32")
	T = D32MP.Convert((Val))
	AXSH.Echo "D32 BID  : " & Bin.Hex(D32MP.GetBIDBinary(T,0),1) & Chr(27)&"[90m " & Ellipsis32 & "= " & NumberConversions_Highlight(D32MP.Str(T),SV,DV)
	AXSH.Echo "D32 DPD  : " & Bin.Hex(D32MP.GetDPDBinary(T,0),1) & Chr(27)&"[90m " & Ellipsis32 & "= " & NumberConversions_Highlight(D32MP.Str(T),SV,DV)
	Set D64MP = CreateObject("Majerus.Decimal64")
	T = D64MP.Convert((Val))
	AXSH.Echo "D64 BID  : " & Bin.Hex(D64MP.GetBIDBinary(T,0),1) & Chr(27)&"[90m " & Ellipsis64 & "= " & NumberConversions_Highlight(D64MP.Str(T),SV,DV)
	AXSH.Echo "D64 DPD  : " & Bin.Hex(D64MP.GetDPDBinary(T,0),1) & Chr(27)&"[90m " & Ellipsis64 & "= " & NumberConversions_Highlight(D64MP.Str(T),SV,DV)
	Set D128MP = CreateObject("Majerus.Decimal128")
	T = D128MP.Convert((Val))
	AXSH.Echo "D128 BID : " & Bin.Hex(D128MP.GetBIDBinary(T,0),1) & Chr(27)&"[90m = " & NumberConversions_Highlight(D128MP.Str(T),SV,DV)
	AXSH.Echo "D128 DPD : " & Bin.Hex(D128MP.GetDPDBinary(T,0),1) & Chr(27)&"[90m = " & NumberConversions_Highlight(D128MP.Str(T),SV,DV)
	
	AXSH.Echo Chr(27)&"[3;33mLegacy BASIC formats"&Chr(27)&"[2m (binary & decimal/BCD)"&Chr(27)&"[22;39;23m"
	T = BinCv.FromMBF32((Val))
	If Err.Number = 0 Then
		AXSH.Echo "MBF 32   : " & Bin.Hex(T,1) & Chr(27)&"[90m " & Ellipsis32 & "= " & NumberConversions_Highlight(Dbl.Str(BinCv.ToMBF32(T)),SV,DV)
	Else
		AXSH.Echo "MBF 32   : " & Err.Description
	End If
	Err.Clear
	T = BinCv.FromMBF40((Val))
	If Err.Number = 0 Then
		AXSH.Echo "MBF 40   : " & Bin.Hex(T,1) & Chr(27)&"[90m " & Ellipsis40 & "= " & NumberConversions_Highlight(Dbl.Str(BinCv.ToMBF40(T)),SV,DV)
	Else
		AXSH.Echo "MBF 40   : " & Err.Description
	End If
	Err.Clear
	T = BinCv.FromMBF64((Val))
	If Err.Number = 0 Then
		AXSH.Echo "MBF 64   : " & Bin.Hex(T,1) & Chr(27)&"[90m " & Ellipsis64 & "= " & NumberConversions_Highlight(Dbl.Str(BinCv.ToMBF64(T)),SV,DV)
	Else
		AXSH.Echo "MBF 64   : " & Err.Description
	End If
	Err.Clear
	T = BinCv.FromMDF32((Val))
	If Err.Number = 0 Then
		AXSH.Echo "MDF 32   : " & Bin.Hex(T,1) & Chr(27)&"[90m " & Ellipsis32 & "= " & NumberConversions_Highlight(Dbl.Str(BinCv.ToMDF32(T)),SV,DV)
	Else
		AXSH.Echo "MDF 32   : " & Err.Description
	End If
	Err.Clear
	T = BinCv.FromMDF64((Val))
	If Err.Number = 0 Then
		AXSH.Echo "MDF 64   : " & Bin.Hex(T,1) & Chr(27)&"[90m " & Ellipsis64 & "= " & NumberConversions_Highlight(Dbl.Str(BinCv.ToMDF64(T)),SV,DV)
	Else
		AXSH.Echo "MDF 64   : " & Err.Description
	End If
	Err.Clear
	T = BinCv.FromZ80BBCBasic((Val))
	If Err.Number = 0 Then
		AXSH.Echo "Z80 BBC B: " & Bin.Hex(T,1) & Chr(27)&"[90m " & Ellipsis40 & "= " & NumberConversions_Highlight(Dbl.Str(BinCv.ToZ80BBCBasic(T)),SV,DV)
	Else
		AXSH.Echo "Z80 BBC B: " & Err.Description
	End If
	Err.Clear
	
	AXSH.Echo Chr(27)&"[3;33mOther legacy formats"&Chr(27)&"[2m (electronics, calculators, "&ChrW(&h2026)&")"&Chr(27)&"[22;39;23m"
	T = BinCv.FromBCD((Val))
	If Err.Number = 0 Then
		If Bin.GetSize(T) = 0 Then
			AXSH.Echo "BCD      : " & Chr(27)&"[90m " & Ellipsis & "= " & NumberConversions_Highlight(Dec.Str(BinCv.ToBCD(T)),SV,DV)
		Else
			AXSH.Echo "BCD      : " & Bin.Hex(T,1) & Chr(27)&"[90m " & Mid(Ellipsis,Bin.GetSize(T)*3) & "= " & NumberConversions_Highlight(Dec.Str(BinCv.ToBCD(T)),SV,DV)
		End If
	Else
		AXSH.Echo "BCD      : " & Err.Description
	End If
	
	On Error GoTo 0
End Sub
