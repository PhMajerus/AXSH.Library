'
' A simple reminder function, using a timer to show a message box at a
' specified time.
' 
' Unfortunately, VBScript needs the timer and the procedure to be stored
' in the global scope to be kept when the procedure is over, leaving them
' in your session indefinitely. The Timer object itself is cleaned up after
' the reminder is displayed.
' 
' Sample usage:
' RemindMe "Five minutes went by", DateAdd("n", 5, Now)
' RemindMe "Five minutes went by", 5*60*1000
'

Option Explicit

Dim RemindMe_Index
RemindMe_Index = 0

Sub RemindMe (Message, DateTimeOrInterval)
	Dim MS, TimerName, HandlerName, Tmr
	If IsDate(DateTimeOrInterval) Then
		MS = CLng((CDbl(DateTimeOrInterval) - CDbl(Now)) * 24*60*60*1000)
	ElseIf IsNumeric(DateTimeOrInterval) Then
		MS = DateTimeOrInterval
	Else
		Err.Raise 5, , "DateTimeOrInterval argument must be a date or number"
	End If
	If MS <= 0 Then
		Err.Raise 5, , "DateTimeOrInterval argument must be in the future"
	End If
	
	' Prepare global identifiers
	RemindMe_Index = RemindMe_Index + 1
	HandlerName = "RemindMe_Handler" & CStr(RemindMe_Index)
	TimerName = "RemindMe_Timer" & CStr(RemindMe_Index)
	
	' Create timer object in global scope, and get a local reference to it
	ExecuteGlobal "Dim " & TimerName & vbNewLine & _
		"Set " & TimerName & " = CreateObject(""AXSH.Timer"")"
	Set Tmr = Eval(TimerName)
	
	' Build handler procedure
	ExecuteGlobal "Sub " & HandlerName & vbNewLine & _
		"CreateObject(""WScript.Shell"").Popup " & StringToLiteral(Message) & ", 0, ""Reminder"", 64" & vbNewLine & _
		"Set " & TimerName & " = Nothing" & vbNewLine & _
		"End Sub"
	
	' Configure and start timer
	With Tmr
		.AutoReset = False
		.Interval = MS
		.OnTick = GetRef(HandlerName)
		.Enabled = True
	End With
End Sub
