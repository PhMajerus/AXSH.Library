/*
** Retrieves your public IPv4 address by querying an online IP echo service.
** 
** When a computer is behind a network address translation (NAT) router, its
** publicly-exposed IP address is not one of its local interfaces private IP
** addresses. Instead, the router performs a translation using one of its IPs.
** This makes it impossible for the computer to find out the IP it is exposed
** as on the Internet.
** This function queries a service on the Internet that echoes the IP our
** request is coming from, and find out the IP address our router is using as
** the translated address.
** 
** The IP address is returned as a string, but can be parsed if needed:
** var myIP = new IPv4Address(getPublicIP());
** ?myIP.getInt32();
** ?myIP.toString();
*/


function getPublicIP () {
	// URLs of services providing echos of your public IP address as plain text.
	// Out of respect for those services, we use these as sequential failovers, not to race them in parallel.
	var urls = [
		"https://api.ipify.org",
		"https://ipaddress.sh",
		"https://ifconfig.me",
		"https://ifconfig.io",
		"https://ipinfo.io/ip",
		"https://ipecho.net/plain"
	];
	
	// Expected response body containing IPv4 address, trimming any leading or trailing whitespaces.
	var reIPv4 = /^[\s\uFEFF\xA0]*((?:25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])\.(?:25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])\.(?:25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])\.(?:25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9]))[\s\uFEFF\xA0]*$/;
	
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
	
	var l = urls.length;
	// Start with a random service from the list.
	var r = Math.floor(Math.random()*urls.length);
	for (var i=0; i < l; i++) {
		whr.open("GET", urls[(i+r)%l], false);
		whr.setRequestHeader("Accept", "text/plain, */*;q=0.5");
		try {
			whr.send();
			if (whr.status === 200) {
				// Validate and trim response.
				var matches = reIPv4.exec(whr.responseText);
				if (matches !== null) {
					// Got the IP, early return.
					return matches[1];
				}
			}
		} catch(ex) {
			// failed, just let it proceed to next service.
		}
	}
	
	// None of the services succeeded.
	throw new Error("Retrieving public IP address failed");
}
