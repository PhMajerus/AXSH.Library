/*
** List Hyper-V virtual machines
** 
** - Philippe Majerus, September 2017
*/

// Turn on strict mode for this file.
"use strict";

function showVMs()
{
	var EnabledStates = {
		0:"Unknown",
		2:"Running",
		3:"Turned Off",
		32768:"Paused",
		32769:"Suspended",
		32770:"Starting",
		32771:"Snapshotting",
		32773:"Saving",
		32774:"Stopping",
		32776:"Pausing",
		32777:"Resuming"
		};
	var MsvmWMI = GetObject("winmgmts:{impersonationLevel=impersonate}!\\\\.\\root\\virtualization\\v2");
	new Enumerator(MsvmWMI.ExecQuery("SELECT * FROM Msvm_ComputerSystem WHERE Caption!=\"Hosting Computer System\"")).forEach(function(item){
		echo(" \x1B[1m" + item.ElementName + "\x1B[m \t" + EnabledStates[item.EnabledState] + " - " + new VBArray(item.StatusDescriptions).toArray().join("; "));
	});
}