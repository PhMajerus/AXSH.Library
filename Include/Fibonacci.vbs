'****************************************************************************
'* Fibonacci.vbs  (VBScript Include)
'* Defines a Fibonacci sequence class for VBScript.
'* 
'* VBScript supports enumerable objects using the For Each...Next statement,
'* but does not support creating such objects in VBScript itself.
'* It is however possible to support a simple iteration scheme using the
'* While...WEnd statement by creating an object with a stepping method and
'* a default value property.
'* 
'* This sample provides a Fibonacci class that supports such iteration.
'* It provides the Fibonacci sequence from 0 to the largest number VBScript
'* can represent using Double without losing precision, which is 79 values.
'* Note that VBScript never displays more than 15 significant digits, so
'* while a Double can store up to 9,007,199,254,740,992 with integer
'* accuracy, is will round it to "9,007,199,254,740,990" when displaying it.
'* 
'* The .Current default property contains Empty before the first .MoveNext
'* call and after .MoveNext returned False, indicating the end of the
'* iteration.
'* 
'* Such objects can be iterated as follows:
'* Set F = New Fibonacci: While F.MoveNext: Echo F: WEnd
'* Or without creating a temporary variable as follows:
'* With New Fibonacci: While .MoveNext: Echo .Current: WEnd: End With
'* 
'* - Philippe Majerus, January 2019
'* 
'****************************************************************************


Option Explicit

Class Fibonacci
		Private m_Current, m_Next
		Private MAX_SAFE_INTEGER
		
		Private Sub Class_Initialize
			MAX_SAFE_INTEGER = 9007199254740991 '(2^53-1)
			Reset
		End Sub
		
		Public Sub Reset
			m_Current = Empty
			m_Next = Empty
		End Sub
		
		Public Function MoveNext
			If IsEmpty(m_Next) Then
				m_Current = 0
				m_Next = 1
				MoveNext = True ' successfully moved to first item
			ElseIf (MAX_SAFE_INTEGER > m_Next) Then
				Dim T
				T = m_Current
				m_Current = m_Next
				m_Next = T + m_Next
				MoveNext = True ' successfully moved to next item
			Else
				m_Current = Empty
				MoveNext = False ' EOF
			End If
		End Function
		
		Public Default Property Get Current
			Current = m_Current
		End Property
End Class
