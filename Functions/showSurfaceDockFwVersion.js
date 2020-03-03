/*
** Show Microsoft Surface Dock firmware
** 
** This shows the version of the installed Surface Dock Firmware Update
** software, and firmwares installed on the currently connected or last
** connected Surface Dock.
** 
** Note MCU and DP firwmare versions do not match the global Dock firmware
** version, the Surface Dock Firmware 1.42.139.0 update 19.084.31680
** installs versions MCU 78395760 and DP 77714800.
** See https://docs.microsoft.com/surface/surface-dock-firmware-update
** for latest update information.
** 
** - Philippe Majerus, February 2020
*/


function showSurfaceDockFwVersion () {
	AXSH.echo("\x1B[4mSurface Dock firmware version\x1B[24m");
	
	// Get update driver
	var wmi = GetObject("winmgmts:\\\\.\\root\\CIMV2");
	var wbemDT = new ActiveXObject("WbemScripting.SWbemDateTime");
	var drivers = new Enumerator(wmi.execQuery("SELECT Description, DriverVersion, DriverDate FROM Win32_PnPSignedDriver WHERE HardWareID=\"{5E9A8CDC-14AB-4609-A017-68BCE594AB68}\\\\SurfaceDockFwUpdate\""));
	if (drivers.atEnd()) {
		throw new Error("Surface Dock Firmware Update software not found. Make sure Microsoft Surface Dock Firmware Update 1.42.139 or later is installed.");
	}
	var driver = drivers.item(); // Get first result
	wbemDT.value = driver.driverDate.replace(".******+***",".000000+000"); // Surface Dock Update driver typically does not return microseconds and timezone, replace by .0 and UTC+0.
	AXSH.echo(driver.description +" software: "+ driver.driverVersion +" ("+ AXSH.format(wbemDT.getVarDate(false)) +")");
	
	// Get firmwares versions
	var wshShell = new ActiveXObject("WScript.Shell");
	var keyPath = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\WUDF\\Services\\SurfaceDockFwUpdate\\Parameters\\";
	var currentFwVerMCU = wshShell.regRead(keyPath+"Component10CurrentFwVersion");
	var currentFwVerDP = wshShell.regRead(keyPath+"Component20CurrentFwVersion");
	var availableFwVerMCU = wshShell.regRead(keyPath+"Component10OfferFwVersion");
	var availableFwVerDP = wshShell.regRead(keyPath+"Component20OfferFwVersion");
	AXSH.echo("Micro controller unit (MCU) firmware: "+ currentFwVerMCU +" (0x"+ ("00000000"+currentFwVerMCU.toString(16)).slice(-8) +"), "+ (currentFwVerMCU==availableFwVerMCU ? "up to date" : availableFwVerMCU+" is available"));
	AXSH.echo("Display port (DP) firmware: "+ currentFwVerDP +" (0x"+ ("00000000"+currentFwVerDP.toString(16)).slice(-8) +"), "+ (currentFwVerDP==availableFwVerDP ? "up to date" : availableFwVerDP+" is available"));
}
