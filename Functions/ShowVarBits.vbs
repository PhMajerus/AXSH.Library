'
' This procedure shows in the console the binary representation of any
' Variant.
' It uses the type-specific procedures Show*Bits according to the type
' of the provided variant.
' 
' Note a variant is always 16 bytes and can point to more date for some
' types, such as strings and objects. This function shows the bits of the
' data referenced by the variant depending on its type, it does not show
' the variant structure itself.
'

Option Explicit

Sub ShowVarBits (Var)
	Select Case VarType(Var)
		Case vbEmpty
			AXSH.Echo "Variant is empty"
		Case vbNull
			AXSH.Echo "Variant is Null"
		Case vbInteger
			ShowIntBits Var
		Case vbLong
			ShowLngBits Var
		Case vbSingle
			ShowSngBits Var
		Case vbDouble
			ShowDblBits Var
		Case vbCurrency
			ShowCurBits Var
		Case vbDate
			' Dates are Doubles internally
			ShowDblBits Var
			AXSH.Echo FormatDateTime(CDate(0), vbShortDate) &" (Epoch) + "& CDbl(Var) &" days = "& Var
		Case vbString
			ShowStrBits Var
		Case vbObject
			AXSH.Echo "Variant contains an object pointer"
		Case vbBoolean
			' Booleans are Integers internally
			ShowIntBits Var
		Case vbDataObject
			AXSH.Echo "Variant contains an object pointer"
		Case vbDecimal
			ShowDecBits Var
		Case vbByte
			ShowByteBits Var
		Case Else ' Not handled: vbBoolean, vbDecimal, all non-value types
			AXSH.Echo "Variant is an unsupported type"
	End Select
End Sub
