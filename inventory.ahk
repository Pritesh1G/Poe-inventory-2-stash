#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#SingleInstance, Force
#IfWinActive, Path of Exile

; =============================================
; === USER CONFIGURATION =======================
; =============================================

topLeftX := 920      ; CHANGE ME — X coordinate of top-left inventory slot
topLeftY := 508      ; CHANGE ME — Y coordinate of top-left inventory slot
delta := 50          ; CHANGE ME — distance between slots (square size)
clickDelay := 30     ; Delay (ms) between clicks

; =============================================
; === HOTKEY: ALT + G to Get Mouse Coordinates
; =============================================
!g::
    MouseGetPos, xpos, ypos
    MsgBox, 64, Slot Position Captured, 
    (
        Coordinates recorded:

        X: %xpos%
        Y: %ypos%

        👉 Copy these numbers into the script where it says:
           topLeftX := ...
           topLeftY := ...

        🔁 Repeat for the slot next to it (right) to calculate "delta".
        Subtract the X values between slots to get your delta size.
    )
    return

; =============================================
; === HOTKEY: ALT + C to Transfer Inventory
; =============================================
!c::
    ; Save original mouse position to restore it later
    MouseGetPos, startX, startY
    SetDefaultMouseSpeed, 0
    BlockInput, On

    ; Loop over 5 inventory rows
    Loop, 5
    {
        row := A_Index - 1
        currentY := topLeftY + (row * delta)

        ; Loop over 11 columns (0–10)
        Loop, 11
        {
            col := A_Index - 1

            ; Skip specific bottom-right slots: (row 3, col 10) and (row 4, col 10)
            if ((row = 3 || row = 4) && col = 10)
                continue

            currentX := topLeftX + (col * delta)
            MouseMove, %currentX%, %currentY%
            SendEvent, ^{Click}  ; Ctrl+Click
            Sleep, %clickDelay%
        }
    }

    ; Restore original mouse position and settings
    BlockInput, Off
    SetDefaultMouseSpeed, 2
    MouseMove, %startX%, %startY%
    return
