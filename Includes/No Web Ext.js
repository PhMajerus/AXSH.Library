/****************************************************************************
** "No Web Ext.js"  (JScript Include)
** Delete additional properties of the String.prototype object.
** 
** JScript includes some additional features for Web Browsers,
** as described in Annex B.2 of the language specification :
**   http://www.ecma-international.org/ecma-262/6.0/#sec-additional-properties-of-the-string.prototype-object
** 
** These extensions are legacy and shouldn't be used in generic JavaScript.
** This library removes all the extensions from JScript.
** 
** - Philippe Majerus
** 
****************************************************************************/


// Turn on strict mode for this file.
"use strict";


delete String.prototype.anchor;
delete String.prototype.big;
delete String.prototype.blink;
delete String.prototype.bold;
delete String.prototype.fixed;
delete String.prototype.fontcolor;
delete String.prototype.fontsize;
delete String.prototype.italics;
delete String.prototype.link;
delete String.prototype.small;
delete String.prototype.strike;
delete String.prototype.sub;
delete String.prototype.sup;

// Also delete any extra added by "VT host.js".
delete String.prototype.backcolor;
delete String.prototype.inverted;
delete String.prototype.underline;
