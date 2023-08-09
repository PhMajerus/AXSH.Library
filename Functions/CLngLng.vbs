'
' Converts an expression to a Variant of subtype LongLong (signed 32-bit integer number).
' 
' Note VBScript automatically converts the returned variant into a Long if it doesn't require a LongLong to fit.
'

Option Explicit

Function CLngLng (Number)
	CLngLng = CreateObject("Majerus.Automation.Int64").Convert(Number)
End Function
