'
' Converts an expression to a Variant of subtype Decimal.
' 
' Note VBScript built-in operators and functions cannot handle Decimal
' variants, use them with external objects and libraries.
'

Option Explicit

Function CDec (Number)
	CDec = CreateObject("Majerus.Automation.Decimal").Convert(Number)
End Function
