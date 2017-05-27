#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;~ #Warn  ; Recommended for catching common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;Include the language
#include language\language.ahk

;optional: create the object _language and write some setting. If you don't do that, default settings will be used
_language:=Object()
_language.dir:=A_ScriptDir "\language" ;Directory where the translations are stored
_language.lang:="en" ;chosen language

;call the initialization routine
lang_init()


;now you can use the function lang()

gui, add, text,ym xm vtext1 w300, % lang("Hello world")
gui, add, text,xm Y+10 vtext2 w300, % lang("You can make your application multilingual!")
gui, add, text,xm Y+10 vtext3 w200, % lang("Please, change the language")

;This is an example implementation of language selection
langnames:=""
for onelangindex, onelang in _language.allLangNames
{
	langnames.="|" onelang
}
StringTrimLeft, langnames, langnames, 1
gui, add, DropDownList, X+10 yp glanguageChanged vlanguageChanged AltSubmit, % langnames
guicontrol,choose,languageChanged,% _language.allLangs[_language.lang].langname


gui,show,w400,% lang("Lang() demonstration")
return

;This code allows that the language can be changed during runtime. If you want to make it easy, you can skip that and tell user that he has to restart the application.
languageChanged:
gui,submit, nohide
lang_setLanguage(languageChanged)

guicontrol,,text1, % lang("Hello world")
guicontrol,,text2, % lang("You can make your application multilingual!")
guicontrol,,text3, % lang("Please, change the language")
gui,show,,% lang("Lang() demonstration")

return