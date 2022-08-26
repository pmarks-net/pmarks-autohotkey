#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance Force
#Include Xinput.ahk

XInput_Init()

Gui, Add, Picture,, ps2.png
Gui, -Caption +ToolWindow +AlwaysOnTop

Loop {
  Loop, 4 {
    if State := XInput_GetState(A_Index-1) {
      if (State.wButtons & XINPUT_GAMEPAD_GUIDE) {
        Gui, Show
      } else {
        Gui, Hide
      }
    }
  }
  Sleep, 50
}