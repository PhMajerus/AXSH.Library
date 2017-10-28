// Show the Periodic Table of Elements.

// Turn on strict mode for this file.
"use strict";

function PToE()
{
	var ansi = new ActiveXObject("Majerus.ANSI");
	AXSH.echo(ansi.loadAnsi(EnvVars.expand("%UserProfile%\\Documents\\Majerus.net ActiveScript Shell\\Resources\\PToE.ans")));
}
