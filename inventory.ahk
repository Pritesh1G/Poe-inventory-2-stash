#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#SingleInstance, Force
#IfWinActive, Path of Exile

topLeftX := 920
topLeftY := 508
delta := 50
clickDelay := 30

!g::
    MouseGetPos, xpos, ypos
    MsgBox, Coordinates:`nX: %xpos%`nY: %ypos%
    return

!c::
    MouseGetPos, startX, startY
    SetDefaultMouseSpeed, 0
    BlockInput, On

    Loop, 5
    {
        row := A_Index - 1
        currentY := topLeftY + (row * delta)

        Loop, 11
        {
            col := A_Index - 1

            ; Skip slots at (row 3, col 10) and (row 4, col 10)
            if ((row = 3 || row = 4) && col = 10)
                continue

            currentX := topLeftX + (col * delta)
            MouseMove, %currentX%, %currentY%
            SendEvent, ^{Click}
            Sleep, %clickDelay%
        }
    }

    BlockInput, Off
    SetDefaultMouseSpeed, 2
    MouseMove, %startX%, %startY%
    return
