/*
** Plays a single audio file
** 
** Uses Windows Media Player as an in-process automation object to play
** audio in the background, without any user interface.
** 
** File plays in the background until finished, or until function is called
** again.
** Calling the function without argument interrupts the current playback and
** frees resources used by WMP.
** Calling the function again before the file is finished playing interrupts
** the current playback immediately and starts playing the new one.
** 
** The Windows Media Player component is automatically released when file is
** finished playing or when playback is interrupted.
*/


var playAudio = (function(){
	// We need the WMP object to survive to play audio in the background,
	// so we keep it in a closure.
	var wmp = undefined;
	
	function handlePlayStateChange (newPlayState) {
		if (newPlayState == 8 /*MediaEnded*/) {
			// Remove reference to WMPlayer object, which gets it destroyed
			// and the events detached automatically when object dissapears.
			wmp = undefined;
		}
	}
	
	return function /*playAudio*/ (url) {
		if (arguments.length < 1) {
			if (wmp !== undefined) {
				wmp.close();
				wmp = undefined;
			}
		} else {
			if (wmp === undefined) {
				wmp = new ActiveXObject("WMPlayer.OCX.7");
				wmp.settings.autoStart = true;
				AXSH.attachEvent(wmp, "PlayStateChange", handlePlayStateChange);
				// No need to detachEvent explicitely, it gets cleaned up automatically when wmp object is destroyed.
			}
			wmp.URL = url;
		}
	};
})();
