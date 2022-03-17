#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

#IfWinActive ahk_class MozillaWindowClass ; Run the program only if firefox is active
    #c:: ;Windows + c 
        clipboard := "" ; Empty the clipboard. Give the clipboard no content. So can we detect when the text has arrived.
        Send ^c 
        ClipWait ; Wait for the clipboard to contain text. 
        WinActivate, ahk_exe Obsidian.exe ; switch into the program 
        Sleep, 30
        clipboard := StrReplace(Clipboard, "`r`n", " ") ;  Removes all CR+LF's from the clipboard contents. 
        Sleep, 30

        Send ^v ; paste text 
        SendEvent, {Enter} ; add new row. This allows an easier distinction between several text blocks

        WinActivate, ahk_class MozillaWindowClass ; switches back to the browser
    return
#IfWinActive