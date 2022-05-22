; =================================================
; AutoRotation for World of Warcraft
; by whipowill
; =================================================

#SingleInstance Force
#InstallKeybdHook
#InstallMouseHook

is_active := 0
Return

XButton2::
    is_active := !is_active

    if (!is_active)
    {
        SetTimer, MoveTimer, Off

        SplashTextOn, , , OFF
        Sleep, 1000
        SplashTextOff
    }
    else
    {
        SetTimer, MoveTimer, 200

        SplashTextOn, , , ON
        Sleep, 1000
        SplashTextOff
    }
Return

MoveTimer:
    if (WinActive("World of Warcraft"))
    {
        Send {F7}
        Send {F8}
        Send {F9}
        Send {F10}
        Send {F11}
        Send {F12}
    }
Return