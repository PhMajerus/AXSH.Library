/*
** Display an ANSI-Art aimed to correct users who accidentally enter dr() instead of dir().
** Dr stands for Doctor.
*/

function dr(fileNameSpecs) {
	AXSH.echo("\x1B[49m\xA0\xA0\xA0\xA0\xA0\xA0\xA0\xA0\xA0\xA0\xA0\x1B[38;2;222;74;72m\u2584\x1B[38;2;221;73;71m\u2584\x1B[38;2;222;74;71m\u2584\x1B[38;2;223;74;71m\u2584\x1B[m\r\n\x1B[49m\xA0\xA0\xA0\xA0\xA0\xA0\xA0\xA0\x1B[38;2;252;84;81m\u2584\x1B[38;2;254;85;82;48;2;240;80;77m\u2584\u2588\u2588\u2588\u2588\u2588\u2588\x1B[48;2;223;74;71m\u2584\x1B[38;2;237;78;76;49m\u2584\x1B[m\r\n\x1B[49m\xA0\xA0\xA0\xA0\xA0\xA0\x1B[38;2;198;66;63m\u2584\x1B[38;2;254;85;82;48;2;241;81;78m\u2584\u2588\u2588\u2588\u2588\u2588\u2588\u2588\u2588\u2588\u2588\x1B[48;2;235;78;75m\u2584\x1B[38;2;224;74;72;49m\u2584\x1B[m\r\n\x1B[49m\xA0\xA0\xA0\xA0\xA0\xA0\x1B[38;2;224;74;72;48;2;208;70;67m\u2584\x1B[38;2;254;85;82m\u2588\u2588\u2588\u2588\u2588\u2588\x1B[48;2;205;69;66m\u2580\u2588\u2588\u2588\u2588\x1B[38;2;239;80;77;48;2;238;79;77m\u2580\x1B[38;2;249;83;80;48;2;204;68;66m\u2580\x1B[38;2;235;79;76;48;2;211;70;68m\u2580\x1B[49;97m\xA0\xA0\xA0 \xA0\xA0TRUST\xA0ME,\x1B[m\r\n\x1B[49m\xA0\xA0\xA0\xA0\xA0\xA0\x1B[38;2;192;64;62m\u2580\x1B[38;2;254;85;82;48;2;243;80;78m\u2580\u2588\u2588\u2588\x1B[48;2;225;75;73m\u2580\x1B[38;2;216;72;69;48;2;229;76;74m\u2580\x1B[38;2;223;75;72;48;2;253;85;82m\u2580\x1B[38;2;254;85;82;48;2;225;78;76m\u2580\x1B[38;2;249;83;80;48;2;209;98;96m\u2580\x1B[38;2;236;79;76;48;2;182;85;84m\u2580\x1B[38;2;231;77;74;48;2;195;79;77m\u2580\x1B[38;2;248;83;80;48;2;211;196;196m\u2580\x1B[38;2;213;77;75;48;2;242;242;242m\u2580\x1B[38;2;191;66;64;48;2;108;108;108m\u2580\x1B[38;2;201;70;68;48;2;240;239;239m\u2580\x1B[49;97m\xA0\xA0\xA0\xA0\xA0I'M\xA0A\xA0DOCTOR.\x1B[m\r\n\x1B[49m\xA0\xA0\xA0\xA0\xA0\xA0\xA0\x1B[38;2;198;66;63m\u2580\x1B[38;2;254;85;82;48;2;236;79;76m\u2580\u2588\u2588\x1B[38;2;208;69;67;48;2;184;83;81m\u2580\x1B[38;2;216;91;89;48;2;238;236;236m\u2580\x1B[38;2;161;124;123;48;2;254;254;254m\u2580\x1B[38;2;77;76;76m\u2580\xA0\x1B[38;2;209;180;180;48;2;206;148;147m\u2580\x1B[38;2;223;82;80;48;2;254;85;82m\u2580\x1B[38;2;234;232;232;48;2;200;101;99m\u2580\x1B[38;2;254;254;254;48;2;198;193;193m\u2580\x1B[48;2;211;200;200m\u2580\x1B[38;2;245;245;245;48;2;179;114;113m\u2580\x1B[m\r\n\x1B[49m\xA0\xA0\xA0\xA0\xA0\xA0\xA0\xA0\x1B[38;2;185;63;59m\u2580\x1B[38;2;254;85;82;48;2;226;76;73m\u2580\u2588\x1B[48;2;229;83;80m\u2584\x1B[38;2;229;83;81;48;2;222;210;210m\u2584\x1B[38;2;209;129;127;48;2;254;254;254m\u2584\x1B[38;2;207;119;117m\u2584\x1B[38;2;186;65;62;48;2;217;202;201m\u2584\x1B[38;2;254;85;82;48;2;228;84;82m\u2584\u2588\u2588\x1B[48;2;215;72;69m\u2584\x1B[38;2;253;85;82;48;2;203;68;65m\u2584\x1B[38;2;210;69;67;48;2;220;73;71m\u2584\x1B[m\r\n\x1B[49m\xA0\xA0\xA0\xA0\xA0\xA0\xA0\xA0\xA0\xA0\x1B[38;2;234;78;75;48;2;254;85;82m\u2584\xA0\xA0\x1B[38;2;226;76;73m\u2580\x1B[38;2;208;69;67m\u2580\x1B[38;2;245;82;79m\u2580\xA0\xA0\xA0\xA0\xA0\x1B[38;2;251;84;81m\u2584\x1B[38;2;212;71;68;48;2;253;85;82m\u2584\x1B[38;2;196;66;62m\u2580\x1B[49m\xA0\xA0\xA0\xA0\xA0\xA0\xA0\xA0\xA0\xA0\xA0\xA0\xA0\xA0\xA0\xA0\xA0\xA0\xA0\x1B[38;2;210;70;67;48;2;225;75;73m\u2580\x1B[38;2;226;75;72;48;2;252;84;81m\u2580\x1B[m\r\n\x1B[49m\xA0\xA0\xA0\xA0\xA0\xA0\xA0\xA0\xA0\xA0\x1B[38;2;218;73;70m\u2580\x1B[38;2;254;85;82m\u2588\u2588\u2588\u2588\x1B[48;2;160;53;51m\u2580\x1B[48;2;206;69;66m\u2580\u2588\x1B[38;2;237;79;76;48;2;212;71;68m\u2580\x1B[38;2;254;85;82;48;2;248;83;80m\u2580\x1B[38;2;219;73;70;48;2;253;85;82m\u2580\x1B[38;2;247;83;80;48;2;207;69;67m\u2580\x1B[38;2;210;70;68;48;2;252;84;81m\u2580\x1B[38;2;249;83;80;48;2;209;70;67m\u2580\x1B[38;2;224;75;72;48;2;251;84;81m\u2580\x1B[49m\xA0\xA0\xA0\xA0\xA0\xA0\xA0\xA0\xA0\x1B[38;2;225;75;72m\u2584\x1B[38;2;214;72;70m\u2584\xA0\xA0\xA0\xA0\xA0\xA0\x1B[38;2;254;85;82;48;2;196;65;64m\u2584\x1B[48;2;252;84;81m\u2584\u2588\x1B[38;2;232;77;75;48;2;232;78;74m\u2584\x1B[m\r\n\x1B[49m\xA0\xA0\xA0\xA0\xA0\xA0\xA0\xA0\xA0\xA0\xA0\x1B[38;2;251;84;81;48;2;254;85;82m\u2584\xA0\xA0\x1B[38;2;252;84;81m\u2580\x1B[38;2;9;3;3;48;2;241;81;78m\u2580\x1B[38;2;71;24;23;48;2;234;78;75m\u2580\x1B[38;2;252;84;81;48;2;229;77;74m\u2580\x1B[48;2;254;85;82m\u2580\x1B[38;2;210;70;68;48;2;209;70;67m\u2580\x1B[38;2;254;85;82m\u2588\xA0\u2588\x1B[38;2;208;70;67m\u2584\x1B[38;2;212;71;68;48;2;251;84;81m\u2584\x1B[49m\xA0\xA0\xA0\xA0\xA0\xA0\xA0\xA0\x1B[38;2;216;73;69m\u2584\x1B[38;2;254;85;82m\u2588\x1B[38;2;230;77;74;48;2;215;72;70m\u2584\x1B[49m\xA0\xA0\xA0\xA0\x1B[38;2;211;70;67m\u2584\x1B[38;2;254;85;82;48;2;225;75;72m\u2584\u2588\u2588\u2588\x1B[38;2;248;83;80;48;2;244;81;79m\u2584\x1B[m\r\n\x1B[49m\xA0\xA0\xA0\xA0\xA0\xA0\xA0\xA0\xA0\xA0\x1B[38;2;253;254;204;48;2;196;195;157m\u2584\x1B[38;2;186;125;106;48;2;228;80;76m\u2584\x1B[38;2;249;83;80;48;2;254;85;82m\u2584\xA0\xA0\xA0\x1B[38;2;253;85;81m\u2580\x1B[38;2;210;70;68;48;2;203;68;65m\u2580\x1B[38;2;254;85;82;48;2;207;69;67m\u2580\x1B[38;2;206;69;66;48;2;191;64;61m\u2580\x1B[38;2;254;85;82;48;2;208;69;67m\u2580\x1B[38;2;184;61;59;48;2;179;76;69m\u2580\x1B[38;2;202;68;65;48;2;216;216;174m\u2580\x1B[49m\xA0\xA0\xA0\xA0\xA0\xA0\xA0\xA0\xA0\xA0\x1B[38;2;235;79;76;48;2;251;84;81m\u2580\x1B[38;2;254;85;82m\u2588\x1B[48;2;250;84;81m\u2584\x1B[38;2;201;66;64;49m\u2584\xA0\x1B[38;2;207;70;67m\u2584\x1B[38;2;254;85;82;48;2;232;77;75m\u2584\x1B[48;2;240;80;77m\u2584\u2588\u2588\u2588\u2588\x1B[38;2;215;72;70;48;2;227;76;73m\u2584\x1B[m\r\n\x1B[49m\xA0\xA0\xA0\xA0\xA0\xA0\xA0\xA0\x1B[38;2;198;198;159m\u2584\x1B[38;2;253;254;204;48;2;226;227;181m\u2584\u2588\x1B[48;2;225;228;184m\u2584\x1B[38;2;180;200;165;48;2;124;140;124m\u2584\x1B[38;2;139;226;199;48;2;185;98;90m\u2584\x1B[38;2;128;206;182;48;2;234;79;76m\u2584\x1B[38;2;130;173;153;48;2;254;85;82m\u2584\x1B[38;2;142;160;142m\u2584\x1B[38;2;143;159;141m\u2584\x1B[38;2;134;168;149;48;2;253;85;82m\u2584\x1B[38;2;105;164;144;48;2;244;82;79m\u2584\x1B[38;2;141;230;202;48;2;195;88;82m\u2584\x1B[38;2;138;226;198;48;2;124;139;123m\u2584\x1B[38;2;213;215;173;48;2;238;239;192m\u2584\x1B[38;2;253;254;204;48;2;218;219;175m\u2584\x1B[38;2;249;250;200;49m\u2584\x1B[38;2;208;208;168m\u2584\xA0\xA0\xA0\xA0\xA0\xA0\xA0\x1B[38;2;218;73;70;48;2;245;82;79m\u2584\x1B[38;2;254;85;82m\u2588\u2588\x1B[38;2;248;83;80m\u2584\x1B[38;2;242;81;78;48;2;207;69;67m\u2584\x1B[38;2;254;85;82m\u2588\u2588\u2588\u2588\u2588\u2588\x1B[48;2;226;75;73m\u2580\x1B[m\r\n\x1B[49m\xA0\xA0\xA0\xA0\xA0\xA0\xA0\x1B[38;2;189;189;152;48;2;249;250;201m\u2580\x1B[38;2;253;254;204m\u2588\u2588\u2588\u2588\x1B[48;2;252;253;203m\u2584\x1B[38;2;247;248;199;48;2;150;187;157m\u2584\x1B[38;2;122;151;127;48;2;138;226;199m\u2584\x1B[38;2;115;189;166;48;2;142;232;204m\u2584\x1B[38;2;117;191;168m\u2584\x1B[38;2;117;192;169m\u2584\x1B[38;2;117;191;168m\u2584\x1B[38;2;103;169;148;48;2;116;190;167m\u2584\x1B[38;2;115;188;166;48;2;141;231;203m\u2584\x1B[38;2;134;219;193;48;2;112;183;161m\u2584\x1B[38;2;216;218;175;48;2;207;209;168m\u2584\x1B[38;2;253;254;204m\u2588\u2588\u2588\x1B[38;2;229;230;185;48;2;187;187;151m\u2584\x1B[38;2;229;229;184;49m\u2584\x1B[38;2;223;223;180m\u2584\xA0\xA0\xA0\xA0\x1B[38;2;198;66;64m\u2580\x1B[38;2;254;85;82;48;2;248;83;80m\u2580\u2588\u2588\u2588\u2588\u2588\u2588\u2588\x1B[48;2;251;84;81m\u2580\x1B[38;2;247;83;80;48;2;177;59;57m\u2580\x1B[m\r\n\x1B[49m\xA0\xA0\xA0\xA0\xA0\x1B[38;2;217;217;175m\u2584\x1B[38;2;251;252;203;48;2;195;196;157m\u2584\x1B[38;2;204;205;164;48;2;247;248;199m\u2584\x1B[38;2;234;235;189;48;2;253;254;204m\u2584\xA0\xA0\xA0\xA0\xA0\x1B[38;2;247;248;199m\u2580\x1B[38;2;152;189;159;48;2;245;246;197m\u2580\x1B[38;2;138;226;199;48;2;151;124;106m\u2580\x1B[38;2;142;232;204;48;2;168;92;84m\u2580\x1B[48;2;134;220;193m\u2580\u2588\u2588\x1B[38;2;126;206;181;48;2;127;194;168m\u2580\x1B[38;2;238;238;191;48;2;252;253;203m\u2580\x1B[38;2;253;254;204m\u2588\u2588\u2588\u2588\x1B[38;2;207;208;167;48;2;208;208;167m\u2580\x1B[38;2;253;254;204m\u2588\x1B[48;2;227;228;183m\u2584\x1B[38;2;238;239;191;49m\u2584\xA0\xA0\x1B[38;2;230;231;185;48;2;169;169;137m\u2584\x1B[38;2;191;123;104;48;2;215;76;73m\u2584\x1B[38;2;247;83;80;48;2;254;85;82m\u2584\xA0\xA0\xA0\xA0\x1B[38;2;232;78;75m\u2584\x1B[38;2;246;82;79;49m\u2580\x1B[38;2;171;57;56m\u2580\x1B[m\r\n\x1B[49m\xA0\xA0\xA0\xA0\x1B[38;2;193;193;156;48;2;245;246;198m\u2580\x1B[38;2;253;254;204m\u2588\u2588\u2588\x1B[38;2;201;202;162;48;2;245;246;197m\u2580\x1B[38;2;252;253;203;48;2;213;214;172m\u2580\x1B[38;2;253;254;204m\u2588\u2588\u2588\x1B[48;2;227;219;177m\u2580\x1B[38;2;220;88;81m\u2584\x1B[38;2;254;85;82;48;2;207;99;88m\u2584\x1B[38;2;242;81;78;48;2;253;85;81m\u2584\x1B[38;2;216;203;164;48;2;199;110;96m\u2584\x1B[38;2;253;254;204;48;2;155;192;161m\u2584\x1B[38;2;202;212;172;48;2;135;220;193m\u2584\x1B[38;2;133;195;169;48;2;142;232;204m\u2584\x1B[38;2;175;201;167;48;2;148;197;167m\u2584\x1B[38;2;253;254;204m\u2588\x1B[48;2;253;254;203m\u2584\u2584\u2584\u2584\x1B[38;2;236;237;190;48;2;209;210;169m\u2584\x1B[38;2;225;226;181;48;2;251;252;202m\u2584\x1B[38;2;253;254;204;48;2;253;254;203m\u2584\u2588\x1B[48;2;240;241;193m\u2584\x1B[38;2;207;208;167;49m\u2584\x1B[38;2;253;254;204m\u2588\x1B[48;2;252;253;203m\u2584\x1B[48;2;209;186;151m\u2584\x1B[48;2;207;113;99m\u2584\x1B[38;2;242;243;194;48;2;221;78;74m\u2584\x1B[38;2;209;203;163;48;2;251;84;81m\u2584\x1B[38;2;221;222;178;48;2;208;100;89m\u2584\x1B[m\r\n\x1B[49m\xA0\xA0\xA0\x1B[38;2;253;254;204;48;2;220;220;176m\u2584\u2588\u2588\u2588\u2588\u2588\x1B[38;2;208;209;168;48;2;207;208;167m\u2584\x1B[38;2;253;253;204;48;2;253;254;204m\u2584\xA0\x1B[38;2;210;190;154;48;2;251;252;202m\u2584\x1B[38;2;249;83;80;48;2;204;102;90m\u2584\x1B[38;2;254;85;82m\u2588\u2588\x1B[38;2;209;127;108;48;2;208;100;89m\u2584\x1B[38;2;253;254;204m\u2588\u2588\u2588\x1B[48;2;245;246;197m\u2584\x1B[48;2;196;198;159m\u2584\x1B[38;2;228;228;183;48;2;227;227;183m\u2584\x1B[38;2;201;202;162;48;2;253;254;204m\u2584\x1B[38;2;240;241;193m\u2584\xA0\xA0\x1B[38;2;253;254;203m\u2580\x1B[38;2;208;209;168;48;2;209;210;168m\u2580\x1B[38;2;253;254;204m\u2588\u2588\u2588\x1B[48;2;218;219;175m\u2584\u2588\u2588\u2588\u2588\u2588\u2588\x1B[48;2;242;243;195m\u2580\x1B[m\r\n\x1B[49m\xA0\xA0\x1B[38;2;225;225;181;48;2;253;254;204m\u2580\xA0\xA0\xA0\xA0\xA0\xA0\x1B[38;2;230;231;185;48;2;251;252;202m\u2580\x1B[38;2;231;232;186;48;2;211;211;170m\u2580\x1B[38;2;253;254;204m\u2588\x1B[38;2;208;130;110;48;2;209;91;83m\u2580\x1B[38;2;254;85;82m\u2588\u2588\u2588\x1B[38;2;209;126;108;48;2;209;137;116m\u2580\x1B[38;2;253;254;204m\u2588\u2588\u2588\u2588\u2588\u2588\u2588\x1B[48;2;216;216;173m\u2584\x1B[38;2;245;246;197;48;2;204;205;165m\u2584\x1B[38;2;215;216;173;48;2;252;253;203m\u2584\x1B[38;2;253;254;204m\u2588\x1B[38;2;208;209;168m\u2588\x1B[38;2;253;254;204m\u2588\u2588\u2588\x1B[48;2;253;254;203m\u2584\u2588\u2588\u2588\u2588\u2588\u2588\x1B[38;2;203;203;163;48;2;216;218;174m\u2584\x1B[m\r\n\x1B[49m\xA0\x1B[38;2;244;245;197;48;2;227;228;183m\u2584\x1B[38;2;253;254;204m\u2588\u2588\u2588\u2588\u2588\u2588\u2588\u2588\x1B[38;2;180;181;145;48;2;209;210;168m\u2584\x1B[38;2;177;173;139;48;2;240;241;194m\u2584\x1B[38;2;249;83;80;48;2;222;76;73m\u2584\x1B[38;2;254;85;82m\u2588\u2588\x1B[38;2;250;84;80;48;2;245;82;79m\u2584\x1B[38;2;225;77;74;48;2;195;168;137m\u2584\x1B[38;2;202;153;126;48;2;253;254;204m\u2584\xA0\xA0\xA0\xA0\xA0\x1B[38;2;236;237;190;48;2;251;252;202m\u2584\x1B[38;2;216;217;174;48;2;200;201;161m\u2584\x1B[38;2;205;206;165;48;2;226;227;182m\u2584\x1B[38;2;209;210;168m\u2588\x1B[38;2;253;254;204;48;2;253;254;203m\u2584\x1B[38;2;209;209;168;48;2;209;210;168m\u2584\x1B[38;2;253;254;204;48;2;253;254;203m\u2584\u2588\u2588\u2584\u2588\u2588\u2588\u2588\u2584\x1B[48;2;236;237;190m\u2580\x1B[m\r\n\x1B[38;2;206;206;167;49m\u2584\x1B[38;2;253;254;204m\u2588\u2588\u2588\u2588\u2588\x1B[48;2;223;223;179m\u2580\x1B[38;2;252;253;203;48;2;207;208;167m\u2580\x1B[38;2;218;219;176;48;2;241;242;194m\u2580\x1B[38;2;204;204;164;48;2;253;254;204m\u2580\x1B[38;2;233;234;188m\u2580\x1B[38;2;206;157;130;48;2;209;155;129m\u2580\x1B[38;2;254;85;82m\u2588\u2588\u2588\u2588\u2588\x1B[48;2;241;82;78m\u2584\x1B[48;2;210;88;80m\u2584\x1B[38;2;248;83;80;48;2;195;119;102m\u2584\x1B[38;2;217;74;71;48;2;244;244;196m\u2584\x1B[38;2;197;96;85;48;2;245;246;197m\u2584\x1B[38;2;208;168;138;48;2;253;254;204m\u2584\x1B[38;2;205;166;137m\u2584\x1B[38;2;237;238;191;48;2;229;229;184m\u2584\x1B[38;2;217;217;174;48;2;250;251;201m\u2584\x1B[38;2;194;195;156;48;2;209;210;168m\u2584\x1B[38;2;253;254;204m\u2588\x1B[38;2;251;252;202;48;2;215;216;173m\u2584\x1B[38;2;206;207;166;48;2;246;247;198m\u2584\x1B[38;2;253;254;204m\u2588\u2588\u2588\u2588\u2588\u2588\u2588\x1B[48;2;250;251;201m\u2580\x1B[38;2;216;216;172;49m\u2580\x1B[m");
}
