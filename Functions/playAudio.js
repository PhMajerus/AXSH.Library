/*
** Asynchronously plays a single audio file.
** 
** Uses Windows Media Player as an in-process automation object to play
** audio in the background, without any user interface.
** 
** File plays in the background until finished, or until function is called
** again.
** Calling the function without argument or with null interrupts the current
** playback and frees resources used by WMP.
** Calling the function again before the file is finished playing interrupts
** the current playback immediately and starts playing the new one.
** 
** The function returns a Promise that resolves returning true if file
** finished playing to the end, false if file got interrupted, and undefined
** if no argument or null was provided to interrupt the currently playing
** file.
** 
** The Windows Media Player component is automatically released when file is
** finished playing or when playback is interrupted.
*/


var playAudio = (function(){
	// The WMP object is a singleton, as a call to playAudio
	// interrupts the current playback if any.
	// Therefore it is kept in a closure for the playAudio function.
	var wmp = undefined;
	
	return function /*playAudio*/ (url) {
		if ((arguments.length < 1) || (url === null)) {
			if (wmp !== undefined) {
				wmp.close();
				wmp = undefined;
			}
			
			// Return resolved promise, notifying interruption.
			return Promise.resolve(undefined);
		} else {
			var playStateChangeHandler;
			var promise = new Promise(function(resolve,reject){
				playStateChangeHandler = function (newPlayState) {
					if (newPlayState === 8 /*MediaEnded*/) {
						// This is the final state when playback finished track.
						AXSH.detachEvent(wmp, "PlayStateChange", playStateChangeHandler);
						// Remove reference to WMPlayer object, which gets it destroyed.
						wmp = undefined;
						// Resolve promise, notifying the file has finished.
						resolve(true);
					} else if (newPlayState === 10 /*Ready*/) {
						// This is the final state when playback is interrupted.
						AXSH.detachEvent(wmp, "PlayStateChange", playStateChangeHandler);
						// Resolve promise, notifying the file has been interrupted
						resolve(false);
					}
				};
			});
			
			if (wmp === undefined) {
				wmp = new ActiveXObject("WMPlayer.OCX.7");
				wmp.settings.autoStart = true;
			}
			
			wmp.URL = url;
			AXSH.attachEvent(wmp, "PlayStateChange", playStateChangeHandler);
			
			return promise;
		}
	};
})();
