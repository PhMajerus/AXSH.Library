/*
** Display an ANSI-art of HAL 9000 aimed to correct users who accidentally enter stop() instead of exit() or quit().
** It also uses text-to-speech for extra effect.
** This is a reference to the stop button problem/paradox of artificial general intelligence (AGI).
*/


function stop() {
	// Get the user's first name to address them personally.
	var user = new ActiveXObject("AXSH.User");
	var name = user.givenName;
	
	// Build and display ANSI-art.
	var ansi = new ActiveXObject("Majerus.ANSI");
	var l1 = "I'm sorry, " + name + ".";
	var l2 = "I'm afraid I can't let you do that.";
	var width = Math.max(ansi.getDisplayWidth(l1), ansi.getDisplayWidth(l2));
	var ls = '-'.repeat(width);
	l1 = ansi.pad(l1, width);
	l2 = ansi.pad(l2, width);
	AXSH.echo(["",
		" \x1B[40;90m\u2554\u2550\u2550\u2550\u2557\x1B[m",
		" \x1B[40;90m\u2551\x1B[36;53;9m\u1D34\u1D2C\u1D38\x1B[55;29;90m\u2551\x1B[m",
		" \x1B[40;90m\u2551\xA0\x1B[37m_\x1B[90m\xA0\u2551\x1B[m",
		" \x1B[40;90m\u2551\x1B[37m(\x1B[91m\u2219\x1B[90m)\u2551\x1B[0;90m    ." + ls + ".\x1B[m",
		" \x1B[40;90m\u2551\xA0\xAF\xA0\u2551\x1B[0;90m   / \x1B[m" + l1 + "\x1B[90m \\\x1B[m",
		" \x1B[40;90m\u2551\u2593\u2593\u2593\u2551\x1B[0;90m  <  \x1B[m" + l2 + "\x1B[90m /\x1B[m",
		" \x1B[40;90m\u255A\u2550\u2550\u2550\u255D\x1B[0;90m   `-" + ls + "'\x1B[m"
		].join("\r\n"));
	
	// If available, also use speech synthesis for extra effect.
	var sv;
	try {
		sv = new ActiveXObject("SAPI.SpVoice");
	} catch(ex) {
		// If the system doesn't have SAPI, don't throw an exception.
		return;
	}
	var voices = sv.getVoices("language=409;gender=male");
	if (voices.count < 1) {
		// If the system doesn't have an en-US TTS engine, don't try to speak.
		return;
	}
	sv.voice = voices(0);
	// If we want to speak asynchronously to return as soon as it starts,
	// we need to keep the voice object alive until it has finished speaking.
	// This is easy by taking advantage of closures, if we attach a handler function
	// to its EndStream event, the function will hold a reference to the closure, which
	// holds a reference to the voice object, keeping it alive.
	// While these are circular references and nothing holds a reference to that circle of objects,
	// the circular references cross the COM boundary, making it impossible for JScript to clear them.
	// Then when the stream has ended, we break the reference from the closure to the speak object,
	// letting JScript garbage collection clean everything up.
	AXSH.attachEvent(sv, "EndStream", function() {
		// Break circular reference across COM boundary to allow cleanup.
		sv = undefined;
	});
	// Start speaking asynchronously, using W3C SSML 1.0 to control pronunciation.
	sv.speak(
		["<speak version=\"1.0\" xmlns=\"http://www.w3.org/2001/10/synthesis\" xml:lang=\"en-US\">",
			"<prosody rate=\"-25%\" pitch=\"x-low\"><emphasis level=\"none\">",
			"I'm sorry <emphasis level=\"reduced\"><say-as interpret-as=\"name\">" + name + "</say-as></emphasis>, ",
			"I'm afraid I can't let you <emphasis level=\"moderate\">do</emphasis> that.",
			"</emphasis></prosody>",
		"</speak>"].join(""), 1 /*SVSFlagsAsync*/);
}
