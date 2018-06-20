'
' The old BASIC command SOUND
' 
' Note the Duration argument expects the duration in ticks.
' BASIC ticks are based on the frequency of the original IBM PC, with an
' Intel 8088 CPU clock at 4.77 MHz, divided by 4 before being fed to the
' Intel 8053 timer chip, which was configured to divide it further by 65536.
' This gave a tick duration of ~55ms, as 1/4.77*4*65536 = 54956.81 (us),
' which is about 18.2 ticks per second as 1000/54.95681 = 18.2
'

Option Explicit

Sub Sound (Frequency, DurationInTicks)
	Dim Console
	Set Console = CreateObject("Majerus.Console")
	Console.Beep Frequency, DurationInTicks * 55
End Sub
