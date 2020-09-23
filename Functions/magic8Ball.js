/*
** Magic 8-Ball function
** 
** A simple Magic 8-Ball response function.
** 
** You can get some suspense using a marquee:
** echo(marquee(magic8Ball(),4,"(",")"));
*/


function magic8Ball() {
	var answers = [
		// Affirmative
		"It is certain.",
		"It is decidedly so.",
		"Without a doubt.",
		"Yes - definitely.",
		"You may rely on it.",
		"As I see it, yes.",
		"Most likely.",
		"Outlook good.",
		"Yes.",
		"Signs point to yes.",
		// Non-committal
		"Reply hazy, try again.",
		"Ask again later.",
		"Better not tell you now.",
		"Cannot predict now.",
		"Concentrate and ask again.",
		// Negative
		"Don't count on it.",
		"My reply is no.",
		"My sources say no.",
		"Outlook not so good.",
		"Very doubtful."
	];
	
	return answers[Math.floor((Math.random() * 20))];
}
