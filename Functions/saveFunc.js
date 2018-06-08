/*
** Save the current definition of a function from your execution environment
** into your personal Functions on-demand folder.
** The function will be automatically loaded in any future session.
** 
** - Philippe Majerus, June 2018
*/


// Turn on strict mode for this file.
"use strict";

function saveFunc(func) {
	if (typeof func !== "function") {
		var e = new TypeError("func argument must be a function");
		e.description = e.message;
		throw e;
	}
	
	var funcName = /function(\s|\/\*[^\/]*\/)*([^(\s\/]*)/.exec( func+'' )[2];
	if ((funcName === undefined) || (funcName === "")) {
		throw new Error("Function must include its name in its definition to be saved");
	}
	
	var filePath = AXSH.envVars.expand("%UserProfile%\\Documents\\Majerus.net ActiveScript Shell\\Functions\\") + funcName + ".js";
	var fso = new ActiveXObject("Scripting.FileSystemObject");
	var file = fso.createTextFile(filePath, true, false);
	file.write("/*\r\n** Function "+ funcName +", saved using saveFunc,\r\n** on "+ new Date().toLocaleString() +".\r\n*/\r\n\r\n");
	file.write(func+"\r\n");
	file.close();
}
