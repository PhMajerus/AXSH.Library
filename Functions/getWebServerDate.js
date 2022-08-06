/*
** Retrieve the current date and time from HTTP response headers for a URL.
** 
** Example usage:
** showDateTime(getWebServerDate("www.example.com"));
** // Checking if Web server and local time are out of sync by over 2 seconds.
** ?(Math.abs(new Date()-getWebServerDate("www.example.com")) > (2*1000))
*/


function getWebServerDate(url) {
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
	
	// Prepare a synchronous HTTP HEAD request (using HEAD instead of GET to reduce data transfer)
	whr.open("HEAD", url, false);
	whr.setRequestHeader("User-Agent", "ActiveScript Shell getWebServerDate.js");
	whr.setRequestHeader("Accept-Charset", "utf-8, iso-8859-1;q=0.5");
	
	// Perform request
	whr.send();
	if (whr.status === 405) {
		// Method not allowed - some HTTP servers refuse the HEAD request
		// Simply perform a full GET request, not as efficient, but should
		// always work.
		whr.open("GET", url, false);
		whr.setRequestHeader("User-Agent", "ActiveScript Shell getWebServerDate.js");
		whr.setRequestHeader("Accept-Charset", "utf-8, iso-8859-1;q=0.5");
		whr.send();
	}
	if (whr.status !== 200) {
		throw new Error(whr.status.toString()+" "+whr.statusText);
	}
	
	// Process header
	var date;
	try {
		date = whr.getResponseHeader("Date");
	} catch(ex) {
		if (ex.number === -2147012746) { // The requested header was not found
			throw new Error("The web server did not provide its current time");
		}
		throw ex;
	}
	return new Date(Date.parse(date));
}

