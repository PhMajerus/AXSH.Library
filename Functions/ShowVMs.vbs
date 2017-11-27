'
' List Hyper-V virtual machines
' 
' - Philippe Majerus, September 2017
'

Option Explicit

Sub ShowVMs
	Dim MsvmWMI, Item, strEnabledState
	Set MsvmWMI = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\virtualization\v2")
	For Each Item In MsvmWMI.ExecQuery("SELECT * FROM Msvm_ComputerSystem WHERE Caption!=""Hosting Computer System""")
		Select Case Item.EnabledState
			Case 0: strEnabledState = "Unknown"
			Case 2: strEnabledState = "Running"
			Case 3: strEnabledState = "Off"
			Case 10: strEnabledState = "Starting"
			Case 32768: strEnabledState = "Paused"
			Case 32769: strEnabledState = "Suspended"
			Case 32770: strEnabledState = "Starting"
			Case 32771: strEnabledState = "Snapshotting"
			Case 32773: strEnabledState = "Saving"
			Case 32774: strEnabledState = "Stopping"
			Case 32776: strEnabledState = "Pausing"
			Case 32777: strEnabledState = "Resuming"
		End Select
		Echo " "&Chr(27)&"[1m"& Item.ElementName &Chr(27)&"[m "&vbTab& strEnabledState &" - "& Join(Item.StatusDescriptions,"; ")
	Next
End Sub
