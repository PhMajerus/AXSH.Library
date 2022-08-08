/*
** Retrieve the current date and time from HTTP response headers for a URL.
** 
** Example usage:
** showDateTime(getWebServerDate("www.example.com"));
** // Checking if Web server and local time are out of sync by over 2 seconds.
** ?(Math.abs(new Date()-getWebServerDate("www.example.com")) > (2*1000))
** 
** This file also contains an async version that returns a promise:
** getWebServerDate.async("www.example.com").then(function(dt){ showDateTime(dt); });
** Note the async version does not allow urls with cross-domain redirects,
** always use the final target url when using this version.
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

// Also provide an async version
getWebServerDate.async = function (url) {
	if (url.indexOf("://")==-1)
		url = "http://" + url;
	
	// Use an XMLHttpRequest instead of a WinHttpRequest because WinHttpRequest events
	// cannot be handled from scripts, and we need to handle the response asynchronously.
	// 
	// ServerXMLHTTP would be closer to WinHttpRequest than the client XMLHTTP version,
	// but unfortunately it seems ServerXMLHTTP does not fire onreadystatechange or throw
	// any error if the url cannot be resolved. We cannot have a promise that never settles.
	// As a side effect of using the client library, the hostname handling is more strict,
	// urls that require cross-domain redirects will fail. Always use the final target url.
	var xhr;
	try {
		xhr = new ActiveXObject("MSXML2.XMLHTTP.6.0");
	} catch(ex) {
		if (ex.number === -2146827859) // 0x800A01AD "Automation server can't create object"
			ex.description = "Microsoft Core XML Services (MSXML) 6.0 are not available";
		throw ex;
	}
	
	return new Promise(function(resolve, reject){
		// Prepare an asynchronous HTTP HEAD request (using HEAD instead of GET to reduce data transfer)
		try {
			xhr.open("HEAD", url, true);
		} catch(ex) {
			if (ex.number === -2147012890) { // The URL does not use a recognized protocol
				// When in async mode, this error does not get a description, so provide one.
				reject(new Error("The URL does not use a recognized protocol"));
			} else {
				reject(ex);
			}
		}
		xhr.setRequestHeader("User-Agent", "ActiveScript Shell getWebServerDate.js");
		xhr.setRequestHeader("Accept-Charset", "utf-8, iso-8859-1;q=0.5");
		
		// Prepare handler
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 /*COMPLETED*/) {
				switch (xhr.status) {
					case 405:
						// Method not allowed - some HTTP servers refuse the HEAD request
						// Simply perform a full GET request, not as efficient, but should
						// always work.
						// We don't need all the error handling again here as the URL has already been
						// used successfully.
						xhr.open("GET", url, true);
						xhr.setRequestHeader("User-Agent", "ActiveScript Shell getWebServerDate.js");
						xhr.setRequestHeader("Accept-Charset", "utf-8, iso-8859-1;q=0.5");
						xhr.send();
						// This handler will get called again as we reused the XHR object
						// and left the onreadystatechange function as it.
						break;
						
					case 200:
						// Process header
						var date;
						try {
							date = xhr.getResponseHeader("Date");
						} catch(ex) {
							if (ex.number === -2147012746) { // The requested header was not found
								reject(new Error("The web server did not provide its current time"));
							} else {
								reject(ex);
							}
						}
						resolve(new Date(Date.parse(date)));
						break;
						
					case 12007:
						// When in async mode, this error does not get a description in the default
						// handler, so we process it manually.
						reject(new Error("The server name or address could not be resolved"));
						break;
						
					default:
						reject(new Error(xhr.status.toString()+" "+xhr.statusText));
				}
				
				// Remove reference from closure to avoid circular reference across COM boundary
				xhr = undefined;
			}
		};
		
		// Perform request
		try {
			xhr.send();
		} catch(ex) {
			// We can fail here if the URL syntax ends up being invalid.
			if (ex.number === -2147221020) { // Invalid syntax
				reject(new Error("The URL syntax is invalid"));
			} else {
				reject(ex);
			}
		}
	});
};
