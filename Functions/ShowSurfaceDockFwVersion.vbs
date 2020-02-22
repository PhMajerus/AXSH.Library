'
' Show Microsoft Surface Dock firmware
' 
' This shows the version of the installed Surface Dock Firmware Update
' software, and firmwares installed on the currently connected or last
' connected Surface Dock.
' 
' Note MCU and DP firwmare versions do not match the global Dock firmware
' version, the Surface Dock Firmware 1.42.139.0 update 19.084.31680
' installs versions MCU 78395760 and DP 77714800.
' See https://docs.microsoft.com/surface/surface-dock-firmware-update
' for latest update information.
' 
' - Philippe Majerus, February 2020
'

Option Explicit

Sub ShowSurfaceDockFwVersion    
	Dim WMI, WbemDT, Drivers, Driver, WshShell, KeyPath, I
	Dim CurrentFwVerMCU, CurrentFwVerDP, AvailableFwVerMCU, AvailableFwVerDP
	
	AXSH.Echo Chr(27)&"[4mSurface Dock firmware version"&Chr(27)&"[24m"
	
	' Get update driver
	Set WMI = GetObject("winmgmts:\\.\root\CIMV2")
	Set WbemDT = CreateObject("WbemScripting.SWbemDateTime")
	Set Drivers = WMI.ExecQuery("SELECT Description, DriverVersion, DriverDate FROM Win32_PnPSignedDriver WHERE HardWareID=""{5E9A8CDC-14AB-4609-A017-68BCE594AB68}\\SurfaceDockFwUpdate""")
	For Each I In Drivers: Set Driver=I: Exit For: Next ' Get first result
	If IsEmpty(Driver) Then
		Err.Raise 5, , "Surface Dock Firmware Update software not found. Make sure Microsoft Surface Dock Firmware Update 1.42.139 or later is installed."
	End If
	WbemDT.Value = Replace(Driver.DriverDate, ".******+***", ".000000+000") ' Surface Dock Update driver typically does not return microseconds and timezone, replace by .0 and UTC+0.
	AXSH.Echo Driver.Description &" software: "& Driver.DriverVersion &" ("& AXSH.Format(WbemDT.GetVarDate(False)) &")"
	
	' Get firmware versions
	Set WshShell = CreateObject("WScript.Shell")
	KeyPath = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\WUDF\Services\SurfaceDockFwUpdate\Parameters\"
	CurrentFwVerMCU = WshShell.RegRead(KeyPath&"Component10CurrentFwVersion")
	CurrentFwVerDP = WshShell.RegRead(KeyPath&"Component20CurrentFwVersion")
	AvailableFwVerMCU = WshShell.RegRead(KeyPath&"Component10OfferFwVersion")
	AvailableFwVerDP = WshShell.RegRead(KeyPath&"Component20OfferFwVersion")
	AXSH.Echo "Micro controller unit (MCU) firmware: "& CurrentFwVerMCU &" (0x"&LCase(Hex(CurrentFwVerMCU)) &"), "& IIF(CurrentFwVerMCU=AvailableFwVerMCU, "up to date", AvailableFwVerMCU&" is available")
	AXSH.Echo "Display port (DP) firmware: "& CurrentFwVerDP &" (0x"&LCase(Hex(CurrentFwVerDP)) &"), "& IIF(CurrentFwVerDP=AvailableFwVerDP, "up to date", AvailableFwVerDP&" is available")
End Sub
