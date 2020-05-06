/*
** Simple password generator
** 
** Variable-length passwords are more secure than fixed-size ones. If you
** call createPassword without a specified length, it will randomly choose
** a length between 14 and 20 characters.
*/

// Turn on strict mode for this file.
"use strict";

function createPassword(length) {
	if (length === undefined)
		length = Math.floor(Math.random() * 6) + 14; // random length 14 to 20
	
	// 89 ASCII-compatible characters set containing 10 digits, 26 lowercase, 26 uppercase and 26 symbols.
	// We avoid \ / | ^ ` which can be confusing in passwords.
	var charset = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!\"#$%&'()*+,-.:;<=>?@[]_{}~";
	
	var password = "";
	for (var i = 0; i < length; i++) {
		password += charset.charAt(Math.floor(Math.random() * charset.length));
	}
	return password;
}
