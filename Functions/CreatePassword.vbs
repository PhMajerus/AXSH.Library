'
' Simple password generator
'
' Note variable-length passwords are more secure than fixed-size ones,
' if you want an average length password, use CreatePassword(Int(Rnd*6)+14)
' and it will give you a password between 14 and 20 characters.
'

Option Explicit

Function CreatePassword(Length)
	Dim Password, I
	' 89 ASCII-compatible characters set containing 10 digits, 26 lowercase, 26 uppercase and 26 symbols.
	' We avoid \ / | ^ ` which can be confusing in passwords.
	Const CharSet = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!""#$%&'()*+,-.:;<=>?@[]_{}~"
	
	' Make sure the pseudorandom number generator has been initialized.
	' Randomize PRNG seed only once, do it if current seed is VB's initial seed.
	If Rnd(0) = 0.01953125 Then Randomize
	' Note a call to Rnd with a negative value can be used to set a fixed seed
	' before this function. Always call Randomize after using Rnd(<0).
	
	Password = ""
	For I = 1 To Length
		Password = Password & Mid(CharSet, Int(Rnd * Len(CharSet))+1, 1)
	Next
	CreatePassword = Password
End Function
