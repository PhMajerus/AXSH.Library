/*
** This function lists all available apps with their corresponding "shell:"
** commands.
** These can be used to launch any app from ActiveScript Shell using the Start
** function, or from the Explorer's Run dialog or CMD's Start command.
** 
** When using AXSH.Start from JScript, remember to double all '\' characters.
*/


function listShellApps(nameSpecs) {
	// If nameSpecs is provided and isn't already a RegExp, convert it to a RegExp
	if ((nameSpecs !== undefined) && !(nameSpecs instanceof RegExp)) {
		nameSpecs = wildcardsToRegExp(nameSpecs);
	}
	
	var shellApp = new ActiveXObject("Shell.Application");
	var fldrApps = shellApp.namespace("shell:::{4234d49b-0245-4df3-b780-3893943456e1}"); // AppsFolder
	var apps = fldrApps.items();
	new Enumerator(apps).forEach(function(item){
		if (!nameSpecs || item.name.match(nameSpecs)) {
			AXSH.echo("\x1B[93m"+ item.name +"\x1B[90m  shell:AppsFolder\\"+ item.path);
		}
	});
}
