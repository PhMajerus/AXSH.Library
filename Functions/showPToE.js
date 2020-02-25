/*
** Show the Periodic Table of Elements.
** 
** Philippe Majerus, October 2017
*/

// Turn on strict mode for this file.
"use strict";

function showPToE() {
	AXSH.echo("    1                                                                    18  \r\n  \u250C\u2500\u2500\u2500\u2510           _                ___                                  \u250C\u2500\u2500\u2500\u2510\r\n 1\u2502\x1B[30;48;5;229m 1 \x1B[m\u2502          |_)_  _\xB7 _  _|\xB7 _  | _ |_ | _                          \u2502\x1B[30;48;5;195m 2 \x1B[m\u2502\r\n  \u2502\x1B[30;48;5;229m H \x1B[m\u2502 2        | (/_| |(_)(_||(_  |(_||_)|(/_      13  14  15  16  17 \u2502\x1B[30;48;5;195m He\x1B[m\u2502\r\n  \u251C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u2510           _  _                          \u250C\u2500\u2500\u2500\u252C\u2500\u2500\u2500\u252C\u2500\u2500\u2500\u252C\u2500\u2500\u2500\u252C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u2524\r\n 2\u2502\x1B[30;48;5;210m 3 \x1B[m\u2502\x1B[30;48;5;223m 4 \x1B[m\u2502        __|_ |_| _  _ _  _  __|_ _       \u2502\x1B[30;48;5;187m 5 \x1B[m\u2502\x1B[30;48;5;158m 6 \x1B[m\u2502\x1B[30;48;5;229m 7 \x1B[m\u2502\x1B[30;48;5;229m 8 \x1B[m\u2502\x1B[30;48;5;229m 9 \x1B[m\u2502\x1B[30;48;5;195m 10\x1B[m\u2502\r\n  \u2502\x1B[30;48;5;210m Li\x1B[m\u2502\x1B[30;48;5;223m Be\x1B[m\u2502       (_)|  |_|(/_| | |(/_| ||__>       \u2502\x1B[30;48;5;187m B \x1B[m\u2502\x1B[30;48;5;158m C \x1B[m\u2502\x1B[30;48;5;229m N \x1B[m\u2502\x1B[30;48;5;229m O \x1B[m\u2502\x1B[30;48;5;229m F \x1B[m\u2502\x1B[30;48;5;195m Ne\x1B[m\u2502\r\n  \u251C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u2524                                         \u251C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u2524\r\n 3\u2502\x1B[30;48;5;210m 11\x1B[m\u2502\x1B[30;48;5;223m 12\x1B[m\u2502                                         \u2502\x1B[30;48;5;145m 13\x1B[m\u2502\x1B[30;48;5;187m 14\x1B[m\u2502\x1B[30;48;5;158m 15\x1B[m\u2502\x1B[30;48;5;158m 16\x1B[m\u2502\x1B[30;48;5;229m 17\x1B[m\u2502\x1B[30;48;5;195m 18\x1B[m\u2502\r\n  \u2502\x1B[30;48;5;210m Na\x1B[m\u2502\x1B[30;48;5;223m Mg\x1B[m\u2502 3     4   5   6   7   8   9  10  11  12 \u2502\x1B[30;48;5;145m Al\x1B[m\u2502\x1B[30;48;5;187m Si\x1B[m\u2502\x1B[30;48;5;158m P \x1B[m\u2502\x1B[30;48;5;158m S \x1B[m\u2502\x1B[30;48;5;229m Cl\x1B[m\u2502\x1B[30;48;5;195m Ar\x1B[m\u2502\r\n  \u251C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u2510 \u250C\u2500\u2500\u2500\u252C\u2500\u2500\u2500\u252C\u2500\u2500\u2500\u252C\u2500\u2500\u2500\u252C\u2500\u2500\u2500\u252C\u2500\u2500\u2500\u252C\u2500\u2500\u2500\u252C\u2500\u2500\u2500\u252C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u2524\r\n 4\u2502\x1B[30;48;5;210m 19\x1B[m\u2502\x1B[30;48;5;223m 20\x1B[m\u2502\x1B[30;48;5;224m 21\x1B[m\u2502 \u2502\x1B[30;48;5;224m 22\x1B[m\u2502\x1B[30;48;5;224m 23\x1B[m\u2502\x1B[30;48;5;224m 24\x1B[m\u2502\x1B[30;48;5;224m 25\x1B[m\u2502\x1B[30;48;5;224m 26\x1B[m\u2502\x1B[30;48;5;224m 27\x1B[m\u2502\x1B[30;48;5;224m 28\x1B[m\u2502\x1B[30;48;5;224m 29\x1B[m\u2502\x1B[30;48;5;145m 30\x1B[m\u2502\x1B[30;48;5;145m 31\x1B[m\u2502\x1B[30;48;5;187m 32\x1B[m\u2502\x1B[30;48;5;187m 33\x1B[m\u2502\x1B[30;48;5;158m 34\x1B[m\u2502\x1B[30;48;5;229m 35\x1B[m\u2502\x1B[30;48;5;195m 36\x1B[m\u2502\r\n  \u2502\x1B[30;48;5;210m K \x1B[m\u2502\x1B[30;48;5;223m Ca\x1B[m\u2502\x1B[30;48;5;224m Sc\x1B[m\u2502 \u2502\x1B[30;48;5;224m Ti\x1B[m\u2502\x1B[30;48;5;224m V \x1B[m\u2502\x1B[30;48;5;224m Cr\x1B[m\u2502\x1B[30;48;5;224m Mn\x1B[m\u2502\x1B[30;48;5;224m Fe\x1B[m\u2502\x1B[30;48;5;224m Co\x1B[m\u2502\x1B[30;48;5;224m Ni\x1B[m\u2502\x1B[30;48;5;224m Cu\x1B[m\u2502\x1B[30;48;5;145m Zn\x1B[m\u2502\x1B[30;48;5;145m Ga\x1B[m\u2502\x1B[30;48;5;187m Ge\x1B[m\u2502\x1B[30;48;5;187m As\x1B[m\u2502\x1B[30;48;5;158m Se\x1B[m\u2502\x1B[30;48;5;229m Br\x1B[m\u2502\x1B[30;48;5;195m Kr\x1B[m\u2502\r\n  \u251C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u2524 \u251C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u2524\r\n 5\u2502\x1B[30;48;5;210m 37\x1B[m\u2502\x1B[30;48;5;223m 38\x1B[m\u2502\x1B[30;48;5;224m 39\x1B[m\u2502 \u2502\x1B[30;48;5;224m 40\x1B[m\u2502\x1B[30;48;5;224m 41\x1B[m\u2502\x1B[30;48;5;224m 42\x1B[m\u2502\x1B[30;48;5;224m 43\x1B[m\u2502\x1B[30;48;5;224m 44\x1B[m\u2502\x1B[30;48;5;224m 45\x1B[m\u2502\x1B[30;48;5;224m 46\x1B[m\u2502\x1B[30;48;5;224m 47\x1B[m\u2502\x1B[30;48;5;145m 48\x1B[m\u2502\x1B[30;48;5;145m 49\x1B[m\u2502\x1B[30;48;5;145m 50\x1B[m\u2502\x1B[30;48;5;187m 51\x1B[m\u2502\x1B[30;48;5;187m 52\x1B[m\u2502\x1B[30;48;5;229m 53\x1B[m\u2502\x1B[30;48;5;195m 54\x1B[m\u2502\r\n  \u2502\x1B[30;48;5;210m Rb\x1B[m\u2502\x1B[30;48;5;223m Sr\x1B[m\u2502\x1B[30;48;5;224m Y \x1B[m\u2502 \u2502\x1B[30;48;5;224m Zr\x1B[m\u2502\x1B[30;48;5;224m Nb\x1B[m\u2502\x1B[30;48;5;224m Mo\x1B[m\u2502\x1B[30;48;5;224m Tc\x1B[m\u2502\x1B[30;48;5;224m Ru\x1B[m\u2502\x1B[30;48;5;224m Rh\x1B[m\u2502\x1B[30;48;5;224m Pd\x1B[m\u2502\x1B[30;48;5;224m Ag\x1B[m\u2502\x1B[30;48;5;145m Cd\x1B[m\u2502\x1B[30;48;5;145m In\x1B[m\u2502\x1B[30;48;5;145m Sn\x1B[m\u2502\x1B[30;48;5;187m Sb\x1B[m\u2502\x1B[30;48;5;187m Te\x1B[m\u2502\x1B[30;48;5;229m I \x1B[m\u2502\x1B[30;48;5;195m Xe\x1B[m\u2502\r\n  \u251C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u2524-\u251C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u2524\r\n 6\u2502\x1B[30;48;5;210m 55\x1B[m\u2502\x1B[30;48;5;223m 56\x1B[m\u2502\x1B[30;48;5;225m 57\x1B[m\u2502*\u2502\x1B[30;48;5;224m 72\x1B[m\u2502\x1B[30;48;5;224m 73\x1B[m\u2502\x1B[30;48;5;224m 74\x1B[m\u2502\x1B[30;48;5;224m 75\x1B[m\u2502\x1B[30;48;5;224m 76\x1B[m\u2502\x1B[30;48;5;224m 77\x1B[m\u2502\x1B[30;48;5;224m 78\x1B[m\u2502\x1B[30;48;5;224m 79\x1B[m\u2502\x1B[30;48;5;145m 80\x1B[m\u2502\x1B[30;48;5;145m 81\x1B[m\u2502\x1B[30;48;5;145m 82\x1B[m\u2502\x1B[30;48;5;145m 83\x1B[m\u2502\x1B[30;48;5;145m 84\x1B[m\u2502\x1B[30;48;5;187m 85\x1B[m\u2502\x1B[30;48;5;195m 86\x1B[m\u2502\r\n  \u2502\x1B[30;48;5;210m Cs\x1B[m\u2502\x1B[30;48;5;223m Ba\x1B[m\u2502\x1B[30;48;5;225m La\x1B[m\u2502 \u2502\x1B[30;48;5;224m Hf\x1B[m\u2502\x1B[30;48;5;224m Ta\x1B[m\u2502\x1B[30;48;5;224m W \x1B[m\u2502\x1B[30;48;5;224m Re\x1B[m\u2502\x1B[30;48;5;224m Os\x1B[m\u2502\x1B[30;48;5;224m Ir\x1B[m\u2502\x1B[30;48;5;224m Pt\x1B[m\u2502\x1B[30;48;5;224m Au\x1B[m\u2502\x1B[30;48;5;145m Hg\x1B[m\u2502\x1B[30;48;5;145m Tl\x1B[m\u2502\x1B[30;48;5;145m Pb\x1B[m\u2502\x1B[30;48;5;145m Bi\x1B[m\u2502\x1B[30;48;5;145m Po\x1B[m\u2502\x1B[30;48;5;187m At\x1B[m\u2502\x1B[30;48;5;195m Rn\x1B[m\u2502\r\n  \u251C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u2524 \u251C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u2524\r\n 7\u2502\x1B[30;48;5;210m 87\x1B[m\u2502\x1B[30;48;5;223m 88\x1B[m\u2502\x1B[30;48;5;218m 89\x1B[m\u2502*\u2502\x1B[30;48;5;224m104\x1B[m\u2502\x1B[30;48;5;224m105\x1B[m\u2502\x1B[30;48;5;224m106\x1B[m\u2502\x1B[30;48;5;224m107\x1B[m\u2502\x1B[30;48;5;224m108\x1B[m\u2502\x1B[30;48;5;231m109\x1B[m\u2502\x1B[30;48;5;231m110\x1B[m\u2502\x1B[30;48;5;231m111\x1B[m\u2502\x1B[30;48;5;145m112\x1B[m\u2502\x1B[30;48;5;231m113\x1B[m\u2502\x1B[30;48;5;231m114\x1B[m\u2502\x1B[30;48;5;231m115\x1B[m\u2502\x1B[30;48;5;231m116\x1B[m\u2502\x1B[30;48;5;231m117\x1B[m\u2502\x1B[30;48;5;231m118\x1B[m\u2502\r\n  \u2502\x1B[30;48;5;210m Fr\x1B[m\u2502\x1B[30;48;5;223m Ra\x1B[m\u2502\x1B[30;48;5;218m Ac\x1B[m\u2502*\u2502\x1B[30;48;5;224m Rf\x1B[m\u2502\x1B[30;48;5;224m Db\x1B[m\u2502\x1B[30;48;5;224m Sg\x1B[m\u2502\x1B[30;48;5;224m Bh\x1B[m\u2502\x1B[30;48;5;224m Hs\x1B[m\u2502\x1B[30;48;5;231m Mt\x1B[m\u2502\x1B[30;48;5;231m Ds\x1B[m\u2502\x1B[30;48;5;231m Rg\x1B[m\u2502\x1B[30;48;5;145m Cn\x1B[m\u2502\x1B[30;48;5;231m Nh\x1B[m\u2502\x1B[30;48;5;231m Fl\x1B[m\u2502\x1B[30;48;5;231m Mc\x1B[m\u2502\x1B[30;48;5;231m Lv\x1B[m\u2502\x1B[30;48;5;231m Ts\x1B[m\u2502\x1B[30;48;5;231m Og\x1B[m\u2502\r\n  \u2514\u2500\u2500\u2500\u2534\u2500\u2500\u2500\u2534\u2500\u2500\u2500\u2518-\u2514\u2500\u2500\u2500\u2534\u2500\u2500\u2500\u2534\u2500\u2500\u2500\u2534\u2500\u2500\u2500\u2534\u2500\u2500\u2500\u2534\u2500\u2500\u2500\u2534\u2500\u2500\u2500\u2534\u2500\u2500\u2500\u2534\u2500\u2500\u2500\u2534\u2500\u2500\u2500\u2534\u2500\u2500\u2500\u2534\u2500\u2500\u2500\u2534\u2500\u2500\u2500\u2534\u2500\u2500\u2500\u2534\u2500\u2500\u2500\u2518\r\n               |\\                                                            \r\n               \u250C\u2500\u2500\u2500\u252C\u2500\u2500\u2500\u252C\u2500\u2500\u2500\u252C\u2500\u2500\u2500\u252C\u2500\u2500\u2500\u252C\u2500\u2500\u2500\u252C\u2500\u2500\u2500\u252C\u2500\u2500\u2500\u252C\u2500\u2500\u2500\u252C\u2500\u2500\u2500\u252C\u2500\u2500\u2500\u252C\u2500\u2500\u2500\u252C\u2500\u2500\u2500\u252C\u2500\u2500\u2500\u2510     \r\n             * \u2502\x1B[30;48;5;225m 58\x1B[m\u2502\x1B[30;48;5;225m 59\x1B[m\u2502\x1B[30;48;5;225m 60\x1B[m\u2502\x1B[30;48;5;225m 61\x1B[m\u2502\x1B[30;48;5;225m 62\x1B[m\u2502\x1B[30;48;5;225m 63\x1B[m\u2502\x1B[30;48;5;225m 64\x1B[m\u2502\x1B[30;48;5;225m 65\x1B[m\u2502\x1B[30;48;5;225m 66\x1B[m\u2502\x1B[30;48;5;225m 67\x1B[m\u2502\x1B[30;48;5;225m 68\x1B[m\u2502\x1B[30;48;5;225m 69\x1B[m\u2502\x1B[30;48;5;225m 70\x1B[m\u2502\x1B[30;48;5;225m 71\x1B[m\u2502     \r\n               \u2502\x1B[30;48;5;225m Ce\x1B[m\u2502\x1B[30;48;5;225m Pr\x1B[m\u2502\x1B[30;48;5;225m Nd\x1B[m\u2502\x1B[30;48;5;225m Pm\x1B[m\u2502\x1B[30;48;5;225m Sm\x1B[m\u2502\x1B[30;48;5;225m Eu\x1B[m\u2502\x1B[30;48;5;225m Gd\x1B[m\u2502\x1B[30;48;5;225m Tb\x1B[m\u2502\x1B[30;48;5;225m Dy\x1B[m\u2502\x1B[30;48;5;225m Ho\x1B[m\u2502\x1B[30;48;5;225m Er\x1B[m\u2502\x1B[30;48;5;225m Tm\x1B[m\u2502\x1B[30;48;5;225m Yb\x1B[m\u2502\x1B[30;48;5;225m Lu\x1B[m\u2502     \r\n               \u251C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u253C\u2500\u2500\u2500\u2524     \r\n             * \u2502\x1B[30;48;5;218m 90\x1B[m\u2502\x1B[30;48;5;218m 91\x1B[m\u2502\x1B[30;48;5;218m 92\x1B[m\u2502\x1B[30;48;5;218m 93\x1B[m\u2502\x1B[30;48;5;218m 94\x1B[m\u2502\x1B[30;48;5;218m 95\x1B[m\u2502\x1B[30;48;5;218m 96\x1B[m\u2502\x1B[30;48;5;218m 97\x1B[m\u2502\x1B[30;48;5;218m 98\x1B[m\u2502\x1B[30;48;5;218m 99\x1B[m\u2502\x1B[30;48;5;218m100\x1B[m\u2502\x1B[30;48;5;218m101\x1B[m\u2502\x1B[30;48;5;218m102\x1B[m\u2502\x1B[30;48;5;218m103\x1B[m\u2502     \r\n             * \u2502\x1B[30;48;5;218m Th\x1B[m\u2502\x1B[30;48;5;218m Pa\x1B[m\u2502\x1B[30;48;5;218m U \x1B[m\u2502\x1B[30;48;5;218m Np\x1B[m\u2502\x1B[30;48;5;218m Pu\x1B[m\u2502\x1B[30;48;5;218m Am\x1B[m\u2502\x1B[30;48;5;218m Cm\x1B[m\u2502\x1B[30;48;5;218m Bk\x1B[m\u2502\x1B[30;48;5;218m Cf\x1B[m\u2502\x1B[30;48;5;218m Es\x1B[m\u2502\x1B[30;48;5;218m Fm\x1B[m\u2502\x1B[30;48;5;218m Md\x1B[m\u2502\x1B[30;48;5;218m No\x1B[m\u2502\x1B[30;48;5;218m Lr\x1B[m\u2502     \r\n               \u2514\u2500\u2500\u2500\u2534\u2500\u2500\u2500\u2534\u2500\u2500\u2500\u2534\u2500\u2500\u2500\u2534\u2500\u2500\u2500\u2534\u2500\u2500\u2500\u2534\u2500\u2500\u2500\u2534\u2500\u2500\u2500\u2534\u2500\u2500\u2500\u2534\u2500\u2500\u2500\u2534\u2500\u2500\u2500\u2534\u2500\u2500\u2500\u2534\u2500\u2500\u2500\u2534\u2500\u2500\u2500\u2518     ");
}