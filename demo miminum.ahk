#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;~ #Warn  ; Recommended for catching common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;this file shows what you need to do at minimum to use lang()

;Include the language
#include language\language.ahk

;call the initialization routine
lang_init()
;wen do not call lang_setLanguage(). lang() will try to choose the languages automatically depending on the Windows language

;now you can use the function lang()
gui, add, text,ym xm vtext1 w300, % lang("Hello world")
gui, add, text,xm Y+10 vtext2 w300, % lang("You can make your application multilingual!")

gui,show,w400,% lang("Lang() demonstration")
return

guiclose:
ExitApp