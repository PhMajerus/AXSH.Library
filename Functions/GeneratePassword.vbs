'
' Simple password generator
'
' Note variable-length passwords are more secure than fixed-size ones,
' if you want an average length password, use GeneratePassword(Int(Rnd*6)+14)
' and it will give you a password between 14 and 20 characters.
'

Option Explicit

Function GeneratePassword(Length)
	Dim Password, I
	' 89 ASCII-compatible characters set containing 10 digits, 26 lowercase, 26 uppercase and 26 symbols.
	' We avoid \ / | ^ ` which can be confusing in passwords.
	Const CharSet = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!""#$%&'()*+,-.:;<=>?@[]_{}~"
	
	Randomize
	Password = ""
	For I = 1 To Length
		Password = Password & Mid(CharSet, Int(Rnd * Len(CharSet))+1, 1)
	Next
	GeneratePassword = Password
End Function
