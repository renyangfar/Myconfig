;$CapsLock::Ctrl
;$RAlt::LAlt
LWin & c::^insert
LWin & v::+insert
Ctrl & [::send {Esc}

LCtrl & k::send {Up}
LCtrl & j::send {Down}
LCtrl & h::send {Left}
LCtrl & l::send {Right}

#1::WinGetClass, Clipboard, A ; Will copy the ahk_class of the Active Window to clipboard

:*:-ih::-i https://pypi.tuna.tsinghua.edu.cn/simple

!g::Run https://www.google.com/

^+c::
; null= 
send ^c
sleep,200
clipboard=%clipboard% ;%null%
tooltip,%clipboard%
sleep,500
tooltip,
return


LAlt & Capslock::SetCapsLockState, % GetKeyState("CapsLock", "T") ? "Off" : "On"
;!u::Send ^c !{tab} ^v

!e::
IfWinNotExist ahk_class Chrome_WidgetWin_1
{
    Run "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
    WinActivate
}
Else IfWinNotActive ahk_class Chrome_WidgetWin_1
{
    WinActivate
}
Else
{
    WinMinimize
}
Return

!q::
IfWinNotExist ahk_exe TIM.exe
{
    Run "C:\Program Files (x86)\Tencent\TIM\Bin\QQScLauncher.exe"
    WinActivate
}
Else IfWinNotActive ahk_exe TIM.exe
{
    WinActivate
}
Else
{
    WinMinimize
}
Return

!v::
IfWinNotExist ahk_class WeChatMainWndForPC
{
    Run "C:\Program Files (x86)\Tencent\WeChat\WeChat.exe"
    WinActivate
}
Else IfWinNotActive ahk_class WeChatMainWndForPC
{
    WinActivate
}
Else
{
    WinMinimize
}
Return

!i::
IfWinNotExist ahk_class TMobaXtermForm
{
    Run "E:\360Downloads\MobaXterm_Portable_v20.1\MobaXterm_Personal_20.1.exe"
    WinActivate
}
Else IfWinNotActive ahk_class TMobaXtermForm
{
    WinActivate
}
Else
{
    WinMinimize
}
Return

LCtrl & y::
send ^c
Run http://www.youdao.com/
winwaitactive,有道
sleep,100
send ^v{enter}
return

