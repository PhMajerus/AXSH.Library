/*
** Plays a single audio file
** 
** Uses Windows Media Player as an in-process automation object to play
** audio in the background, without any user interface.
** 
** File plays in the background until finished, or until function is called
** again.
** Calling the function without argument or with undefined or null as
** argument interrupts the current playback and frees resources used by WMP.
** Calling the function again before the file is finished playing interrupts
** the current playback immediately and starts playing the new one.
*/

var playAudio = (function(){
	// We need the WMP object to survive to play audio in the background,
	// so we keep it in a closure.
	var wmp = undefined;
	
	return function /*playAudio*/ (url) {
		if ((url === undefined) || (url === null)) {
			wmp = undefined;
		} else {
			if (wmp === undefined) {
				wmp = new ActiveXObject("WMPlayer.OCX.7");
				wmp.settings.autoStart = true;
			}
			wmp.URL = url;
		}
	};
})();
