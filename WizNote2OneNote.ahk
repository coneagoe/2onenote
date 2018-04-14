#NoEnv ;初始化环境
#SingleInstance force
#Persistent
CoordMode Mouse,Screen  ;默认坐标是相对于窗口的，需要改成相对屏幕的
DetectHiddenWindows, Off


global start := true
global pre_title = ""
global firefox := "C:\Program Files (x86)\Mozilla Firefox\firefox.exe"
global paste_interval := 3000


^F1::
    global start
	start := true
	IniRead, common_delay, config.ini, Section, common_delay
	IniRead, paste_to_onenote, config.ini, Section, paste_to_onenote
	IniRead, edit_in_wiznote, config.ini, Section, edit_in_wiznote
	IniRead, switch_folder_wiznote, config.ini, Section, switch_folder_wiznote
	Gosub,do
Return


^F2::
    global start
    start := false


do:
Loop Files, E:\backup\wiznote\4\*.htm, R ;loop index.htm
{
    global start
    global pre_title

    if (start != true)
    {
        MsgBox, "Exit"
        Return
    }
    
    if (A_LoopFileName != "index.htm")
    {
        continue
    }
    
    ;MsgBox, %A_LoopFileFullPath%
    
    Run, %A_LoopFileFullPath% ;open with Firefox
    Sleep, 5000
    
    Click, 1066, 141
    
    ;WinGet, active_id, ID, A ;get Firefox id
    ;MsgBox, %firefox_id%
    WinGetActiveTitle, tmp
    
    ;remove " - Mozilla Firefox" from title
    len := StrLen(tmp) - StrLen(" - Mozilla Firefox")
    cur_title := SubStr(tmp, 1, len)
    ;MsgBox, %cur_title%
    
    ;ctrl-c note
    Send ^a
    Clipboard = ;clean clipboard
    Send ^c
    ;Sleep, paste_interval ;ClipWait cannot work
    ClipWait, 5
    
    Send ^w ;close tab

    ;ctrl-v note
    WinActivate,ahk_class Framework::CFrame ;active OneNote
    Send ^n ;create a new page
    Send {Text} %cur_title% ;input title
    Send {Enter}
    Send ^v
    Sleep, 5000
}
Return