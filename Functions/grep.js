/*
** Sample usage :
** // Find IPv4 addresses in ipconfig output
** echo(grep(execCmd("ipconfig"), /\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b/));
*/


// Return a string containing only lines that match a regular expression.
function grep (text, regexp) {
	return (text + '')
		.split("\r\n")
		.filter(function (item) {
			// Check if line matches regular expression
			return item.match(regexp);
		})
		.map(function (line) {
			// Highlight result in line
			return line.replace(regexp, function (match) {
				return "\x1B[31;1m" + match +"\x1B[m";
			});
		})
		.join("\r\n");
};

// Alternative using JavaScript regexp in multilines mode:
// ?cmd.ipconfig().match(/^.*ip.*$/igm).join("\r\n");
