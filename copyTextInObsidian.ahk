#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

; #IfWinActive ahk_exe obsidian.exe ; Run the program only if brave is active
#c:: ;Windows + c 
    if WinActive("ahk_exe brave.exe") or WinActive("ahk_class MozillaWindowClass"){
        WinGetActiveTitle, Title

        clipboard := "" ; Empty the clipboard. Give the clipboard no content. So can we detect when the text has arrived.
        Send ^c 
        
        ClipWait ; Wait for the clipboard to contain text. 
        WinActivate, ahk_exe Obsidian.exe ; switch into the program 
        Sleep, 30

        clipboard := StrReplace(Clipboard, "`r`n", " ") ;  Removes all CR+LF's from the clipboard contents. 
        Sleep, 10

        Send ^v ; paste text 
        SendEvent, {Enter} ; add new row. This allows an easier distinction between several text blocks

        WinActivate, %Title% ; switches back to the browser
    }
return
