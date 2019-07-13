/*
** Uses Windows Notepad to easily edit functions.
** Calling editFunc with a function name as the func argument, without () after the function name,
** will open the source code for the requested function in Notepad.
** When Notepad is closed, saving the changes, the new implementation replaces the previous one
** in your current execution environment.
** 
** - Philippe Majerus, June 2018
*/

// Turn on strict mode for this file.
"use strict";

function editFunc(func) {
	if (typeof func !== "function") {
		var e = new TypeError("func argument must be a function");
		e.description = e.message;
		throw e;
	}
	
	var fso = new ActiveXObject("Scripting.FileSystemObject");
	var fsoc = getConsts(fso);
	var tmpFilePath = fso.buildPath(fso.getSpecialFolder(fsoc.TemporaryFolder), fso.getTempName());
	var editor = fso.buildPath(fso.getSpecialFolder(fsoc.SystemFolder), "notepad.exe");
	// Save function to file
	var file = fso.createTextFile(tmpFilePath, false, true);
	file.write(func+'');
	file.close();
	// Edit file
	AXSH.exec(CmdLine.encode([editor, tmpFilePath]));
	// Load function from file
	file = fso.openTextFile(tmpFilePath, fsoc.forReading, false, fsoc.tristateTrue /* Open the file as Unicode */);
	var contents = file.readAll();
	file.close();
	// Cleanup
	fso.deleteFile(tmpFilePath);
	// Parse new function
	AXSH.addModuleFromString(contents);
}
