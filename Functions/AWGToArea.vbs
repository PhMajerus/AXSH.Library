'
' Convert AWG (American Wire Gauge) to metric cross-section area (mm²)
' 
' The result is in mm², as commonly used in wires cross-section area
' measurements. Remember to divide by 1E3 if you need it in meters.
' 
' This function expect the AWG numerical value, for special 00, 000, 0000
' values, use negative numbers as follows:
'  No. 0    (1/0) ->  0
'  No. 00   (2/0) -> -1
'  No. 000  (3/0) -> -2
'  No. 0000 (4/0) -> -3
'

Option Explicit

Function AWGToArea (N)
	Dim Diameter
	Const AWG36 = 0.127 ' 0.005 inches = 0.127mm
	Const PIOver4 = 0.7853981633974483 ' PI/4
	
	' Calculate diameter
	Diameter = AWG36 * 92^((36-N)/39)
	' Calculate area from diameter
	AWGToArea = PIOver4 * Diameter^2
End Function
