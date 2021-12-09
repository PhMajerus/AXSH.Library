/*
** Retrieves your public IP address by querying an online IP echo service.
** 
** The IP address is returned as a string, but can be parsed if needed:
** var myIP = new IPv4Address(getPublicIP());
** ?myIP.getInt32();
** ?myIP.toString();
*/


function getPublicIP () {
	// URLs of services providing echos of your public IP address as plain text.
	var urls = [
		"https://api.ipify.org",
		"https://ipaddress.sh",
		"https://ifconfig.me",
		"https://ifconfig.io",
		"https://ipinfo.io/ip",
		"https://ipecho.net/plain"
	];
	
	// Use Windows HTTP Services 5.1, an OS component of Windows 2000 SP3 and later.
	var whr;
	try {
		whr = new ActiveXObject("WinHttp.WinHttpRequest.5.1");
	} catch(ex) {
		// Since WinHTTP is an OS component, it should never fail, except on non-Windows OS or in safe-for-scripting mode.
		if (ex.number === -2146827859) { // 0x800A01AD "Automation server can't create object"
			ex.description = "Microsoft Windows HTTP Services are not available";
		}
		throw ex;
	}
	
	// Set Direct access (no proxy server) mode, accessing URLs directly even if a WinHTTP proxy has been set.
	// This ensures we get the public IP address for this machine, not the public IP of some proxy server.
	whr.setProxy(1 /*HTTPREQUEST_PROXYSETTING_DIRECT*/);
	// Some services only return the IP as plain-text if curl utility is detected as the client.
	whr.option(0 /*WinHttpRequestOption_UserAgentString*/) = "curl/7.12.0";
	// Set shorter timeouts, as we expect the request to be processed quickly or move on to next URL.
	whr.setTimeouts(0, 2000, 1000, 1000);
	
	for (var i=0; i < urls.length; i++) {
		whr.open("GET", urls[i], false);
		whr.setRequestHeader("Accept", "text/plain, */*;q=0.5");
		try {
			whr.send();
			if (whr.status === 200) {
				// Got the IP, early return.
				return whr.responseText.trim();
			}
		} catch(ex) {
			// failed, just let it proceed to next service.
		}
	}
	
	// None of the services succeeded.
	throw new Error("Retrieving public IP address failed");
}
