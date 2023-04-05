'
' Display an ANSI-art aimed to correct users who accidentally enter Sir "*" instead of Dir "*".
' Original soldier ASCII-art by Joan G. Stark (JGS), ANSI-colorized by Philippe Majerus (PHM).
'

Option Explicit

Sub Sir(fileNameSpecs)
	AXSH.Echo Space(9)&Chr(27)&"[32m.---."&Chr(27)&"[m"&vbCrLf&"    "&Chr(27)&"[35m___ "&Chr(27)&"[32m/_____\"&Chr(27)&"[m"&vbCrLf&"   "&Chr(27)&"[32m/\"&Chr(27)&"[35m.-`( "&Chr(27)&"[90m'"&Chr(27)&"[35m."&Chr(27)&"[90m'"&Chr(27)&"[35m )"&Chr(27)&"[m     Sir!"&vbCrLf&"  "&Chr(27)&"[32m/ /    "&Chr(27)&"[35m\_-_/"&Chr(27)&"[33m_"&Chr(27)&"[m     Yes sir!"&vbCrLf&"  "&Chr(27)&"[32m\ `-.-""`'V'"&Chr(27)&"[33m//"&Chr(27)&"[32m-."&Chr(27)&"[m"&vbCrLf&"   "&Chr(27)&"[32m`.__,   |"&Chr(27)&"[33m//"&Chr(27)&"[32m , \"&Chr(27)&"[m"&vbCrLf&Space(7)&Chr(27)&"[32m|Ll "&Chr(27)&"[33m//"&Chr(27)&"[32mLl|\ \"&Chr(27)&"[m"&vbCrLf&Space(7)&Chr(27)&"[32m|"&Chr(27)&"[33m__//"&Chr(27)&"[32m   | \_\"&Chr(27)&"[m"&vbCrLf&Space(6)&Chr(27)&"[33m/---|"&Chr(27)&"[37m[]"&Chr(27)&"[90m=="&Chr(27)&"[32m| / /"&Chr(27)&"[m"&vbCrLf&Space(6)&Chr(27)&"[33m\__/"&Chr(27)&"[32m |   \"&Chr(27)&"[35m/"&Chr(27)&"[32m\/"&Chr(27)&"[m"&vbCrLf&Space(6)&Chr(27)&"[32m/_   | Ll_\"&Chr(27)&"[35m|"&Chr(27)&"[m"&vbCrLf&Space(7)&Chr(27)&"[32m|`^""""""^`|"&Chr(27)&"[m"&vbCrLf&Space(7)&Chr(27)&"[32m|   |   |"&Chr(27)&"[m"&vbCrLf&Space(7)&Chr(27)&"[32m|   |   |"&Chr(27)&"[m"&vbCrLf&Space(7)&Chr(27)&"[32m|   |   |"&Chr(27)&"[m"&vbCrLf&Space(7)&Chr(27)&"[32m|   |   |"&Chr(27)&"[m"&vbCrLf&Space(7)&Chr(27)&"[32mL___l___J"&Chr(27)&"[m"&vbCrLf&"   "&Chr(27)&"[2mjgs"&Chr(27)&"[22m  "&Chr(27)&"[33m|_ | _|"&Chr(27)&"[m"&vbCrLf&Space(7)&Chr(27)&"[33m(___|___)"&Chr(27)&"[m"
End Sub
