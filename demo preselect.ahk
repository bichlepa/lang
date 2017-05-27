#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;~ #Warn  ; Recommended for catching common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;this file shows what you need to do at minimum to use lang()

;Include the language
#include language\language.ahk

;call the initialization routine
lang_init()

;This is an example implementation of language selection
langnames:=""
for onelangindex, onelang in _language.allLangNames
{
	langnames.="|" onelang
}
StringTrimLeft, langnames, langnames, 1
gui, add, text, xm ym w200, Choose language
gui, add, DropDownList, xm Y+10 w200 vlanguageChanged AltSubmit, % langnames
guicontrol,choose,vlanguageChanged,% _language.allLangs[_language.lang].langname
gui, add, Button, X+10 yp w50 glanguageChosen, OK

gui,show
return

languageChosen:
gui,submit
lang_setLanguage(languageChanged)
gui,destroy

;now you can use the function lang()
gui, add, text,ym xm vtext1 w300, % lang("Hello world")
gui, add, text,xm Y+10 vtext2 w300, % lang("You can make your application multilingual!")
gui, add, text,xm Y+10 vtext3 w200, % lang("Please, change the language")

gui,show,w400,% lang("Lang() demonstration")
return

guiclose:
ExitApp