/*
** Webdings is a dingbat typeface distributed by Microsoft in 1997 with
** Internet Explorer 4.0 Core fonts for the Web.
** 
** It was an 8-bit character set, before Unicode made it possible to assign
** unique code points to each character, so normal Latin 1 characters used
** in Windows would map to Webdings symbols when that font was used.
** In 2014, Unicode 7.0 added these symbols as their own code points.
** 
** This function uses Unicode to provide a similar conversion, taking
** advantage of Unicode to convert Windows Latin 1 characters to Unicode
** symbols equivalents to the ones they would map to using the Webdings
** font.
*/


function webdings (text) {
	var Encodings = new ActiveXObject("AXSH.Encodings");
	var webdingsAlphabet = Encodings.BinaryToText(Encodings.Base64ToBinary("AAECAwQFBgcICQoLDA0ODxAREhMUFRYXGBkaGxwdHh8g8J+Vt/Cflbjwn5Wy8J+VtvCfj4bwn46W8J+Wh/Cfl6jwn5ep8J+XsPCfl7Hwn4y28J+Ol/Cfmb7wn5m88J+XlfCfl5bwn5eX4o+04o+14o+24o+34o+q4o+p4o+u4o+t4o+44o+54o+68J+XmvCfl7Pwn5ug8J+Pl/Cfj5jwn4+Z8J+PmvCfj5zwn4+t8J+Pm/Cfj6Dwn4+W8J+PnfCfm6Pwn5SN8J+PlPCfkYHwn5GC8J+PnvCfj5Xwn5uk8J+Pn/Cfm7Pwn5Ws8J+Vq/Cflajwn5SI8J+OlPCfjpXwn5es8J+ZvfCfl63wn5eq8J+Xq+KulOKclPCfmrLirJzwn5uh8J+TpvCfm7HirJvwn5qR8J+biPCfm6nwn5uw8J+fiPCflbTirKTwn5ul8J+alPCfl5jwn5eZ4p2T8J+bsvCfmofwn5qN4puz4qa44oqW8J+arfCfl67ij5Dwn5ev8J+Xsu+/vfCfmrnwn5q68J+bifCfm4rwn5q88J+RvfCfj4vim7fwn4+C8J+PjPCfj4rwn4+E8J+PjfCfj47wn5qY8J+XoPCfm6Lwn5Kw8J+Pt/CfkrPwn5Gq8J+XofCfl6Lwn5ej4pyv8J+WhPCfloXwn5aD8J+WhvCflrnwn5a68J+Wu/CflbXwn5Ww8J+WvfCflr7wn5OL8J+XkvCfl5Pwn5Wu8J+TmvCfl57wn5ef8J+Xg/Cfl4Lwn5a88J+OrfCfjpzwn46Y8J+OmfCfjqfwn5K/8J+OnvCfk7fwn46f8J+OrPCfk73wn5O58J+TvvCfk7vwn46a8J+Om/Cfk7rwn5K78J+WpfCflqbwn5an8J+VufCfjq7wn5W78J+VvPCfk5/wn5aB8J+WgPCflqjwn5ap8J+Wv/Cflqrwn5ec8J+UkvCflJPwn5ed8J+TpfCfk6Twn5Wz8J+Mo/CfjKTwn4yl8J+MpuKYgfCfjKjwn4yn8J+MqfCfjKrwn4ys8J+Mq/CfjJzwn4yh8J+bi/Cfm4/wn4298J+NuPCfm47wn5uN4pOF4pm/8J+bhvCflojwn46T8J+XpPCfl6Xwn5em8J+Xp/Cfm6rwn5C/8J+QpvCfkJ/wn5CV8J+QiPCfmazwn5mu8J+ZrfCfma/wn5e68J+MjfCfjI/wn4yO8J+Vig=="));
	return Encodings.binaryToBase256(Encodings.textToBinary(text, 1252/*Latin 1*/), webdingsAlphabet);
}
