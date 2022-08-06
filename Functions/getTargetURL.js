/*
** Get the final target URL of a document or resource.
** 
** URL shortener services, and more generally, resources redirections,
** means a known URL might not be the actual URL of the resource it refers
** to. It may even be on a different server altogether. This can make it
** difficult to know at first glance where the document actually resides,
** and can induce the user in error when used maliciously to hide the final
** destination.
** 
** This function follows the redirections until it gets the actual document
** and return the final URL.
** It returns the url as it if is hasn't been redirected.
** 
** Note this only handles HTTP redirection, it does not process HTML <meta>
** or JavaScript-based redirections.
*/


function getTargetURL (url) {
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
	
	// Follow redirections until we get the actual document (status 200)
	do {
		// To receive redirections, we must disable their automatic processing by WinHttpRequest.
		whr.option(6/*WinHttpRequestOption_EnableRedirects*/) = false;
		
		// Prepare a synchronous HTTP HEAD request (using HEAD instead of GET to reduce data transfer)
		whr.open("HEAD", url, false);
		whr.setRequestHeader("User-Agent", "ActiveScript Shell getTargetURL.js");
		whr.setRequestHeader("Accept-Charset", "utf-8, iso-8859-1;q=0.5");
		// If redirection depends on client language, prefer US English
		//whr.setRequestHeader("Accept-Language", "en-US,en;q=0.5");
		
		// Perform request
		whr.send();
		if (whr.status === 405) {
			// Method not allowed - some HTTP servers refuse the HEAD request
			// Simply perform a full GET request, not as efficient, but should
			// always work.
			whr.open("GET", url, false);
			whr.setRequestHeader("User-Agent", "ActiveScript Shell getTargetURL.js");
			whr.setRequestHeader("Accept-Charset", "utf-8, iso-8859-1;q=0.5");
			// If redirection depends on client language, prefer US English
			//whr.setRequestHeader("Accept-Language", "en-US,en;q=0.5");
			whr.send();
		}
		
		switch(whr.status) {
			case 200: // OK
				// Found the document, don't do anything, we'll get out of the loop
				break;
			
			case 301: // Moved Permanently
			case 302: // Found
			case 303: // See Other (should only be used for PUT and POST)
			case 307: // Temporary Redirect
			case 308: // Permanent Redirect
				// Redirected
				try {
					// Update url according to redirection
					url = whr.getResponseHeader("Location");
				} catch(ex) {
					if (ex.number === -2147012746) { // The requested header was not found
						throw new Error("Request to '"+url+"' got redirected, but target location is missing.");
					} else {
						throw ex;
					}
				}
				break;
			
			default:
				// Other responses are handled as errors
				throw new Error("HTTP error "+whr.status.toString()+" "+whr.statusText);
		}
	} while (whr.status != 200);
	
	return url;
}
