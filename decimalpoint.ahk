#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

toggle  := 0 
return

EntferneToolTip: ; While the status is changed, an info (tooltip) appears. This function removes it.
ToolTip
return

NumpadDot:: 
if (toggle = 0){
           SendRaw, ,
    }
     else{
         SendRaw, .
    }
return

^NumpadDot:: ; strg + Numpaddot, main part of this script
    ; This is where the toggling occurs. You're setting the toggle to the opposite of itself.
    ; 1 becomes 0. True becomes False.
    toggle  := !toggle

    if (toggle = 0){
        ; If the toggle is off (0 or false), do the stuff in here
        ToolTip, Dezimalseparator:`n  Komma, 0, 0
        SetTimer, EntferneToolTip, -2000
    }
    else{
        ; If the toggle is on (1 or true), do the stuff in here
        ToolTip, Dezimalseparator:`n  Punkt, 0, 0
        SetTimer, EntferneToolTip, -2000
    }
return