/*
** Wingdings 2 is a dingbat font for Microsoft Office.
** 
** It was an 8-bit character set, before Unicode made it possible to assign
** unique code points to each character, so normal Latin 1 characters used
** in Windows would map to Wingdings 2 symbols when that font was used.
** In 2014, Unicode 7.0 added most of these symbols as their own code points.
** 
** This function uses Unicode to provide a similar conversion, taking
** advantage of Unicode to convert Windows Latin 1 characters to Unicode
** symbols equivalents to the ones they would map to using the Wingdings 2
** font.
** Characters undefined in Wingdings 2 are mapped to the Unicode replacement
** character (U+FFFD).
*/


function wingdings2 (text) {
	var Encodings = new ActiveXObject("AXSH.Encodings");
	var wingdings2Alphabet = Encodings.BinaryToText(Encodings.Base64ToBinary("AAECAwQFBgcICQoLDA0ODxAREhMUFRYXGBkaGxwdHh8g8J+WivCflovwn5aM8J+WjeKchOKcgPCflb7wn5W98J+XhfCfl4bwn5eH8J+XiPCfl4nwn5eK8J+Xi/Cfl4zwn5eN8J+Ti/Cfl5Hwn5eU8J+WtfCflrbwn5a38J+WuPCflq3wn5av8J+WsfCflpLwn5aT8J+WmPCflpnwn5aa8J+Wm/CfkYjwn5GJ8J+WnPCflp3wn5ae8J+Wn/CflqDwn5ah8J+RhvCfkYfwn5ai8J+Wo/CflpHwn5e08J+XuPCfl7XimJHirr3imJLirr7irr/wn5uH4qa48J+ZsfCfmbTwn5my8J+Zs+KAvfCfmbnwn5m68J+Zu/Cfmabwn5mk8J+ZpfCfmafwn5ma8J+ZmPCfmZnwn5mb4pOq4pGg4pGh4pGi4pGj4pGk4pGl4pGm4pGn4pGo4pGp4pO/4p224p234p244p254p264p274p284p294p2+4p2/77+94piJ8J+MleKYveKYvuK4v+KcnfCflYfwn5Wc8J+VnfCflZ7wn5Wf8J+VoPCflaHwn5Wi8J+Vo/CflaTwn5Wl8J+VpvCflafwn5mo8J+ZqeKLhfCfnoTipoHil4/il4vwn56F8J+eh/Cfnoniipnipr/wn56M8J+ejeKXvuKWoOKWofCfnpHwn56S8J+ek/CfnpTilqPwn56V8J+elvCfnpfwn56Y4qyp4qyl4peH8J+emuKXiPCfnpvwn56c8J+enfCfnp7irKrirKfil4rwn56g4peW4peX4q+K4q+L4q+A4q+B4qyf4q+C4qyj4qyi4q+D4q+E8J+eofCfnqLwn56j8J+epPCfnqXwn56m8J+ep/Cfnqjwn56p8J+eqvCfnqvwn56s8J+erfCfnq7wn56v8J+esPCfnrHwn56y8J+es/CfnrTwn5618J+etvCfnrfwn5648J+eufCfnrrwn5678J+evPCfnr3wn56+8J+ev/Cfn4Dwn5+C8J+fhPCfn4bwn5+J8J+fiuKctvCfn4zwn5+O8J+fkPCfn5LinLnwn5+D8J+fh+Kcr/Cfn43wn5+U4q+M4q+N4oC74oGC77+977+977+977+977+977+9"));
	return Encodings.binaryToBase256(Encodings.textToBinary(text, 1252/*Latin 1*/), wingdings2Alphabet);
}
