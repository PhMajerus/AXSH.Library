'
' Pascal's triangle generation function
' 
' This function generated a triangular array of the binomial coefficients.
' 
' The following array of arrays is returned:
' 0:              1
' 1:            1   1
' 2:          1   2   1
' 3:        1   3   3   1
' 4:      1   4   6   4   1
' ...:  .   .   .   .   .   .
' 
' You can show a Pascal's triangle on screen using the following commands:
' ' Array Reducer function to reduce an array into a single string of even width values.
' Function TmpFunc1(A,Item): TmpFunc1 = A & Strings.CSet(Item,6): End Function
' ' Array Map function to reduce each subarray into a string and center it.
' Function TmpFunc2(Line): TmpFunc2 = Strings.CSet(Arrays.Reduce(Line, GetRef("TmpFunc1"), ""),80): End Function
' ' Use previously defined array handling functions to convert triangle to an array of lines and join them.
' Echo Join(Arrays.Map(BuildPascalTriangle(13), GetRef("TmpFunc2")), vbCrLf)
' 
' - Philippe Majerus, May 2018
'

Option Explicit

Function BuildPascalTriangle(Rows)
	If Rows < 1 Then
		Err.Raise 5, , "Rows argument must be greater than zero"
	End If
	
	Dim Triangle(), I, J, Row, NextRow()
	
	ReDim Triangle(Rows-1)
	Triangle(0) = Array(1)
	
	For I = 1 To Rows-1
		Row = Triangle(I-1)
		
		ReDim NextRow(UBound(Row)+1)
		J = 0
		NextRow(J) = Row(J)
		J = J+1
		While J <= UBound(Row)
			NextRow(J) = (Row(J-1) + Row(J))
			J = J+1
		WEnd
		NextRow(J) = Row(J-1)
		
		Triangle(I) = NextRow
	Next
	
	BuildPascalTriangle = Triangle
End Function
