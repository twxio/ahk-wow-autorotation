; =================================================
; AutoRotation for World of Warcraft
; by whipowill
; =================================================

#SingleInstance Force
#InstallKeybdHook
#InstallMouseHook

is_active := 0
return

SplashImage, , B H10 W10 X0 Y0, , , ,
SplashImage, , B H10 W10 X0 Y0, , , ,

+XButton2::
    is_active := !is_active

    if (is_active)
    {
        SetTimer, MoveTimer, 200
        splashimage 1:, B W10 H10 X0 Y0 CWBlue
    }
    else
    {
        SetTimer, MoveTimer, Off
        splashimage 1:, B W0 H0 X0 Y0
        KeyDown := false
        SendInput {LAlt up}
        splashimage 2:, B W0 H0 X0 Y0
    }
return

MoveTimer:
    if (WinActive("World of Warcraft"))
    {
        state1 := GetKeyState("Shift", "P")
        state2 := GetKeyState("Control", "P")
        if (!state1 and !state2)
        {
            Send {F7}
            Send {F8}
            Send {F9}
            Send {F10}
            Send {F11}
            Send {F12}
        }
    }
return

XButton2::
    if (is_active)
    {
        KeyDown := !KeyDown
        if KeyDown
        {
            SendInput {LAlt down}
            splashimage 2:, B W10 H10 X11 Y0 CWLime
        }
        else
        {
            SendInput {LAlt up}
            splashimage 2:, B W0 H0 X0 Y0
        }
    }
return