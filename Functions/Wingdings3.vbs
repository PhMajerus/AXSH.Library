'
' Wingdings 3 is a dingbat font for Microsoft Office.
' 
' It was an 8-bit character set, before Unicode made it possible to assign
' unique code points to each character, so normal Latin 1 characters used
' in Windows would map to Wingdings 3 symbols when that font was used.
' In 2014, Unicode 7.0 added most of these symbols as their own code points.
' 
' This function uses Unicode to provide a similar conversion, taking
' advantage of Unicode to convert Windows Latin 1 characters to Unicode
' symbols equivalents to the ones they would map to using the Wingdings 3
' font.
'

Option Explicit

Function Wingdings3 (Text)
	Dim Encodings, Wingdings3Alphabet
	Const cpLatin1 = 1252
	Set Encodings = CreateObject("AXSH.Encodings")
	Wingdings3Alphabet = Encodings.BinaryToText(Encodings.Base64ToBinary("AAECAwQFBgcICQoLDA0ODxAREhMUFRYXGBkaGxwdHh8g4q2g4q2i4q2h4q2j4q2m4q2n4q2p4q2o4q2w4q2y4q2x4q2z4q224q244q274q294q2k4q2l4q2q4q2s4q2r4q2t4q2N4q6g4q6h4q6i4q6j4q6k4q6l4q6m4q6n4q6Q4q6R4q6S4q6T4q6A4q6D4q2+4q2/4q6E4q6G4q6F4q6H4q6P4q6N4q6O4q6M4q2u4q2v4o6L4oyk4oyD4oyl4pCj4o294oeq4q648J+ioPCfoqHwn6Ki8J+io/CfoqTwn6Kl8J+ipvCfoqfwn6Ko8J+iqfCfoqrwn6Kr8J+hkPCfoZLwn6GR8J+hk/CfoZTwn6GV8J+hl/CfoZbwn6GY8J+hmeKWsuKWvOKWs+KWveKXgOKWtuKXgeKWt+KXo+KXouKXpOKXpfCfnoDwn56C8J+ege+/vfCfnoPir4Xir4bir4fir4jirpzirp7irp3irp/wn6CQ8J+gkvCfoJHwn6CT8J+glPCfoJbwn6CV8J+gl/CfoJjwn6Ca8J+gmfCfoJvwn6Cc8J+gnvCfoJ3wn6Cf8J+ggPCfoILwn6CB8J+gg/CfoITwn6CG8J+ghfCfoIfwn6CI8J+givCfoInwn6CL8J+goPCfoKLwn6Ck8J+gpvCfoKjwn6Cq8J+grPCfopzwn6Kd8J+invCfop/wn6Cu8J+gsPCfoLLwn6C08J+gtvCfoLjwn6C68J+gufCfoLvwn6KY8J+imvCfopnwn6Kb8J+gvPCfoL7wn6C98J+gv/CfoYDwn6GC8J+hgfCfoYPwn6GE8J+hhvCfoYXwn6GH4q6o4q6p4q6q4q6r4q6s4q6t4q6u4q6v8J+hoPCfoaLwn6Gh8J+ho/CfoaTwn6Gl8J+hp/Cfoabwn6Gw8J+hsvCfobHwn6Gz8J+htPCfobXwn6G38J+htvCfooDwn6KC8J+igfCfooPwn6KE8J+ihfCfoofwn6KG8J+ikPCfopLwn6KR8J+ik/CfopTwn6KW8J+ilfCfopfvv73vv73vv73vv73vv73vv73vv73vv73vv73vv73vv73vv73vv73vv73vv70="))
	Wingdings3 = Encodings.BinaryToBase256(Encodings.TextToBinary(Text, cpLatin1), Wingdings3Alphabet)
End Function
