/* 
** Retrieve HTTP response headers for a URL and display them as a list.
** 
** - Philippe Majerus, January 2018.
*/ 

function showHttpHeaders(url) {
	if (url.indexOf("://")==-1)
		url = "http://" + url;
	
	// Use Windows HTTP Services 5.1, an OS component of Windows 2000 SP3 and later.
	var whr;
	try {
		whr = new ActiveXObject("WinHttp.WinHttpRequest.5.1");
	} catch(ex) {
		// Since WinHTTP is an OS component, it should never fail, except on non-Windows OS.
		if (ex.number === -2146827859) // 0x800A01AD "Automation server can't create object"
			ex.description = "Microsoft Windows HTTP Services are not available";
		throw ex;
	}
	
	// Prepare a synchronous HTTP GET request
	whr.open("GET", url, false);
	whr.setRequestHeader("User-Agent", "ActiveScript Shell showHttpHeaders.js");
	
	// Perform request
	whr.send();
	if (whr.status != 200) {
		throw new Error(whr.status.toString()+" "+whr.statusText);
	}
	
	// Process headers
	var headers = whr.getAllResponseHeaders().split("\r\n");
	for (var i = 0; i < headers.length; i++) {
		var header = headers[i];
		if (header.length > 0) {
			var iSep = header.indexOf(':');
			var name, value;
			if (iSep != -1) {
				name = header.substr(0,iSep);
				if (header.charAt(iSep+1) === " ")
					iSep++;
				value = header.substr(iSep+1);
			} else {
				name = header;
				value = undefined;
			}
			
			AXSH.echo("\x1B[93m" + name +"\x1B[33m: "+ (value?"\x1B[37m"+value:"\x1B[90mN/A") +"\x1B[m");
		}
	}
}
