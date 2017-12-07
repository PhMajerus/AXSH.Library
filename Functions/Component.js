/*
** Helper function to create unregistered Windows Script Components.
** 
** Any .wsc component placed in
** "%UserProfile%\Documents\Majerus.net ActiveScript Shell\Components\".
** can be instantiated without it being registered in the COM repository
** on the local system.
** 
** Note the sFileName is the file name of the component file without its
** ".wsc" extension, it does not necessarily match the ProgID (class name)
** of the component.
*/


function Component(sFileName) {
	if (this.constructor !== Component)
		throw Error("Component is a constructor, it must be called with the \"new\" operator");
	
	// Use the Windows Script Component moniker to instantiate component from file path.
	return GetObject("script:" + AXSH.EnvVars.Expand("%UserProfile%\\Documents\\Majerus.net ActiveScript Shell\\Components\\") + sFileName + ".wsc");
}
