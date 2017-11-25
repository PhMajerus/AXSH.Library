/*
** Uses Windows Notepad to easily edit functions.
** Calling editFunc with a function name as the func argument, without () after the function name,
** will open the source code for the requested function in Notepad.
** When Notepad is closed, saving the changes, the new implementation replaces the previous one
** in your current execution environment.
**
** - Philippe Majerus, 21 September, 2017
*/

// Turn on strict mode for this file.
"use strict";

function editFunc(func)
{
	var fso = new ActiveXObject("Scripting.FileSystemObject");
	var fsoc = getConsts(fso);
	var tmpFile = fso.buildPath(fso.getSpecialFolder(fsoc.TemporaryFolder), fso.getTempName());
	var editor = fso.buildPath(fso.getSpecialFolder(fsoc.SystemFolder), "notepad.exe");
	save(tmpFile, func, true);
	exec(CmdLine.encode([editor, tmpFile]));
	evalModule(load(tmpFile));
	delete(tmpFile);
}
