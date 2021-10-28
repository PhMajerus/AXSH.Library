'
' Wingdings is the original dingbat font for Windows 3.1 and later.
' 
' It was an 8-bit character set, before Unicode made it possible to assign
' unique code points to each character, so normal Latin 1 characters used
' in Windows would map to Wingdings symbols when that font was used.
' In 2014, Unicode 7.0 added most of these symbols as their own code points.
' 
' This function uses Unicode to provide a similar conversion, taking
' advantage of Unicode to convert Windows Latin 1 characters to Unicode
' symbols equivalents to the ones they would map to using the Wingdings
' font.
'

Option Explicit

Function Wingdings (Text)
	Dim Encodings, WingdingsAlphabet
	Const cpLatin1 = 1252
	Set Encodings = CreateObject("AXSH.Encodings")
	WingdingsAlphabet = Encodings.BinaryToText(Encodings.Base64ToBinary("AAECAwQFBgcICQoLDA0ODxAREhMUFRYXGBkaGxwdHh8g8J+WieKcguKcgfCfkZPwn5Wt8J+VrvCfla/wn5W/4pyG8J+WgvCfloPwn5Oq8J+Tq/Cfk6zwn5Ot8J+XgPCfl4Hwn5eO8J+Xj/Cfl5Dwn5eE4oyb8J+WrvCflrDwn5ay8J+Ws/CflrTwn5ar8J+WrOKch+KcjfCflo7inIzwn5aP8J+RjfCfkY7imJzimJ7imJ3imJ/wn5aQ4pi68J+YkOKYufCfkqPwn5Wx8J+Ps/Cfj7HinIjimLzwn4yi4p2E8J+VhuKcnvCflYjinKDinKHimKrimK/wn5WJ4pi44pmI4pmJ4pmK4pmL4pmM4pmN4pmO4pmP4pmQ4pmR4pmS4pmT8J+ZsPCfmbXimqvwn5S+4pe88J+ej/CfnpDinZHinZLwn56f4qer4peG4p2W4qyp4oyn4q654oyY8J+PtfCfj7bwn5m28J+Zt+KWr/CfhIvinoDinoHinoLinoPinoTinoXinobinofinojinonwn4SM4p6K4p6L4p6M4p6N4p6O4p6P4p6Q4p6R4p6S4p6T8J+ZovCfmaDwn5mh8J+Zo/CfmZ7wn5mc8J+ZnfCfmZ/iiJnigKLirJ3irZjwn56G8J+eiPCfnorwn56L8J+Uv+KWqvCfno7wn5+B8J+fheKYhfCfn4vwn5+P8J+fk/Cfn5Hir5DijJbir47ir4/ir5HinKrinLDwn5WQ8J+VkfCflZLwn5WT8J+VlPCflZXwn5WW8J+Vl/CflZjwn5WZ8J+VmvCflZvirrDirrHirrLirrPirrTirrXirrbirrfwn5mq8J+Zq/CfmZXwn5mU8J+Zl/CfmZbwn5mQ8J+ZkfCfmZLwn5mT4oyr4oym4q6Y4q6a4q6Z4q6b4q6I4q6K4q6J4q6L8J+hqPCfoarwn6Gp8J+hq/Cfoazwn6Gt8J+hr/Cfoa7wn6G48J+huvCfobnwn6G78J+hvPCfob3wn6G/8J+hvuKHpuKHqOKHp+KHqeKshOKHs+KsgeKsgOKsg+KsgvCfoqzwn6Kt8J+XtuKck/Cfl7fwn5e57oCA"))
	Wingdings = Encodings.BinaryToBase256(Encodings.TextToBinary(Text, cpLatin1), WingdingsAlphabet)
End Function
