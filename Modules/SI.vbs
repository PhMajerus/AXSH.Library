'****************************************************************************
'* SI.vbs  (VBScript Module) 
'*
'* Metric and SI (International System of Units) helper module for VBScript.
'* This module contains multipliers prefixes as properties, and methods
'* to format string representations of numbers in scientific notations with
'* prefixes symbols.
'* 
'* - Philippe Majerus, November 2017.
'* 
'****************************************************************************


Option Explicit


' Module name to document errors source
Private Const ErrSource = "SI module"

' Metric/SI prefixes by names
Public Const Yotta = 1E24
Public Const Zetta = 1E21
Public Const Exa = 1E18
Public Const Peta = 1E15
Public Const Tera = 1E12
Public Const Giga = 1E9
Public Const Mega = 1E6
Public Const Kilo = 1E3
Public Const Hecto = 1E2
Public Const Deca = 1E1
Public Const Deci = 1E-1
Public Const Centi = 1E-2
Public Const Milli = 1E-3
Public Const Micro = 1E-6
Public Const Nano = 1E-9
Public Const Pico = 1E-12
Public Const Femto = 1E-15
Public Const Atto = 1E-18
Public Const Zepto = 1E-21
Public Const Yocto = 1E-24


' Symbols tables
Private PositiveSI, NegativeSI, PositiveB10, NegativeB10
PositiveSI = Array("k","M","G","T","P","E","Z","Y")
NegativeSI = Array("m",ChrW(&h00B5),"n","p","f","a","z","y")
PositiveB10 = Array("da","h")
NegativeB10 = Array("d","c")


' Helper function
Private Const LOG10E = 0.43429448190325182
Private Function Log10(Number)
	Log10 = Log(Number) * LOG10E
End Function


' Format a number to a base 10 SI number & prefix symbol string
Public Function Sym (Number)
	Dim Significand, Exponent
	
	If Number = 0 Then
		Sym = "0"
		Exit Function
	End If
	
	' Find exponent
	Exponent = Int(Log10(Abs(Number)))
	If Abs(Exponent) < 3 Then
		' hecto, deca, unit, deci or centi
		Significand = FormatNumber(Number / (10^Exponent), 2)
		If Exponent = 0 Then
			Sym = Significand
		ElseIf Exponent < 0 Then
			Sym = Significand & NegativeB10(-Exponent-1)
		Else
			Sym = Significand & PositiveB10(Exponent-1)
		End If
	Else
		' standard base 1000 symbol
		Exponent = Int(Exponent \ 3)
		If Exponent > (UBound(PositiveSI)+1) Then
			Exponent = (UBound(PositiveSI)+1)
		ElseIf Exponent < -(UBound(NegativeSI)+1) Then
			Exponent = -(UBound(NegativeSI)+1)
		End If
		Significand = FormatNumber(Number / (10^(Exponent*3)), 2)
		If Exponent < 0 Then
			Sym = Significand & NegativeSI(-Exponent-1)
		Else
			Sym = Significand & PositiveSI(Exponent-1)
		End If
	End If	
End Function

' Format a number to a base 1000 SI number & prefix symbol string
Public Function SymSI (Number)
	Dim Significand, Exponent
	
	If Number = 0 Then
		SymSI = "0"
		Exit Function
	End If
	
	' Find exponent
	Exponent = Int(Log10(Abs(Number)) \ 3)
	If Exponent > (UBound(PositiveSI)+1) Then
		Exponent = (UBound(PositiveSI)+1)
	ElseIf Exponent < -(UBound(NegativeSI)+1) Then
		Exponent = -(UBound(NegativeSI)+1)
	End If
	
	Significand = FormatNumber(Number / (10^(Exponent*3)), 2)
	If Exponent = 0 Then
		SymSI = Significand
	ElseIf Exponent < 0 Then
		SymSI = Significand & NegativeSI(-Exponent-1)
	Else
		SymSI = Significand & PositiveSI(Exponent-1)
	End If
End Function

' Returns a string representing a number in scientific exponential notation
' with one digit before the decimal point, and as many digits as necessary
' to represent the number after the decimal point.
Public Function ExpNorm (Number)
	Dim Significand, Exponent
	
	If Number = 0 Then
		ExpNorm = "0e0"
		Exit Function
	End If
	
	' Find exponent
	Exponent = Int(Log10(Abs(Number)))
	Significand = FormatNumber(Number / (10^Exponent), 2)
	If Exponent < 0 Then
		ExpNorm = Significand & "e-" & CStr(-Exponent)
	Else
		ExpNorm = Significand & "e" & CStr(Exponent)
	End If
End Function

' Returns a string representing a number in engineering exponential notation.
' Similar to ExpNorm, but with the exponent restricted to multiples of 3.
Public Function ExpEng (Number)
	Dim Significand, Exponent
	
	If Number = 0 Then
		ExpEng = "0e0"
		Exit Function
	End If
	
	' Find exponent
	Exponent = Int(Log10(Abs(Number)) \ 3) * 3
	Significand = FormatNumber(Number / (10^Exponent), 2)
	If Exponent < 0 Then
		ExpEng = Significand & "e-" & CStr(-Exponent)
	Else
		ExpEng = Significand & "e" & CStr(Exponent)
	End If
End Function

' Convert a symbol to corresponding 10^exp exponent number.
Private Function SymbolToExponent(strSymbol)
	Select Case strSymbol
		Case "Y": SymbolToExponent = 24
		Case "Z": SymbolToExponent = 21
		Case "E": SymbolToExponent = 18
		Case "P": SymbolToExponent = 15
		Case "T": SymbolToExponent = 12
		Case "G": SymbolToExponent = 9
		Case "M": SymbolToExponent = 6
		Case "k": SymbolToExponent = 3
		Case "h": SymbolToExponent = 2
		Case "da": SymbolToExponent = 1
		Case "d": SymbolToExponent = -1
		Case "c": SymbolToExponent = -2
		Case "m": SymbolToExponent = -3
		Case "u": SymbolToExponent = -6
		Case ChrW(&h00B5): SymbolToExponent = -6
		Case "n": SymbolToExponent = -9
		Case "p": SymbolToExponent = -12
		Case "f": SymbolToExponent = -15
		Case "a": SymbolToExponent = -18
		Case "z": SymbolToExponent = -21
		Case "y": SymbolToExponent = -24
	End Select
End Function

' Parses a number from a string in scientific, engineering, SI or common symbol notation.
' This can parse strings such as "5.3k", "2.4e12", "24E2m".
Public Function Parse(strNumber)
	Dim NumberRegex, ms, num, exp
	
	Set NumberRegex = New RegExp
	NumberRegex.Pattern = "^(([-+]?\d*)(\.\d*)?)([eE]([-+]?\d+))?[\s\uFEFF\xA0]?([yzafpnu\xB5mcdhkMGTPEZY]|da)?$"
	' SubMatches:           [    0 = number    ][ 3=scient.exp. ][    space    ][         5 = symbol          ]
	'                        [ 1=int. ][2=dec.]      [4=E.num.]
	NumberRegex.Global = False
	NumberRegex.MultiLine = False
	NumberRegex.IgnoreCase = False
	
	Set ms = NumberRegex.Execute(strNumber)
	If ms.Count = 0 Then
		Err.Raise 5, ErrSource, "Parse argument """& strNumber &""" is not a valid number"
	End If
	num = CDbl(ms(0).SubMatches(0))
	exp = 0
	If ms(0).SubMatches(4) <> "" Then
		exp = CInt(ms(0).SubMatches(4))
	End If
	If ms(0).SubMatches(5) <> "" Then
		exp = exp + SymbolToExponent(ms(0).SubMatches(5))
	End If
	Parse = num * 10^exp
End Function

' Convert a unit to a corresponding metric/SI multiplier
Private Function UnitToMultiplier(strUnit)
	Select Case strUnit
		' Volume
		Case "ustsp": UnitToMultiplier = 202.88 ' US Teaspoons
		Case "ustblsp": UnitToMultiplier = 67.628 ' US Tablespoons
		Case "usfloz": UnitToMultiplier = 33.814 ' US Fluid Ounces
		Case "uscup": UnitToMultiplier = 4.2268 ' US Cups
		Case "uspt": UnitToMultiplier = 2.1134 ' US Pints
		Case "usqt": UnitToMultiplier = 1.0567 ' US Quarts (liquid)
		Case "usqtdry": UnitToMultiplier = 0.90808 ' US Quarts (dry)
		Case "usgal": UnitToMultiplier = 0.26417 ' US Gallons
		Case "uktsp": UnitToMultiplier = 281.56 ' UK Teaspoons
		Case "uktblsp": UnitToMultiplier = 70.390 ' UK Tablespoons
		Case "ukfloz": UnitToMultiplier = 35.195 ' UK Fluid Ounces
		Case "ukpt": UnitToMultiplier = 1.7598 ' UK Pints
		Case "ukqt": UnitToMultiplier = 0.87988 ' UK Quarts
		Case "ukgal": UnitToMultiplier = 0.21997 ' UK Gallons
		' Length
		Case "au": UnitToMultiplier = 1/149597870700 ' Astronomical units
		Case "ly": UnitToMultiplier = 1/9460730472580800 ' Light-years
		Case "in": UnitToMultiplier = 39.370 ' Inches
		Case "ft": UnitToMultiplier = 3.2808 ' Feet
		Case "yd": UnitToMultiplier = 1.0936 ' Yards
		Case "mi": UnitToMultiplier = 6.2137E-4 ' Miles
		Case "nmi": UnitToMultiplier = 5.3996E-4 ' Nautical Miles
		Case "lp": UnitToMultiplier = 1/1.616255E-35 ' Planck length
		Case "pc": UnitToMultiplier = 1/3.0857E-16 ' Parsec
		Case "LD": UnitToMultiplier = 1/384399000 ' Lunar distance
		' Weight and Mass
		Case "ct": UnitToMultiplier = 5.0 ' Carats
		Case "oz": UnitToMultiplier = 3.52739619495804E-2 ' Ounces
		Case "lb": UnitToMultiplier = 2.20462262184878E-3 ' Pounds
		Case "st": UnitToMultiplier = 1.5747304441777E-4 ' Stones
		Case "ust": UnitToMultiplier = 1.10231131092439E-6 ' US Short tons
		Case "ukt": UnitToMultiplier = 9.84206527611061E-7 ' UK Long tons
		' Unknown
		Case Else: UnitToMultiplier = Null
	End Select
End Function

' Convert from a legacy/non-standard unit to metric/SI
Public Function From(Number, strUnit)
	Dim Multiplier
	Multiplier = UnitToMultiplier(strUnit)
	If IsNull(Multiplier) Then
		Err.Raise 5, ErrSource, "From strUnit """& strUnit &""" is not a known unit, try prefixing unit with ""us"" or ""uk"""
	End If
	From = Number / Multiplier
End Function

' Convert from metric/SI to a legacy/non-standard unit
' "To" is a reserved keyword, but there is a workaround to be able to use it as a method name.
Public Function [To](Number, strUnit)
	Dim Multiplier
	Multiplier = UnitToMultiplier(strUnit)
	If IsNull(Multiplier) Then
		Err.Raise 5, ErrSource, "To strUnit """& strUnit &""" is not a known unit, try prefixing unit with ""us"" or ""uk"""
	End If
	[To] = Number * Multiplier
End Function
