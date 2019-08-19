/*
** A simple reminder function, using a timer to show a message box at a
** specified time.
*/


// message must be a string to display, time can be a Date or an interval in milliseconds.
function remindMe(message, time) {
	var ms;
	if (time.constructor === Date) {
		ms = time.getTime() - new Date().getTime();
	} else {
		ms = Number(time);
		if (isNaN(ms)) {
			var e = new TypeError("time must be a Date or a Number");
			e.description = e.message;
			throw e;
		}
	}
	if (ms <= 0) {
		throw new Error("time must be in the future");
	}
	
	// Make sure the object we need later is available for use,
	// this can fail in safe-for-scripting mode.
	void new ActiveXObject("WScript.Shell");
	
	var tmr = new ActiveXObject("AXSH.Timer");
	tmr.autoReset = false;
	tmr.interval = ms;
	tmr.onTick = function() {
		var ws = new ActiveXObject("WScript.Shell");
		ws.popup(message, 0, "Reminder", 64);
		
		// This function being in a closure creates a circular reference
		// across COM boundary that JScript garbage collector won't be
		// able to cleanup automatically, we must break the circular
		// reference manually, for example by getting rid of the timer
		// object as follows:
		tmr = undefined;
	}
	tmr.enabled = true;
}
