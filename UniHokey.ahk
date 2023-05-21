#SingleInstance Force
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
;#NoTrayIcon
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

/*
|----------------------------------------------------------|
|----------------------------------------------------------|
|    https://github.com/ChaiyavutC/UniHotkey-AHK-edition   |
|----------------------------------------------------------|
|----------------------------------------------------------|
*/

Menu,Tray,NoStandard
Menu,Tray,Click,1
Menu,Tray,Add,Main UI,ClickHandler
Menu,Tray,Add,E&xit, TerminateProgram

;# Default text
quote = "
apostrophe = '
Percent := "%"
comma := ","

;# Version
version :="UniHotkey | v.26.3 by ChaiyavutC"

;# Library
#Include D:\Autohotkey\#Library\Gdip_All.ahk
#Include D:\Autohotkey\#Library\Class_ImageButton.ahk
#Include D:\Autohotkey\#Library\UseGDIP.ahk
#Include D:\Autohotkey\#Library\VA.ahk

;# Set CoordMode
CoordMode, Mouse, Screen
CoordMode, ToolTip, Screen
CoordMode, Pixel, Screen

;# Set Title Match mode to include
SetTitleMatchMode,2

;# Save file\
FullSaveFilePath := A_ScriptDir "\" "UHotkey" ".ini"

;# -------------------- Custom Variable --------------------

; Not lanuch "Fast Note" GUI yet
gui5 = 0

; Stopwatch is not yet working
enablestopwatch = 0 ;ปิดเป็นค่าdefault
stopwatchworking = 0 ;ปิดเป็นค่าdefault

; Browser bookmark bar set to hide
bookmarktab_on = 0 ;ปิดเป็นค่าdefault
bookmarktab_onaction = 0 ;ปิดเป็นค่าdefault
stopbookmarkcheck = 0 ;0เป็นค่าdefault

; Timer set to 0
S_HH =0 ;0เป็นค่าdefault
S_MM =00 ;00เป็นค่าdefault
S_SS =00 ;00เป็นค่าdefault

; The Addition Menu is not launch yer
EnableFocusChange = 0 ;0เป็นค่าdefault

;Tooltip Noti is not hided yet
WaitForReturnTooltipNoti = 0 ;0เป็นค่าdefault

;The Default window must be 100% opacity
ActiveWinTranspa := 255 ;0เป็นค่าdefault ทึบ 100%

;The Indicator GUI are not show yet.
GUI4showed = 0
GUI1showed = 0

;The MainUI is not launch yet
guimainhide = 1

/*;Button Colour Class_Imagebutton (Didn't use)
IBBtnStyles := [ [0, 0x801E1E1E, , 0xFFFFFFFF, 0, , 0x848484, 1]      ; normal
			   , [0, 0x80515151, , 0xFFFFFFFF, 0, , 0x848484, 1]      ; hover
			   , [0, 0x80777777, , 0xFFFFFFFF, 0, , 0x848484, 1]      ; pressed
			   , [0, 0x80000000, , 0x717171, 0, , 0x717171, 1] ]
hWndhBtn1
ImageButton.Create(hBtn1, IBBtnStyles*)
*/

;The Main GUI is not launch yet
guimainrun = 0 

;# Save file not existed
if !FileExist(FullSaveFilePath)
{
    ToolTip, Creating save file, -30 , 1028, 2

    SysGet, MonitorCount, MonitorCount
    if (MonitorCount == 2)
    {
        Gui, 7: Add,  Text, x24 y29 w93 h23, Left Monitor Width :
        Gui, 7: Add,  Edit, x125 y25 w52 h21 vleftMonitorWidth gAc_leftMonitorWidth limit4, 
        Gui, 7: Add,  Text, x23 y76 w96 h23, Left Monitor Height :
        Gui, 7: Add,  Edit, x125 y72 w52 h21 vleftMonitorHeight gAc_leftMonitorHeight limit4,
        Gui, 7: Add,  Text, x216 y29 w100 h23, Right Monitor Width :
        Gui, 7: Add,  Edit, x326 y24 w52 h21 vrightMonitorWidth gAc_rightMonitorWidth limit4,
        Gui, 7: Add,  Text, x216 y76 w106 h23, Right Monitor Height :
        Gui, 7: Add,  Edit, x329 y72 w52 h21 vrightMonitorHeight gAc_rightMonitorHeight limit4,
        Gui, 7: Add,  Button, x250 y113 w100 h40 gAc_FinishGetMonitorsInfo, Next
        Gui, 7: Add,  Text, x127 y126 w80 h23, is main monitor.
        Gui, 7: Add,  DDL, x30 y123 w90 h60 vmainmonitoris gAc_mainmonitoris limit4,Left Monitor|Right Monitor
        Gui, 7: -SysMenu
        Gui, 7: Show, w410 h172, This device has 2 monitors. Please provide device's monitors info.
    }
    Else if (MonitorCount > 2)
    {
        Msgbox, This program doesn't fully support more than 2 monitors. Some features may not work.
    }

    FileAppend, 
    (
    [Initialization]
        LastRun=
        MICName=
        TooltipNoti=1
        dismic=
        Dark_Mode=0
        NotiPopup=0
        DailySiteCheckIn=
        DailySiteCheckInBrowser=
        DetectDiscordMic=0
        TimeIdleCheck=1
        SyncMic=0
        EnablePushtotalk=0
        leftMonitorWidth=%leftMonitorWidth%
        leftMonitorHeight=%leftMonitorHeight%
        rightMonitorWidth=%rightMonitorWidth%
        rightMonitorHeight=%rightMonitorHeight%
        EnableToggleMic=1
        EnableDiscordMic=0
        autocollapsebookmarkbar=
        SpeakLang=1
        TooltipX=-30 
        TooltipY=1028
        IndicatorX=-4
        IndicatorY=1076
        mainmonitoris=
        SuspendGlobalHotkey=0
    ), UHotkey.ini
}

;# Import variables from the save file
IniRead, LastRun, UHotkey.ini, Initialization, LastRun
IniRead, MICName, UHotkey.ini, Initialization, MICName
IniRead, TooltipNoti, UHotkey.ini, Initialization, TooltipNoti
IniRead, dismic, UHotkey.ini, Initialization, dismic
IniRead, Dark_Mode, UHotkey.ini, Initialization, Dark_Mode
IniRead, NotiPopup, UHotkey.ini, Initialization, NotiPopup
IniRead, DailySiteCheckIn, UHotkey.ini, Initialization, DailySiteCheckIn
IniRead, DailySiteCheckInBrowser, UHotkey.ini, Initialization, DailySiteCheckInBrowser
IniRead, DetectDiscordMic, UHotkey.ini, Initialization, DetectDiscordMic
IniRead, TimeIdleCheck, UHotkey.ini, Initialization, TimeIdleCheck
IniRead, SyncMic, UHotkey.ini, Initialization, SyncMic
IniRead, EnablePushtotalk, UHotkey.ini, Initialization, EnablePushtotalk
IniRead, leftMonitorWidth, UHotkey.ini, Initialization, leftMonitorWidth
IniRead, leftMonitorHeight, UHotkey.ini, Initialization, leftMonitorHeight
IniRead, rightMonitorWidth, UHotkey.ini, Initialization, rightMonitorWidth
IniRead, rightMonitorHeight, UHotkey.ini, Initialization, rightMonitorHeight
IniRead, EnableToggleMic, UHotkey.ini, Initialization, EnableToggleMic
IniRead, EnableDiscordMic, UHotkey.ini, Initialization, EnableDiscordMic
IniRead, autocollapsebookmarkbar, UHotkey.ini, Initialization, autocollapsebookmarkbar
IniRead, SpeakLang, UHotkey.ini, Initialization, SpeakLang
IniRead, TooltipX, UHotkey.ini, Initialization, TooltipX
IniRead, TooltipY, UHotkey.ini, Initialization, TooltipY
IniRead, IndicatorX, UHotkey.ini, Initialization, IndicatorX
IniRead, IndicatorY, UHotkey.ini, Initialization, IndicatorY
IniRead, mainmonitoris, UHotkey.ini, Initialization, mainmonitoris
IniRead, SuspendGlobalHotkey, UHotkey.ini, Initialization, SuspendGlobalHotkey

if (SuspendGlobalHotkey = 1)
{
    Suspend, On
}
Else
{
    Suspend, Off
}

;# Mute mic by MICName
mic_state := VA_GetMasterMute(MICName)
if(MICName!="")
{
    VA_SetMasterMute(1, MICName)
    ToolTip, Muted Mic already, -30 , 1028, 2
    mic_state = 1
}
Else
{
    mic_state = 0
}

;# Create Mic indicator GUI
Gui, 1: -SysMenu +AlwaysOnTop -Caption +Owner +E0x08000000
if (mic_state = 0)
{
    Gui, 1: Color, 1BFF00
}
Else
{
    Gui, 1: Color, FF0000
}
Gui, 4: -SysMenu +AlwaysOnTop -Caption +Owner +E0x08000000
if (dismic = 1)
{
    Gui, 4: Color, 1BFF00
}
Else if (dismic = 0)
{
    Gui, 4: Color, FF0000
}
Gosub, AcEnableToggleMic
Gosub, AcEnableDiscordMic

;# Start program SplashImage
SplashImage = %A_ScriptDir%\UHotkey Splash.png
if FileExist(SplashImage)
{
    SplashImageGUI(SplashImage, "Center", "Center", 5000, False)
}

;Set Dark Mode
Gui 2:Default
GuiControlGet, Dark_Mode
Gui 2:destroy

;# Dark mode for all UIs
if (Dark_Mode = 1)
{
    Gui, 2: Color, 1E1E1E
    Gui, 2: Font, c0xFFFFFF
    Gui, 3: Color, 1E1E1E
    Gui, 3: Font, c0xFFFFFF
    Gui, 5: Color, 1E1E1E
    Gui, 5: Font, c0xFFFFFF
    Gui, 6: Color, 1E1E1E
    Gui, 6: Font, c0xFFFFFF
}
else
{
    Gui, 2: Color, F0F0F0
    Gui, 2: Font, c0x000000
    Gui, 3: Color, F0F0F0
    Gui, 3: Font, c0x000000
    Gui, 5: Color, F0F0F0
    Gui, 5: Font, c0x000000
    Gui, 6: Color, F0F0F0
    Gui, 6: Font, c0x000000
}

;# --------------------------DailySiteCheckIn---------------------------
if (A_DD != LastRun)
{
    if (DailySiteCheckInBrowser = "Google Chrome") && (DailySiteCheckIn != "")
    {
        Run, C:\Program Files\Google\Chrome\Application\chrome.exe %quote%%DailySiteCheckIn%%quote%,,UseErrorLevel
        ;# Get the date of run program
        LastRun = %A_DD%
    }
    else if (DailySiteCheckInBrowser = "MS Edge") && (DailySiteCheckIn != "")
    {
        Run, C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe %quote%%DailySiteCheckIn%%quote%,,UseErrorLevel
        ;# Get the date of run program
        LastRun = %A_DD%
    }
    else if (DailySiteCheckInBrowser = "Firefox") && (DailySiteCheckIn != "")
    {
        Run, C:\Program Files\Mozilla Firefox\firefox.exe %quote%%DailySiteCheckIn%%quote%,,UseErrorLevel
        ;# Get the date of run program
        LastRun = %A_DD%
    }
    else if (DailySiteCheckInBrowser = "Opera GX") && (DailySiteCheckIn != "")
    {
        Run, C:\Users\%A_UserName%\AppData\Local\Programs\Opera GX\launcher.exe %quote%%DailySiteCheckIn%%quote%,,UseErrorLevel
        ;# Get the date of run program
        LastRun = %A_DD%
    }
    else if (DailySiteCheckInBrowser = "Opera") && (DailySiteCheckIn != "")
    {
        Run, C:\Users\%A_UserName%\AppData\Local\Programs\Opera\launcher.exe %quote%%DailySiteCheckIn%%quote%,,UseErrorLevel
        ;# Get the date of run program
        LastRun = %A_DD%
    }
    else if (DailySiteCheckInBrowser = "Brave") && (DailySiteCheckIn != "")
    {
        Run, C:\Users\%A_UserName%\AppData\Local\BraveSoftware\Brave-Browser\Application\brave.exe %quote%%DailySiteCheckIn%%quote%,,UseErrorLevel
        ;# Get the date of run program
        LastRun = %A_DD%
    }
    Else if (DailySiteCheckInBrowser != "") && (DailySiteCheckIn != "")
    {
        Run, %DailySiteCheckInBrowser% %quote%%DailySiteCheckIn%%quote%,,UseErrorLevel
        ;# Get the date of run program
        LastRun = %A_DD%
    }
    ; if can't run properly
    if (ErrorLevel = "ERROR") && (DailySiteCheckIn != "") && (DailySiteCheckInBrowser != "")
    {
        ToolTip, Error to run browser, %TooltipX%, %TooltipY%, 2
    }
}

;# Save variables to file
gosub, Save

;# Always Loop
SetTimer ,Loop, 5000
return

;# --------------------------Create Main GUI---------------------------
ClickHandler:
CoordMode, Mouse, Screen
MouseGetPos, x5, y5
x6 := x5 -250
y6 := y5 - 600
Goto, LaunchMainUI
return

PgUp & PgDn::
CoordMode, Mouse, Screen
MouseGetPos, x5, y5
x6 := x5 - 250
y6 := y5 - 200

LaunchMainUI:
    ; Check whether the Main UI used to launch?
    if (guimainrun = 0)
    {
        ; Dark theme
        if (Dark_Mode = 1)
        {
            Gui, 2: Color, 1E1E1E
            Gui, 2: Font, c0xFFFFFF
        }
        
        ; Cal the position of UI
        

        ; The Main UI is running
        guimainrun = 1

        ; The Main UI is not hiding right now
        guimainhide = 0

        ;# Elements in the Main UI
        Gui, 2: Add, Groupbox, x3 y1 w210 h210, In the main UI
        Gui, 2: Add, Button, x20 y20 w80 h30 gTurnMonitorOff hWndhBtn1, TurnMonitorOff
            ;if (Dark_Mode = 1)
                ;ImageButton.Create(hBtn1, IBBtnStyles*)
        Gui, 2: Add, Text, x8 y29 w10 h12, 1
        if (TooltipNoti = 0)
        {
            Gui, 2: Add, Button, x20 y50 w80 h30 gAc_TooltipNoti vTooltipNoti hWndhBtn1, Tooltip noti OFF
            ;if (Dark_Mode = 1)
                ;ImageButton.Create(hBtn1, IBBtnStyles*)
        }
        else
        {
            Gui, 2: Add, Button, x20 y50 w80 h30 gAc_TooltipNoti vTooltipNoti hWndhBtn1, Tooltip noti On
            ;if (Dark_Mode = 1)
                ;ImageButton.Create(hBtn1, IBBtnStyles*)
        }
        Gui, 2: Add, Text, x8 y59 w10 h12, 2

        if (SpeakLang = 1)
        {
            Gui, 2: Add, CheckBox, x20 y82 w70 h26 vSpeakLang +Checked gac_SpeakLang,Narrative Language
        }
        else
        {
            Gui, 2: Add, CheckBox, x20 y82 w70 h26 vSpeakLang gac_SpeakLang,Narrative Language
        }

        Gui, 2: Add, Button, x20 y110 w80 h30 gTranslateShow hWndhBtn1, Google translate
        if (Dark_Mode = 1)
            ImageButton.Create(hBtn1, IBBtnStyles*)
        Gui, 2: Add, Text, x8 y119 w10 h12, 4
        Gui, 2: Add, Button, x20 y140 w80 h30 gForgotEntoTh hWndhBtn1,ลืมเปลี่ยนภาษา EngtoTh
        if (Dark_Mode = 1)
            ImageButton.Create(hBtn1, IBBtnStyles*)
        Gui, 2: Add, Text, x8 y149 w10 h12, 5
        Gui, 2: Add, Button, x20 y170 w80 h30 gForgotThtoEn hWndhBtn1,ลืมเปลี่ยนภาษา ThtoEng
        if (Dark_Mode = 1)
            ImageButton.Create(hBtn1, IBBtnStyles*)
        Gui, 2: Add, Text, x8 y179 w10 h12, 6
        Gui, 2: Add, Button, x120 y20 w80 h30 gWindowManager hWndhBtn1, WindowManager
        if (Dark_Mode = 1)
            ImageButton.Create(hBtn1, IBBtnStyles*)
        Gui, 2: Add, Text, x108 y29 w10 h12, 7
        Gui, 2: Add, Button, x120 y50 w80 h30 gSpy hWndhBtn1, Run Spy
        if (Dark_Mode = 1)
            ImageButton.Create(hBtn1, IBBtnStyles*)
        Gui, 2: Add, Text, x108 y59 w10 h12, 8
        Gui, 2: Add, Button, x120 y80 w80 h60 gStopWatch vstopwatchbutt hWndhBtn1, StopWatch
        ;if (Dark_Mode = 1)
            ;ImageButton.Create(hBtn1, IBBtnStyles*)
        if (stopwatchworking = 1)
        {
            Gui, 2: Add, Text, x5 y220 w110 h17 vStopWatchShow,StopWatch is Working
        }
        else
        {
            Gui, 2: Add, Text, x5 y220 w110 h17 vStopWatchShow,StopWatch is disable
        }
        Gui, 2: Add, Text, x220 y374 w350 h17 vTimeIdle,TimeIdleKey : 0 sec, TimeIdleMouse : 0 sec
        if (TimeIdleCheck = 1)
        {
            Gui, 2: Add, CheckBox, x220 y390 w350 h17 vTimeIdleCheck +Checked gac_idle_checking,Idle checking - AutoMuteMic
        }
        else
        {
            Gui, 2: Add, CheckBox, x220 y390 w350 h17 vTimeIdleCheck gac_idle_checking,Idle checking - AutoMuteMic
        }

        if (SuspendGlobalHotkey = 1)
        {
            Gui, 2: Add, CheckBox, x220 y410 w100 h25 vSuspendGlobalHotkey +Checked gAc_SuspendGlobalHotkey,SuspendGlobal`nHotkey
        }
        else
        {
            Gui, 2: Add, CheckBox, x220 y410 w100 h25 vSuspendGlobalHotkey gAc_SuspendGlobalHotkey,SuspendGlobal`nHotkey
        }

        Gui, 2: Add, Button, x120 y140 w80 h30 gResetBackground hWndhBtn1, Reset background
        ;if (Dark_Mode = 1)
            ;ImageButton.Create(hBtn1, IBBtnStyles*)

        if (autocollapsebookmarkbar = 1)
        {
            Gui, 2: Add, Checkbox, x117 y177 w86 h23 +checked gAc_AutoCollapseBookmarkBar vautocollapsebookmarkbar, AutoCollapseBookmarkBar
        }
        else
        {
            Gui, 2: Add, Checkbox, x117 y177 w86 h23 gAc_AutoCollapseBookmarkBar vautocollapsebookmarkbar, AutoCollapseBookmarkBar
        }

        Gui, 2: Add, Groupbox, x220 y1 w250 h146, Toggle Microphone
        
        if (EnableToggleMic=1)
        {
            Gui, 2: Add, Checkbox, x230 y18 w120 h23 +checked gAcEnableToggleMic vEnableToggleMic, Toggle Active Mic
        }
        else
        {
            Gui, 2: Add, Checkbox, x230 y18 w120 h23 gAcEnableToggleMic vEnableToggleMic, Toggle Active Mic
        }

        Gui, 2: Add, Text, x225 y61 w21 h25, RAlt
        Gui, 2: Add, Button, x249 y43 w75 h50 gClickMic vClickMic hWndhBtn1,
        if (Dark_Mode = 1)
            ImageButton.Create(hBtn1, IBBtnStyles*)

        ;# Find list of available microphone(s)
        gosub, FindMicName

        Gui, 2: Add, Text, x227 y97 w55 h15, Mic Name :

        Gui, 2: Add, DropDownList, x230 y112 w230 h100 vMICNameSelectDDL gAc_MICName_Change,%MicName_list%
        GuiControl,2: ChooseString, MICNameSelectDDL, %MICName%

        mic_state := VA_GetMasterMute(MICName)
        if (mic_state = 1)
        {
            GuiControl,2:, ClickMic, Toggle Mode (Mic is OFF)
            GuiControl,2: Disable,MICNameSelectDDL
        }
        else
        {
            GuiControl,2:, ClickMic, Toggle Mode (Mic is ON)
            GuiControl,2: Enable,MICNameSelectDDL
        }

        if (EnablePushtotalk=1)
        {
            Gui, 2: Add, Checkbox, x331 y48 w120 h23 +checked gAcEnablePushtotalk vEnablePushtotalk, Enable Push to talk
        }
        else
        {
            Gui, 2: Add, Checkbox, x331 y48 w120 h23 gAcEnablePushtotalk vEnablePushtotalk, Enable Push to talk
        }

        if (SyncMic=1)
        {
            Gui, 2: Add, Checkbox, x331 y65 w137 h23 +checked gAcSyncMic vSyncMic, SyncDiscordAndPC'sMic
        }
        else
        {
            Gui, 2: Add, Checkbox, x331 y65 w137 h23 gAcSyncMic vSyncMic, SyncDiscordAndPC'sMic
        }
        
        if (EnableDiscordMic=1)
        {
            Gui, 2: Add, Checkbox, x229 y173 w120 h23 +checked gAcEnableDiscordMic vEnableDiscordMic, Discord Mic Indicator
        }
        else
        {
            Gui, 2: Add, Checkbox, x229 y173 w120 h23 gAcEnableDiscordMic vEnableDiscordMic, Discord Mic Indicator
        }

        if (DetectDiscordMic=1)
        {
            Gui, 2: Add, Checkbox, x355 y173 w137 h23 +checked gAcDetectDiscordMic vDetectDiscordMic, DetectDiscordMic
        }
        else
        {
            Gui, 2: Add, Checkbox, x355 y173 w137 h23 gAcDetectDiscordMic vDetectDiscordMic, DetectDiscordMic
        }

        Gui, 2: Add, Groupbox, x220 y150 w250 h60, Toggle Discord Mic
        
        if (A_DD = LastRun)
        {
            Gui, 2: Add, Groupbox, x220 y216 w250 h77, DailySiteCheckIn | Today checked
        }
        Else if (A_DD = LastRun + 1)
        {
            Gui, 2: Add, Groupbox, x220 y216 w250 h77 vDailySiteCheckIn_Text, DailySiteCheckIn | Yesterday is the lastest
        }
        Else
        {
            Gui, 2: Add, Groupbox, x220 y216 w250 h77 vDailySiteCheckIn_Text, DailySiteCheckIn
        }
        
        Gui, 2: Add, Text, x228 y239 w18 h25, Url
        Gui, 2: Add, Edit, x247 y235 w212 h22 vDailySiteCheckIn gAc_DailySiteCheckIn hwndedit1,%DailySiteCheckIn%
        if (Dark_Mode = 1)
            CtlColors.Attach(edit1, "1E1E1E", "FFFFFF")

        Gui, 2: Add, Text, x225 y265 w25 h16, Path
        Gui, 2: Add, Combobox, x247 y261 w212 h100 vDailySiteCheckInBrowser gAc_DailySiteCheckInBrowser hwndedit1,Google Chrome|MS Edge|Firefox|Opera GX|Opera|Brave

        ;Add custom path to list if it doesn't in the list.
        if (DailySiteCheckInBrowser = "Google Chrome") || (DailySiteCheckInBrowser = "MS Edge") || (DailySiteCheckInBrowser = "Firefox") || (DailySiteCheckInBrowser = "Opera GX") || (DailySiteCheckInBrowser = "Opera") || (DailySiteCheckInBrowser = "Brave")
        {}
        Else
        {
            GuiControl,2:, DailySiteCheckInBrowser, %DailySiteCheckInBrowser%
        }
        ;Choose select/custompath
        GuiControl,2: ChooseString, DailySiteCheckInBrowser, %DailySiteCheckInBrowser%

        if (Dark_Mode = 1)
            CtlColors.Attach(edit1, "1E1E1E", "FFFFFF")

        Gui, 2: Add, Button, x470 y1 w30 h30 gTerminateProgram hWndhBtn1, Exit
        if (Dark_Mode = 1)
            ImageButton.Create(hBtn1, IBBtnStyles*)
        Gui 2:Default
        GuiControlGet, MICID

        Gui, 2: Add, Edit, x115 y220 w30 h15 limit4 +Right vGUI_HH gAcGUI_HH hwndedit1,%S_HH%
        if (Dark_Mode = 1)
            CtlColors.Attach(edit1, "1E1E1E", "FFFFFF")
        Gui, 2: Add, Text, x146 y220 w5 h15,:
        Gui, 2: Add, Edit, x150 y220 w18 h15 limit2 vGUI_MM gAcGUI_MM hwndedit1,%S_MM%
        if (Dark_Mode = 1)
            CtlColors.Attach(edit1, "1E1E1E", "FFFFFF")
        Gui, 2: Add, Text, x169 y220 w5 h15,:
        Gui, 2: Add, Edit, x173 y220 w18 h15 limit2 vGUI_SS gAcGUI_SS hwndedit1,%S_SS%
        if (Dark_Mode = 1)
            CtlColors.Attach(edit1, "1E1E1E", "FFFFFF")

        
        if (Dark_Mode =1)
        {
            Gui, 2: Add, Checkbox, x418 y410 w80 h23 +checked gAc_Dark_Mode vDark_Mode, Dark Mode
        }
        else
        {
            Gui, 2: Add, Checkbox, x418 y410 w80 h23 gAc_Dark_Mode vDark_Mode, Dark Mode
        }

        if (NotiPopup =1)
        {
            Gui, 2: Add, Checkbox, x330 y410 w80 h23 +checked gAc_NotiPopup vNotiPopup, NotiPopup
        }
        else
        {
            Gui, 2: Add, Checkbox, x330 y410 w80 h23 gAc_NotiPopup vNotiPopup, NotiPopup
        }

        Gui, 2: Add, Text, x5 y414 w95 h16, Tooltip Location  X:
        Gui, 2: Add, Edit, x102 y413 w40 h15 limit4 vTooltipX gAcTooltipX hwndedit1,%TooltipX%
        if (Dark_Mode = 1)
            CtlColors.Attach(edit1, "1E1E1E", "FFFFFF")
        Gui, 2: Add, Text, x149 y414 w13 h16,Y:
        Gui, 2: Add, Edit, x163 y413 w40 h15 limit4 vTooltipY gAcTooltipY hwndedit1,%TooltipY%
        if (Dark_Mode = 1)
            CtlColors.Attach(edit1, "1E1E1E", "FFFFFF")

        if (TooltipNoti = 0)
        {
            GuiControl,2: Disable,TooltipX
            GuiControl,2: Disable,TooltipY
        }

        Gui, 2: Add, Text, x5 y389 w110 h16, Mic Indicator Lo. X:
        Gui, 2: Add, Edit, x102 y388 w40 h15 limit4 vIndicatorX gAcIndicatorX hwndedit1,%IndicatorX%
        if (Dark_Mode = 1)
            CtlColors.Attach(edit1, "1E1E1E", "FFFFFF")
        Gui, 2: Add, Text, x149 y389 w13 h16,Y:
        Gui, 2: Add, Edit, x163 y388 w40 h15 limit4 vIndicatorY gAcIndicatorY hwndedit1,%IndicatorY%
        if (Dark_Mode = 1)
            CtlColors.Attach(edit1, "1E1E1E", "FFFFFF")

        if (EnableDiscordMic = 0) && (EnableToggleMic = 0)
        {
            GuiControl,2: Disable,IndicatorX
            GuiControl,2: Disable,IndicatorY
        }

        Gui, 2: Add, Link, x10 y360 w110 h17 r1 -wrap, <a href="https://github.com/ChaiyavutC/UniHotkey-AHK-edition">GitHub repository link</a>

        Gui, 2: Show, w500 h440 x%x6% y%y6%, %version%
    }
    else
    {
        Gui, 2: Show, w500 h440 x%x6% y%y6%,

        ; The Main UI is not hiding right now
        guimainhide = 0
    }
return
;-----------------------------------------------------------------------------
;Always Loop
Loop:

;# Check mic's state
if (MICName != "")
    mic_state := VA_GetMasterMute(MICName)

if (guimainhide = 0)
{
    Sec_TimeIdleMou := A_TimeIdleMouse/1000
    Sec_TimeIdleKey := A_TimeIdleKeyboard/1000
    Sec_TimeIdleKey := % Format("{:.3f}",Sec_TimeIdleKey)
    Sec_TimeIdleMou := % Format("{:.3f}",Sec_TimeIdleMou)
    GuiControl,2:, TimeIdle, TimeIdleKey : %Sec_TimeIdleKey% sec, TimeIdleMouse : %Sec_TimeIdleMou% sec
}

;# Check Idle for 2 mins >> Mute mic
if (A_TimeIdleKeyboard > 120000 && A_TimeIdleMouse > 120000 && TimeIdleCheck=1)
{
    count := 5
    centicount := 0
    loop
    {
        centicount := centicount+0.1
        if (centicount >= 1)
        {
            centicount := 0
            ToolTip, Idle mode will TooltipNoti on in %count% s. Move mouse to cancel, %TooltipX%, %TooltipY%, 2
            count := count-1
        }
        sleep 100
        if (A_TimeIdleKeyboard < 120000 || A_TimeIdleMouse < 120000)
        {
            ToolTip,,,,2
            return
        }
        if (count <= 0)
        {
            ToolTip,Idle mode - Mic was muted, %TooltipX%, %TooltipY%, 2
            if (mic_state = 0)
            {
                if (MICName="")
                {
                    MsgBox, Please select Microphone to toggle it in The Main UI.
                    return
                }
                ;# Mute mic by MICName
                if(MICName!="")
                    VA_SetMasterMute(1, MICName)

                if (guimainhide = 0)
                    {
                        GuiControl,2:, ClickMic, Toggle Mode (Mic is OFF by Idle)
                        if (guimainhide = 0)
                        {
                            GuiControl,2: Enable,MICNameSelectDDL
                        }
                    }

                Gui, 1: Color, FF0000
                ;SoundPlay, %A_ScriptDir%\mute.wav
                ;run C:\Program Files (x86)\foobar2000\foobar2000.exe /immediate /play "%A_ScriptDir%\mute.wav" /hide 
                mic_state = 1
                break
            }
            loop 
            {
                sleep 4980
                if (guimainrun = 0)
                {
                    Sec_TimeIdleMou := A_TimeIdleMouse/1000
                    Sec_TimeIdleKey := A_TimeIdleKeyboard/1000
                    Sec_TimeIdleKey := % Format("{:.3f}",Sec_TimeIdleKey)
                    Sec_TimeIdleMou := % Format("{:.3f}",Sec_TimeIdleMou)
                    GuiControl,2:, TimeIdle, TimeIdleKey : %Sec_TimeIdleKey% sec, TimeIdleMouse : %Sec_TimeIdleMou% sec
                }
                if (A_TimeIdleKeyboard < 120000 || A_TimeIdleMouse < 120000)
                {
                    ToolTip,,,,2
                    break
                }
            }
        }
    }
}

;# Temporary hide TooltipNoti (Supports custom TooltipNoti position)
MouseGetPos, MToHideToolX, MToHideToolY
If ( Abs(MToHideToolX-TooltipX) < 50 && Abs(MToHideToolY-TooltipY) < 20 )
{
    ToolTip,Hide,%TooltipX%,%TooltipY%, 2
    sleep 100
    ToolTip,,,,2
}

;# Temporary hide Indicators (Supports custom Indicator position)

if(Abs(MToHideToolX-IndicatorX) < 10) && (Abs(MToHideToolY-IndicatorY) < 10)
{
    Gui, 1: -AlwaysOnTop
    Gui, 4: -AlwaysOnTop
    WinSet, Bottom,,WindowMute NoActivate
    WinSet, Bottom,,DiscordMute NoActivate
}
Else
{
    if (EnableToggleMic = 1) || (EnableDiscordMic = 1)
        Settimer, MicIndicatorOnTop, 1
}

if (TooltipNoti = 0) and (WaitForReturnTooltipNoti = 0)
        return

;Check Window or Full screen https://www.autohotkey.com/board/topic/38882-detect-fullscreen-application/
IfWinNotActive, ahk_class WorkerW
{
    activeWindow := WinActive("A")
    if activeWindow = 0
    {
        return
    }
    WinGetPos, x, y, width, height, ahk_id %activeWindow%

    xmid := x+(width/2)
    ymid := y+(height/2)

    if (WaitForReturnTooltipNoti = 1)
    {
        isFullScreen := isWindowFullScreen( "A" )
    }

    ;Right monitor is main
    if (WaitForReturnTooltipNoti = 0) and (xmid < 0) and (mainmonitoris = "Right Monitor") ;at left monitor
    {
        isFullScreen := isWindowFullScreen( "A" )
        if isFullScreen = 1
        {
            ToolTip,,,,2
            WaitForReturnTooltipNoti = 1
            TooltipNoti = 0
            GuiControl,2:, TooltipNoti, Tooltip noti OFF
        }
    }
    ;Left monitor is main
    else if (WaitForReturnTooltipNoti = 0) and (xmid > leftMonitorWidth) and (mainmonitoris = "Left Monitor") ;at right monitor
        {
            isFullScreen := isWindowFullScreen( "A" )
            if isFullScreen = 1
            {
                ToolTip,,,,2
                WaitForReturnTooltipNoti = 1
                TooltipNoti = 0
                GuiControl,2:, TooltipNoti, Tooltip noti OFF
            }
        }
    
    else if (WaitForReturnTooltipNoti = 1) and ( xmid > 0 || isFullScreen = 0 )
    {
        WaitForReturnTooltipNoti = 0
        TooltipNoti = 1
        GuiControl,2:, TooltipNoti, Tooltip noti On
        SetTimer, CheckLangAgain, 10
    }
}
Return

isWindowFullScreen( winTitle ) {
	;checks if the specified window is full screen
	
	winID := WinExist( winTitle )

	If ( !winID )
		Return false

	WinGet style, Style, ahk_id %WinID%
	WinGetPos ,,,winW,winH, %winTitle%
	; 0x800000 is WS_BORDER.
	; 0x20000000 is WS_MINIMIZE.
	; no border and not minimized
	Return ((style & 0x20800000) or winH < A_ScreenHeight or winW < A_ScreenWidth) ? false : true
}
;-----------------------------------------------------------------------------
Ac_rightMonitorHeight:
Gui 7:Default
GuiControlGet, rightMonitorHeight
return

Ac_rightMonitorWidth:
Gui 7:Default
GuiControlGet, rightMonitorWidth
return

Ac_leftMonitorHeight:
Gui 7:Default
GuiControlGet, leftMonitorHeight
return

Ac_leftMonitorWidth:
Gui 7:Default
GuiControlGet, leftMonitorWidth
return

Ac_mainmonitoris:
Gui 7:Default
GuiControlGet, mainmonitoris
Return

Ac_FinishGetMonitorsInfo:
if (rightMonitorHeight = "") || (rightMonitorWidth = "") || (leftMonitorHeight = "") || (leftMonitorWidth = "") || (mainmonitoris = "")
{
    MsgBox, Make sure you provide all info.
}
Else
{
    Msgbox, You can press PageUp + PageDown or right click icon at tray icon to launch the Main UI
    Gui 7:Destroy
}
Gosub, Save
return

TerminateProgram:
;# Mute mic by MICName
if(MICName!="")
{
    VA_SetMasterMute(0, MICName)
    mic_state = 0
}
gosub, Save
exitapp
return

Ac_MICName_Change:
Gui 2:Default
GuiControlGet, selectedValue, , MICNameSelectDDL
MICName := selectedValue
Gosub, Save
return

;# Save variables to file
Save:
    Gui, Submit, NoHide
    FileDelete, UHotkey.ini
    FileAppend, 
    (
    [Initialization]
        LastRun=%LastRun%
        MICName=%MICName%
        TooltipNoti=%TooltipNoti%
        dismic=%dismic%
        Dark_Mode=%Dark_Mode%
        NotiPopup=%NotiPopup%
        DailySiteCheckIn=%DailySiteCheckIn%
        DailySiteCheckInBrowser=%DailySiteCheckInBrowser%
        DetectDiscordMic=%DetectDiscordMic%
        TimeIdleCheck=%TimeIdleCheck%
        SyncMic=%SyncMic%
        EnablePushtotalk=%EnablePushtotalk%
        leftMonitorWidth=%leftMonitorWidth%
        leftMonitorHeight=%leftMonitorHeight%
        rightMonitorWidth=%rightMonitorWidth%
        rightMonitorHeight=%rightMonitorHeight%
        EnableToggleMic=%EnableToggleMic%
        EnableDiscordMic=%EnableDiscordMic%
        autocollapsebookmarkbar=%autocollapsebookmarkbar%
        SpeakLang=%SpeakLang%
        TooltipX=%TooltipX%
        TooltipY=%TooltipY%
        IndicatorX=%IndicatorX%
        IndicatorY=%IndicatorY%
        mainmonitoris=%mainmonitoris%
        SuspendGlobalHotkey=%SuspendGlobalHotkey%
    ), UHotkey.ini
return

Ac_NotiPopup:
Gui 2:Default
GuiControlGet, NotiPopup
Gosub, Save
return

Ac_Dark_Mode:
    Gui 2:Default
    GuiControlGet, Dark_Mode
    Gui 2:destroy

    if (Dark_Mode = 1)
    {
        Gui, 2: Color, 1E1E1E
        Gui, 2: Font, c0xFFFFFF
        Gui, 3: Color, 1E1E1E
        Gui, 3: Font, c0xFFFFFF
        Gui, 5: Color, 1E1E1E
        Gui, 5: Font, c0xFFFFFF
        Gui, 6: Color, 1E1E1E
        Gui, 6: Font, c0xFFFFFF
    }
    else
    {
        Gui, 2: Color, F0F0F0
        Gui, 2: Font, c0x000000
        Gui, 3: Color, F0F0F0
        Gui, 3: Font, c0x000000
        Gui, 5: Color, F0F0F0
        Gui, 5: Font, c0x000000
        Gui, 6: Color, F0F0F0
        Gui, 6: Font, c0x000000
    }
    guimainrun = 0
    Gosub, Save
return

ac_idle_checking:
    Gui 2:Default
    GuiControlGet, TimeIdleCheck
    Gosub, Save
return

Ac_SuspendGlobalHotkey:
    Gui 2:Default
    GuiControlGet, SuspendGlobalHotkey
    Gosub, Save
    if (SuspendGlobalHotkey = 1)
    {
        Suspend, On
    }
    Else
    {
        Suspend, Off
    }
return

Ac_AutoCollapseBookmarkBar:
    Gui 2:Default
    GuiControlGet, autocollapsebookmarkbar
    if (SuspendGlobalHotkey = 1)
        MsgBox, Suspend Global Hotkey is on this feature will not working.
    Gosub, Save
return

AcSyncMic:
    Gui 2:Default
    GuiControlGet, SyncMic
    Gosub, Save
return

AcEnableToggleMic:
    Gui 2:Default
    GuiControlGet, EnableToggleMic
    if (EnableToggleMic=0)
        {
            if (guimainhide = 0)
            {
            GuiControl,2: Disable,EnablePushtotalk
            GuiControl,2: Disable,SyncMic
            GuiControl,2: Disable,ClickMic
            GuiControl,2: Disable,MICNameSelectDDL
            Gui, 1: Hide
            if (EnableDiscordMic=0)
                {
                    GuiControl,2: Disable,IndicatorX
                    GuiControl,2: Disable,IndicatorY
                }
            }
        }
        Else
        {
            if (guimainhide = 0)
            {
            GuiControl,2: Enable,EnablePushtotalk
            GuiControl,2: Enable,SyncMic
            GuiControl,2: Enable,ClickMic
            GuiControl,2: Enable,IndicatorX
            GuiControl,2: Enable,IndicatorY
            }
            Gui, 1: Show, x%IndicatorX% y%IndicatorY% w8 h4, WindowMute NoActivate
            if (mic_state=0)
                GuiControl,2: Enable,MICNameSelectDDL
            
        }
        Gosub, Save
return

AcEnablePushtotalk:
    Gui 2:Default
    GuiControlGet, EnablePushtotalk
    Gosub, Save
return

AcDetectDiscordMic:
    Gui 2:Default
    GuiControlGet, DetectDiscordMic
    if (SuspendGlobalHotkey = 1)
        MsgBox, Suspend Global Hotkey is on this feature will not working.
    Gosub, Save
return

AcEnableDiscordMic:
Gui 2:Default
GuiControlGet, EnableDiscordMic
if (EnableDiscordMic=0)
    {
        if (guimainhide = 0)
        {
            GuiControl,2: Disable,DetectDiscordMic
            if (EnableToggleMic=0)
            {
                GuiControl,2: Disable,IndicatorX
                GuiControl,2: Disable,IndicatorY
            }
        }
        Gui, 4: Hide

        
    }
Else
    {
        if (guimainhide = 0)
        {
        GuiControl,2: Enable,DetectDiscordMic
        GuiControl,2: Enable,IndicatorX
        GuiControl,2: Enable,IndicatorY
        }
        IndicatorY2 := IndicatorY-4
        Gui, 4: Show, x%IndicatorX% y%IndicatorY2% w8 h2, DiscordMute NoActivate
    }
    Gosub, Save
return

Ac_DailySiteCheckIn:
    Gui 2:Default
    GuiControlGet, DailySiteCheckIn
    Gosub, Save
return

Ac_DailySiteCheckInBrowser:
    Gui 2:Default
    GuiControlGet, DailySiteCheckIn
    Gosub, Save
return

ac_SpeakLang:
Gui 2:Default
GuiControlGet, SpeakLang
Gosub, Save
return

AcTooltipX:
Gui 2:Default
GuiControlGet, TooltipX
Gosub, Save
return

AcTooltipY:
Gui 2:Default
GuiControlGet, TooltipY
Gosub, Save
return

AcIndicatorX:
Gui 2:Default
GuiControlGet, IndicatorX
Gosub, Save
return

AcIndicatorY:
Gui 2:Default
GuiControlGet, IndicatorY
Gosub, Save
return

StopWatch:
    if (SuspendGlobalHotkey=1)
    {
        MsgBox, Please %comma% Enable Global Hotkey to use this feature
        return
    }
    if (enablestopwatch = 0 && stopwatchworking = 0)
    {
        GuiControl,2:, stopwatchbutt,StopWtach is detecting
        enablestopwatch = 1
        Tooltip, Leftclick to start stopwatch	
    }
    else if(stopwatchworking = 1) ;คลิกอที่ปุ่มเพื่อหยุด StopWatch
    {
        GuiControl,2:, stopwatchbutt,StopWtach was stopped
        stopwatchworking = 0
        sleep 1000
        GuiControl,2:, GUI_HH,0
        GuiControl,2:, GUI_MM,00
        GuiControl,2:, GUI_SS,00
    }
return

AcGUI_SS:
    Gui 2:Default
    GuiControlGet, GUI_SS
    S_SS := GUI_SS
return

AcGUI_MM:
    Gui 2:Default
    GuiControlGet, GUI_MM
    S_MM := GUI_MM
return

AcGUI_HH:
    Gui 2:Default
    GuiControlGet, GUI_HH
    S_HH := GUI_HH
return

ResetBackground:
    WinMove, ahk_class WorkerW, , -1928, -128
return

WindowManager:
    if FileExist("%A_ScriptDir%\List open windows to quickly select v.2.3.ahk")
        Run, %A_ScriptDir%\List open windows to quickly select v.2.3.ahk
    Else
        Msgbox, Sorry, File name "List open windows to quickly select v.2.3.ahk" is not exist.
return

TranslateShow:
    if FileExist("%A_ScriptDir%\Auto Google translate v.4.exe")
        Run, %A_ScriptDir%\Auto Google translate v.4.exe
    Else
        Msgbox, Sorry, File name "Auto Google translate v.4.exe" is not exist.
return

Spy:
    if FileExist("%A_ScriptDir%\Spy v.1.1.ahk")
        Run, %A_ScriptDir%\Spy v.1.1.ahk
    Else
        Msgbox, Sorry, File name "Spy v.1.1.ahk" is not exist.
return

TurnMonitorOff:
count := 5000
sleep 300
    loop {
        if (A_TimeIdleKeyboard > 5000 && A_TimeIdleMouse > 5000)
        {
            Break
        }
        else if (A_TimeIdleKeyboard < 260 || A_TimeIdleMouse < 260)
        {
            SplashTextOff
            return
        }
        
        if (A_TimeIdleKeyboard > A_TimeIdleMouse)
        {
            countshow := count-A_TimeIdleMouse
        }
        Else
        {
            countshow := count-A_TimeIdleKeyboard
        }
        countshow := countshow/1000
        countshow := % Format("{:.2f}",countshow)
        SplashTextOn,200,40, Screens will turn off in %countshow% s., Move mouse and press any key to cancel
        sleep 230
    }

    Gui 2:hide

    ; The Main UI is hiding right now
    guimainhide = 1
    ; Send command to off monitor(s)
    SendMessage, 0x112, 0xF170, 2,, Program Manager

    ; Check if Mic is ON change it to OFF
    if (mic_state = 0) && (MICName!="")
    {
        ;# Mute mic by MICName
        VA_SetMasterMute(1, MICName)
        mic_state = 1

        Gui, 1: Color, FF0000
    }
    SplashTextOff
Return

Ac_TooltipNoti:
    if (TooltipNoti = 1)
    {
        TooltipNoti = 0
        ToolTip , , , , 2
        GuiControl,2:, TooltipNoti, Tooltip noti OFF
        if (guimainhide = 0)
        {
            GuiControl,2: Disable, SpeakLang
            GuiControl,2: Disable, TooltipX
            GuiControl,2: Disable, TooltipY
        }
    }
    else
    {
        TooltipNoti = 1
        GuiControl,2:, TooltipNoti, Tooltip noti On
        if (guimainhide = 0)
        {
            GuiControl,2: Enable, SpeakLang
            GuiControl,2: Enable, TooltipX
            GuiControl,2: Enable, TooltipY
        }
    }
return

2GuiEscape:
2GuiClose:
    Gui 2:hide
    guimainrun = 1
    guimainhide = 1
    gosub, save
    Tooltip, Universal Hotkey will working in background.
    sleep 1000
    Tooltip,
return

OnClipboardChange:
if (TooltipNoti = 0)
    return

if (TooltipX = "") || (TooltipY = "")
    return

if A_EventInfo = 2 ; Clipboard contains something entirely non-text such as a picture.
{
    ToolTip,Copied non-text,%TooltipX%, %TooltipY%, 2
}
else if A_EventInfo = 1 ;Clipboard contains something that can be expressed as text (this includes files copied from an Explorer window).
{
    StringReplace, ClipboardShow, Clipboard,`r`n,%A_Space%, All
    StringReplace, ClipboardShow, ClipboardShow,`n,%A_Space%, All
    StringLen, Length, ClipboardShow
    ClipboardShowS := SubStr( ClipboardShow, 1, 40 )
    ClipboardShowL := SubStr( ClipboardShow, -10)
    if (Length < 55)
    {
        ToolTip,Copied %quote%%ClipboardShow%%quote%,%TooltipX%, %TooltipY%, 2
    }
    Else{
        ClipboardShow = %quote%%ClipboardShowS% %A_Space%...%A_Space% %ClipboardShowL%%quote%
        ToolTip,Copied %ClipboardShow%,%TooltipX%, %TooltipY%, 2
    }
}
else if (Clipboard = "")
{
    if (ClearClipHistoryWhenPasswordManagerAutoclearclipboard = 1)
    {
        ToolTip,Plz clear clipboard History,%TooltipX%, %TooltipY%, 2
    }
    Else
    {
        ToolTip,Clipboard%apostrophe%s empty.,%TooltipX%, %TooltipY%, 2
    }
}
SetTimer, CheckLangAgain,10000
return

CheckLangAgain:
if (TooltipNoti = 0)
{
    ToolTip ,,,, 2
    return
}

if !LangID := GetKeyboardLanguage(WinActive("A"))
{
    Tooltip, Failed, %TooltipX%, %TooltipY%, 2
    return
}

if (LangID = 0x041e) ;ภาษาไทย
{
    if (TooltipNoti = 1)
    {
        ToolTip , ไทย, %TooltipX%, %TooltipY%, 2
    }
}
else if (LangID = 0x0409) ;ภาษาอังกฤษ
{
    if (TooltipNoti = 1)
    {
        ToolTip , ENG, %TooltipX%, %TooltipY%, 2
    }
}
else if (LangID = 0x0411) ;JP
{
    if (TooltipNoti = 1)
    {
        ToolTip , JP, %TooltipX%, %TooltipY%, 2
    }
}
SetTimer, CheckLangAgain,OFF
return


;Decrease Vol
Insert::
    Send {Volume_Down}
    /*
    process, exist, AudioRelay.exe
    if errorlevel
    { 
        SoundGet, master_volume

        run "D:\Ice (PC)\EXE\SoundVolumeView\SoundVolumeView.exe" /SetVolume "AudioRelay.Backend" %master_volume%
        if (ErrorLevel != "ERROR")
            return

        master_volume := % Format("{:.0f}",master_volume)
        ;Tooltip, %master_volume%
        setWindowVol("ahk_exe audiorelay-backend.exe",master_volume)
        setWindowVol("ahk_exe AudioRelay.exe",master_volume)
    }
    */
return

;Increase vol
Pause::
    Send {Volume_Up}
    /*
    process, exist, AudioRelay.exe
    if errorlevel
    {
        SoundGet, master_volume
        
        run "D:\Ice (PC)\EXE\SoundVolumeView\SoundVolumeView.exe" /SetVolume "AudioRelay.Backend" %master_volume%
        if (ErrorLevel != "ERROR")
            return

        master_volume := % Format("{:.0f}",master_volume)
        ;Tooltip, %master_volume%
        setWindowVol("ahk_exe audiorelay-backend.exe",master_volume)
        setWindowVol("ahk_exe AudioRelay.exe",master_volume)
    }
    */
return

;Mute Unmute System Mic

*RAlt::
ClickMic:
if (EnableToggleMic = 1)
{
    if (mic_state = 1) ;ถ้าไมค์ปิดอยู่ให้เปิด
    {
        SetTimer, UnmuteMic, 1
        SetTimer, MakesureMicrophonewasmuted, OFF
    }
    else if (mic_state = 0) ;ถ้าไมค์เปิดอยู่ให้เปิด
    {
        SetTimer, muteMic, 1
        ;Make sure Microphone was muted
        SetTimer, MakesureMicrophonewasmuted, 5001
    }
}
return

UnmuteMic:
    if (MICName="")
    {
        MsgBox, Please select Microphone to toggle it in The Main UI.
        SetTimer, UnmuteMic, OFF
        return
    }
    ;# Unute mic by MICName
    VA_SetMasterMute(0, MICName)
    mic_state = 0 ;ไมค์เปิดแล้ว

    SoundPlay, %A_ScriptDir%\unmute.wav
    Gui, 1: Color, 1BFF00
    if (mic_state = dismic && SyncMic=1)
    {
        send, {RCtrl}
        Gui, 4: Color, 1BFF00
        dismic = 1
    }
    
    if (guimainhide = 0)
    {
        GuiControl,2:, ClickMic, Toggle Mode (Mic is ON)
        GuiControl,2: Enable,MICNameSelectDDL
    }
    if (EnablePushtotalk = 1)
    {
        keywait, RAlt, t.2
        if (errorlevel = "1")
        {
            if (guimainhide = 0)
            {
                GuiControl,2:, ClickMic, PushToTalk Mode (Mic is ON)
            }
            mic_state = 2
            if (SyncMic=1)
                dismic = 1
            loop
            {
                sleep 2
                If !GetKeyState("RAlt","P")
                    Break
            }
                VA_SetMasterMute(1, MICName)
            
            SoundPlay, %A_ScriptDir%\mute.wav
            Gui, 1: Color, FF0000
            if (dismic = 1 && SyncMic=1)
            {
                send, {RCtrl}
                Gui, 4: Color, FF0000
                dismic = 0
            }
            if (guimainhide = 0)
            {
                GuiControl,2:, ClickMic, Toggle Mode (Mic is OFF)
                GuiControl,2: Disable,MICNameSelectDDL
            }
            mic_state = 1
        }
    }
    SetTimer, UnmuteMic, OFF
return

muteMic:
    if (MICName="")
    {
        MsgBox, Please select Microphone to toggle it in The Main UI.
        SetTimer, muteMic, OFF
        return
    }
    ;# Mute mic by MICName
    VA_SetMasterMute(1, MICName)
    mic_state = 1 ;ไมค์ปิดแล้ว
    
    SoundPlay, %A_ScriptDir%\mute.wav
    Gui, 1: Color, FF0000
    if (mic_state = dismic && SyncMic=1)
    {
        send, {RCtrl}
        Gui, 4: Color, FF0000
        dismic = 0
    }
    
    if (guimainhide = 0)
    {
        GuiControl,2:, ClickMic, Toggle Mode (Mic is OFF)
        GuiControl,2: Disable,MICNameSelectDDL
    }
    SetTimer, muteMic, OFF
return

MicIndicatorOnTop:
if (EnableToggleMic=1)
{
    Gui, 1:+AlwaysOnTop
    WinMove, WindowMute, , %IndicatorX%,%IndicatorY%
}
if (EnableDiscordMic=1)
{
    Gui, 4:+AlwaysOnTop
    IndicatorY2 := IndicatorY-4
    WinMove, DiscordMute, , %IndicatorX%,%IndicatorY2%
}
SetTimer, MicIndicatorOnTop, OFF
return

MakesureMicrophonewasmuted:
if(mic_state = 0) && (MICName !="") && !GetKeyState("RAlt","P")
{
    VA_SetMasterMute(1, MICName)
    mic_state = 1 ;ไมค์ปิดแล้ว
    MsgBox, The microphone is not muted by the action. Check related programs. (Now, Mute command has sent again.)
}
SetTimer, MakesureMicrophonewasmuted, OFF
return

!+b::
    WinSet, Bottom,,A
return

;Fast Line capture
!+w::
IfWinExist, LINE ahk_class Qt5152QWindowIcon
{
    WinGet, LineShow, MinMax, ahk_class Qt5152QWindowIcon

    ;ถ้า minimized
    if (LineShow = -1)
    {
        WinRestore, ahk_exe LINE.exe
    }
    WinActivate, ahk_exe LINE.exe
    WinGetPos, x, y, width, height, LINE
    height := height - 151
    ControlClick, x32 y%height%, ahk_class Qt5152QWindowIcon,,,, NA
    if (LineShow = -1)
    {
        WinMinimize, ahk_class Qt5152QWindowIcon
    }
}
Else
{
    ToolTip,Line not exist, %TooltipX%, %TooltipY%, 2
    SetTimer, CheckLangAgain, 5000
}
return

;Fast Note GUI
!+m::
    CoordMode, Mouse, Screen
    MouseGetPos, x5, y5
    x6 := x5 - 200
    y6 := y5 - 100
    YYYY := A_YYYY
    MM := A_MM
    DD := A_DD
    Hour := A_Hour
    Min := A_Min
    Sec := A_Sec
    if (stopwatchworking =1)
    {
        F_HH := S_HH
        F_MM := S_MM
        F_SS := S_SS
        StopWatchToFile=StopWatch%F_HH%.%F_MM%.%F_SS%
        StopWatchToFile=" "%StopWatchToFile%
    }
    else if (stopwatchworking = 0)
    {
        StopWatchToFile :=""
    }
    if (gui5 = 0)
    {
        gui5 = 1
        if (Dark_Mode = 1)
        {
            Gui, 5: Color, 1E1E1E
            Gui, 5: Font, c0xFFFFFF
        }
        FastNoteChapter=0
        Gui,5: Add, Edit, x5 y5 w520 h33 +0x200 +ReadOnly +Multi vFastNoteIntruc hwndedit1, Enter your note, Text will be save to your desktop with this name "%YYYY%-%MM%-%DD% %Hour%.%Min%.%Sec% %FastNoteSubject%%StopWatchToFile%.txt/.png"
        if (Dark_Mode = 1)
            CtlColors.Attach(edit1, "1E1E1E", "FFFFFF")
        Gui,5: Add, Text, x5 y44 w45 h23 +0x200, Subject : 
        Gui,5: Add, Text, x5 y65 w46 h23 +0x200, Text : 
        Gui,5: Add, Edit, x50 y45 w475 h21 limit75 vFastNoteSubject gFastNoteSubjectedit hwndedit1,%FastNoteSubject%
        if (Dark_Mode = 1)
        CtlColors.Attach(edit1, "1E1E1E", "FFFFFF")
        Gui,5: Add, Edit, x5 y88 w520 h195 vNote hwndedit1,%Note%
        if (Dark_Mode = 1)
        CtlColors.Attach(edit1, "1E1E1E", "FFFFFF")
        Gui,5: Add, Button, x10 y296 w70 h23 gFastNoteTimeStamp hWndhBtn1, Time Stamp
        if (Dark_Mode = 1)
        ImageButton.Create(hBtn1, IBBtnStyles*)
        Gui,5: Add, Button, x90 y296 w103 h23 gFastNoteTimeMKV hWndhBtn1, MKV | AddChapter =
        if (Dark_Mode = 1)
        ImageButton.Create(hBtn1, IBBtnStyles*)
        Gui,5: Add, Edit, x193 y297 w20 h20 vFastNoteChapter hwndedit1,%FastNoteChapter%
        if (Dark_Mode = 1)
        CtlColors.Attach(edit1, "1E1E1E", "FFFFFF")
        Gui,5: Add, Button, x220 y296 w40 h23 gFastNoteTimeEndMKV hWndhBtn1, End MKV
        if (Dark_Mode = 1)
        ImageButton.Create(hBtn1, IBBtnStyles*)
        Gui,5: Add, Button, x275 y296 w70 h23 gFastNoteTimeYT hWndhBtn1, Youtube
        if (Dark_Mode = 1)
        ImageButton.Create(hBtn1, IBBtnStyles*)
        Gui,5: Add, Button, x470 y296 w50 h23 gFastNoteTab hWndhBtn1, Tab
        if (Dark_Mode = 1)
        ImageButton.Create(hBtn1, IBBtnStyles*)
        Gui,5: Add, Button, x104 y326 w80 h23 vFastNoteOk gFastNoteOk hWndhBtn1, OK
        if (Dark_Mode = 1)
        ImageButton.Create(hBtn1, IBBtnStyles*)
        Gui,5: Add, Button, x360 y326 w80 h23 gFastNoteCancel hWndhBtn1, Cancel
        if (Dark_Mode = 1)
        ImageButton.Create(hBtn1, IBBtnStyles*)
        Gui,5: Add, Checkbox , x190 y326 w80 h23 vFastNoteScShot gAcFastNoteScShot, Screenshot while OK?
        Gui,5: Add, Checkbox , x270 y326 w80 h23 vVaFastNoteStopWatch gFastNoteStopWatch +Checked, StopWatchTime?
        Gui, 5: Show, w530 h360 x%x6% y%y6%, Fast Note Text
        if (FastNoteSubject = "")
            GuiControl,5:focus,FastNoteSubject
        else
            GuiControl,5:focus,Note
    }
    else
    {
        CoordMode, Mouse, Screen
        MouseGetPos, x5, y5
        x6 := x5 - 200
        y6 := y5 - 100
        Gui, 5: Show, w530 h360 x%x6% y%y6%, Fast Note Text
        if (FastNoteSubject = "")
            GuiControl,5:focus,FastNoteSubject
        else
            GuiControl,5:focus,Note
    }
return

FastNoteTab:
    Gui, Submit, NoHide
    Gui 5:Default
    GuiControlGet, Note
    Note = %Note%`t.
    GuiControl,5:, Note, %Note%
    GuiControl,5:focus,Note
    send, ^{end}
return


FastNoteTimeStamp:
    Gui, Submit, NoHide
    Gui 5:Default
    GuiControlGet, Note
    if (stopwatchworking =1)
    {
        Note = %Note%`n[%A_YYYY%/%A_MM%/%A_DD% %A_Hour%:%A_Min%:%A_Sec% | StopWatch : %S_HH%:%S_MM%:%S_SS%]`n
    }
    else
    {
        Note = %Note%`n[%A_YYYY%/%A_MM%/%A_DD% %A_Hour%:%A_Min%:%A_Sec%]`n
    }
    GuiControl,5:, Note, %Note%
    GuiControl,5:focus,Note
    send, ^{end}
return

FastNoteTimeEndMKV:
    Gui, Submit, NoHide
    Gui 5:Default
    GuiControlGet, Note
    Note = %Note%`n`t</EditionEntry>`n</Chapters>
    GuiControl,5:, Note, %Note%
    GuiControl,5:focus,Note
    send, ^{end}
return

FastNoteTimeMKV:
    Gui, Submit, NoHide
    Gui 5:Default
    GuiControlGet, FastNoteChapter
    GuiControlGet, Note
    if (FastNoteChapter = 0)
    {
        Note = %Note%<?xml version="1.0" encoding="ISO-8859-1"?>`n<!DOCTYPE Chapters SYSTEM "matroskachapters.dtd">`n`n<Chapters>`n`t<EditionEntry>
    }
    else
    {
        S_HH:=SubStr("00" . S_HH,-1)
        Note = %Note%`n`t`t<ChapterAtom>`n`t`t`t<ChapterTimeStart>%S_HH%:%S_MM%:%S_SS%.000</ChapterTimeStart>`n`t`t`t<ChapterDisplay>`n`t`t`t`t<ChapterString>Chapter %FastNoteChapter%</ChapterString>`n`t`t`t`t <ChapterLanguage>eng</ChapterLanguage>`n`t`t`t</ChapterDisplay>`n`t`t</ChapterAtom>
    }
    FastNoteChapter := FastNoteChapter +1
    GuiControl,5:, FastNoteChapter, %FastNoteChapter%
    GuiControl,5:, Note, %Note%
    GuiControl,5:focus,Note
    send, ^{end}
return

FastNoteTimeYT:
    Gui, Submit, NoHide
    Gui 5:Default
    GuiControlGet, Note

    if (S_HH > 0) && (Note !="")
    {
        Note = %Note%`n%S_HH%:%S_MM%:%S_SS%
    }
    else if (Note !="")
    {
        Note = %Note%`n%S_MM%:%S_SS%
    }
    Else
    {
        Note = %S_MM%:%S_SS%
    }

    GuiControl,5:, Note, %Note%
    GuiControl,5:focus,Note
    send, ^{end}
    send, {Space}
return

FastNoteOk:
    Gui, Submit, NoHide
    Gui 5:Default
    GuiControlGet, Note
    GuiControlGet, FastNoteSubject
    GuiControlGet, FastNoteScShot
    if (!FileExist("%A_Desktop%\UHotkey")) 
    {
        FileCreateDir,%A_Desktop%\UHotkey
    }
    if (FastNoteScShot=1)
    {
        ScreenshotFile=%A_Desktop%\UHotkey\%YYYY%-%MM%-%DD% %Hour%.%Min%.%Sec% %FastNoteSubject%%StopWatchToFile%.png
        TakeScreenshot(ScreenshotFile)
    }
    FileAppend,
    (
    %Note%
    ), %A_Desktop%\UHotkey\%YYYY%-%MM%-%DD% %Hour%.%Min%.%Sec% %FastNoteSubject%%StopWatchToFile%.txt
    Gui 5:destroy
    gui5 = 0
return

FastNoteCancel:
5GuiEscape:
5GuiClose:
    GuiControlGet, Note
    GuiControlGet, FastNoteSubject
    Gui 5:destroy
    gui5 = 0
return

FastNoteStopWatch:
    Gui 5:Default
    GuiControlGet, VaFastNoteStopWatch
    GuiControlGet, FastNoteScShot
    if (VaFastNoteStopWatch=1 && stopwatchworking =1)
    {
        if (FastNoteScShot=1)
        {
            StopWatchToFile =StopWatch%F_HH%.%F_MM%.%F_SS%
            StopWatchToFile =" "%StopWatchToFile%
            GuiControl,5:, FastNoteIntruc, Enter your note, Text and Screenshot will be save to your desktop with this name "%YYYY%-%MM%-%DD% %Hour%.%Min%.%Sec% %FastNoteSubject%%StopWatchToFile%.txt/.png"
        }
        else
        {
            StopWatchToFile =StopWatch%F_HH%.%F_MM%.%F_SS%
            StopWatchToFile =" "%StopWatchToFile%
            GuiControl,5:, FastNoteIntruc, Enter your note, Text will be save to your desktop with this name "%YYYY%-%MM%-%DD% %Hour%.%Min%.%Sec% %FastNoteSubject%%StopWatchToFile%.txt/.png"
        }
    }
    else
    {
        StopWatchToFile := ""
        if (FastNoteScShot=1)
        {
            GuiControl,5:, FastNoteIntruc, Enter your note, Text and Screenshot will be save to your desktop with this name "%YYYY%-%MM%-%DD% %Hour%.%Min%.%Sec% %FastNoteSubject%%StopWatchToFile%.txt/.png"
        }
        else
        {
            GuiControl,5:, FastNoteIntruc, Enter your note, Text will be save to your desktop with this name "%YYYY%-%MM%-%DD% %Hour%.%Min%.%Sec% %FastNoteSubject%%StopWatchToFile%.txt/.png"
        }
    }
return

AcFastNoteScShot:
FastNoteSubjectedit:
    Gui 5:Default
    GuiControlGet, FastNoteSubject
    GuiControlGet, FastNoteScShot
    if (FastNoteScShot=1)
    {
        GuiControl,5:, FastNoteIntruc, Enter your note, Text and Screenshot will be save to your desktop with this name "%YYYY%-%MM%-%DD% %Hour%.%Min%.%Sec% %FastNoteSubject%%StopWatchToFile%.txt/.png"
    }
    else
    {
        GuiControl,5:, FastNoteIntruc, Enter your note, Text will be save to your desktop with this name "%YYYY%-%MM%-%DD% %Hour%.%Min%.%Sec% %FastNoteSubject%%StopWatchToFile%.txt/.png"
    }
return

;# Timestamp Bookmark
!+t::
if(gui5 = 1)
{
    Gui, Submit, NoHide
    Gui 5:Default
    GuiControlGet, Note
}

if (S_HH > 0) && (Note !="")
{
    Note = %Note%`n%S_HH%:%S_MM%:%S_SS%
}
else if (Note !="")
{
    Note = %Note%`n%S_MM%:%S_SS%
}
Else
{
    Note = %S_MM%:%S_SS%
}

if (gui5 = 1)
{
    GuiControl,5:, Note, %Note%
    GuiControl,5:focus,Note
    send, ^{end}
    send, {Space}
}

if (S_HH > 0)
{
    Tooltip, Bookmark has already saved at %S_HH%:%S_MM%:%S_SS%,%TooltipX%, %TooltipY%, 2
}
Else{
    Tooltip, Bookmark has already saved at %S_MM%:%S_SS%,%TooltipX%, %TooltipY%, 2
}
return

;Fast Screenshot
!+Y::
if (!FileExist("%A_Desktop%\UHotkey")) 
{
    FileCreateDir,%A_Desktop%\UHotkey
}
ScreenshotFile=%A_Desktop%\UHotkey\%A_YYYY%-%A_MM%-%A_DD% %A_Hour%.%A_Min%.%A_Sec% %FastNoteSubject%%StopWatchToFile%.png
TakeScreenshot(ScreenshotFile)
return

;# Open addition menu
!+s::
send, ^c
MouseGetPos, vCurX2, vCurY2
if (Dark_Mode = 1)
{
    Gui, 6: Color, 1E1E1E
    Gui, 6: Font, c0xFFFFFF
}
if (EnableFocusChange = 0)
{
    Gui, 6: Add, Button, x10 y10 w80 h30 gForgotEntoTh hWndhBtn1,1 ลืมเปลี่ยนภาษา EngtoTh
    if (Dark_Mode = 1)
        ImageButton.Create(hBtn1, IBBtnStyles*)
    Gui, 6: Add, Button, x100 y10 w80 h30 gForgotThtoEn hWndhBtn1,2 ลืมเปลี่ยนภาษา ThtoEng
    if (Dark_Mode = 1)
        ImageButton.Create(hBtn1, IBBtnStyles*)
    Gui, 6: Add, Button, x190 y10 w80 h30 gGoogleDef hWndhBtn1,3 GoogleDef
    if (Dark_Mode = 1)
        ImageButton.Create(hBtn1, IBBtnStyles*)
    Gui, 6: Add, Button, x280 y10 w80 h30 gLongmanDef hWndhBtn1,4 LongmanDef
    if (Dark_Mode = 1)
        ImageButton.Create(hBtn1, IBBtnStyles*)
    Gui, 6: Add, Button, x370 y10 w80 h30 gGGTranslate hWndhBtn1,5 GG Translate
    if (Dark_Mode = 1)
        ImageButton.Create(hBtn1, IBBtnStyles*)
    Gui, 6: -MinimizeBox -MaximizeBox -SysMenu +AlwaysOnTop -Caption
}
EnableFocusChange = 1
vCurY2 := vCurY2-50
Gui, 6: Show, w472 h50 x%vCurX2% y%vCurY2% NA,Addition Menu
WinSet, Transparent, 255, Addition Menu
WinSet, Transparent, 200, Addition Menu
if (NotiPopup = 1)
{
    SplashImage = %A_ScriptDir%\UHotkey Open shortcut.png
    if FileExist(SplashImage)
    {
        ysplash := rightMonitorHeight -200
        SplashImageGUI(SplashImage, "Center", ysplash, 200, False)
    }
}
return

;# Minimize active window
!+e::
IfWinNotActive, ahk_class WorkerW
{
WinGetClass, class, A
WinMinimize, A
}
return

;# Move active window along with cursor
!+q::
CoordMode, Mouse, Screen
MouseGetPos,vX1, vY1
activeWindow := WinActive("A")
WinGetPos, x, y, width, height, ahk_id %activeWindow%
loop
{
    MouseGetPos,vX2, vY2
    newX := 1.5*(vX2-vX1)+x
    newY := 1.5*(vY2-vY1)+y
    WinMove, ahk_id %activeWindow%, , %newX%, %newY%, Width, Height
    If !GetKeyState("q","P")
    {
        Break
    }
}
return

;# Move active window down
!+down::
    IfWinNotActive, ahk_class WorkerW
    {
        keywait, down, t.300
        if (errorlevel = "1")
        {
            loop
            {
                activeWindow := WinActive("A")
                WinGetPos, x, y, width, height, ahk_id %activeWindow%
                newX := x
                newY := y+10
                WinMove, ahk_id %activeWindow%, , %newX%, %newY%, Width, Height
                If !GetKeyState("down","P")
                    Break
            }
        }
        else
        {
            activeWindow := WinActive("A")
            WinGetPos, x, y, width, height, ahk_id %activeWindow%
            newX := x
            newY := y+1
            WinMove, ahk_id %activeWindow%, , %newX%, %newY%, Width, Height
        }
    }
return

;# Move active window left
!+left::
    IfWinNotActive, ahk_class WorkerW
    {
        keywait, Left, t.300
        if (errorlevel = "1")
        {
            loop
            {
                activeWindow := WinActive("A")
                WinGetPos, x, y, width, height, ahk_id %activeWindow%
                newX := x-10
                newY := y
                WinMove, ahk_id %activeWindow%, , %newX%, %newY%, Width, Height
                If !GetKeyState("left","P")
                    Break
            }
        }
        else
        {
            activeWindow := WinActive("A")
            WinGetPos, x, y, width, height, ahk_id %activeWindow%
            newX := x-1
            newY := y
            WinMove, ahk_id %activeWindow%, , %newX%, %newY%, Width, Height
        }
    }
return

;# Move active window up
!+up::
    IfWinNotActive, ahk_class WorkerW
    {
        keywait, up, t.300
        if (errorlevel = "1")
        {
            loop
            {
                activeWindow := WinActive("A")
                WinGetPos, x, y, width, height, ahk_id %activeWindow%
                newX := x
                newY := y-10
                WinMove, ahk_id %activeWindow%, , %newX%, %newY%, Width, Height
                If !GetKeyState("up","P")
                    Break
            }
        }
        else
        {
            activeWindow := WinActive("A")
            WinGetPos, x, y, width, height, ahk_id %activeWindow%
            newX := x
            newY := y-1
            WinMove, ahk_id %activeWindow%, , %newX%, %newY%, Width, Height
        }
    }
return

;# Move active window right
!+right::
    IfWinNotActive, ahk_class WorkerW
    {
        keywait, right, t.300
        if (errorlevel = "1")
        {
            loop
            {
                activeWindow := WinActive("A")
                WinGetPos, x, y, width, height, ahk_id %activeWindow%
                newX := x+10
                newY := y
                WinMove, ahk_id %activeWindow%, , %newX%, %newY%, Width, Height
                If !GetKeyState("right","P")
                    Break
            }
        }
        else
        {
            activeWindow := WinActive("A")
            WinGetPos, x, y, width, height, ahk_id %activeWindow%
            newX := x+1
            newY := y
            WinMove, ahk_id %activeWindow%, , %newX%, %newY%, Width, Height
        }
    }
return

;# Always On top toggle
!+a::
Winset, Alwaysontop, , A
return

;# Increase window's opacity
!+<::
ActiveWinTranspa := ActiveWinTranspa +10
if (ActiveWinTranspa > 255)
{
    ActiveWinTranspa := 255
    WinSet, Transparent, OFF, A
    ActiveWinTranspaShow := ActiveWinTranspa/255*100
    ActiveWinTranspaShow := % Format("{:.0f}",ActiveWinTranspaShow)
    ToolTip, Active window's opacity : %ActiveWinTranspaShow%%Percent%, %TooltipX%, %TooltipY%, 2
    SetTimer, CheckLangAgain, 5000
    return
}
Else if (ActiveWinTranspa == "")
{
    ActiveWinTranspa := 0
}
WinSet, Transparent, %ActiveWinTranspa%, A
ActiveWinTranspaShow := ActiveWinTranspa/255*100
ActiveWinTranspaShow := % Format("{:.0f}",ActiveWinTranspaShow)
ToolTip, Active window's opacity : %ActiveWinTranspaShow%%Percent%, %TooltipX%, %TooltipY%, 2
SetTimer, CheckLangAgain, 5000
return

;# Decrease window's opacity
!+>::
ActiveWinTranspa := ActiveWinTranspa -10
if (ActiveWinTranspa < 40)
{
    ActiveWinTranspa := 40
}
WinSet, Transparent, %ActiveWinTranspa%, A
ActiveWinTranspaShow := ActiveWinTranspa/255*100
ActiveWinTranspaShow := % Format("{:.0f}",ActiveWinTranspaShow)
ToolTip, Active window's opacity : %ActiveWinTranspaShow%%Percent%, %TooltipX%, %TooltipY%, 2
SetTimer, CheckLangAgain, 5000
return

;# Move window to another monitor/move window to mouse position
!+r::
if (MonitorCount = 1)
{
    activeWindow := WinActive("A")
    if activeWindow = 0
    {
        return
    }
    MouseGetPos, x, y
    WinMove, ahk_id %activeWindow%, , %x%, %y%, Width, Height
    return
}
    IfWinNotActive, ahk_class WorkerW
    {
        activeWindow := WinActive("A")
        if activeWindow = 0
        {
            return
        }
        WinGet, minMax, MinMax, ahk_id %activeWindow%
        if minMax = 1
        {
            WinRestore, ahk_id %activeWindow%
        }
        WinGetPos, x, y, width, height, ahk_id %activeWindow%

        xmid := x+(width/2)
        ymid := y+(height/2)

        ;Window is on left monitor and right monitor is main
        if (xmid < 0) && (mainmonitoris = "Right Monitor") ;จอซ้ายไปจอขวา
        {
            if (y < 0) ;ถ้าwindow อยู่เหนือ
            {
                y := y - y - ymid
            }
            if (y+height > leftMonitorHeight) ;ถ้าwindow อยู่ใต้
            {
                y := y - (y + height - leftMonitorHeight)
            }
            if (leftMonitorWidth + x + width > rightMonitorWidth) ;กันเลยขอบจอขวา
            {
                x := x - (Width) 
            }
            xScale := rightMonitorWidth / leftMonitorWidth
            yScale := rightMonitorHeight / leftMonitorHeight
            x := leftMonitorWidth + x
            newX := x * xScale
            newY := y * yScale
        }
        ;Window is on left monitor and left monitor is main
        else if (xmid < leftMonitorWidth) && (mainmonitoris = "Left Monitor") ;จอซ้ายไปจอขวา
            {
                if (y < 0) ;ถ้าwindow อยู่เหนือ
                {
                    y := y - y - ymid
                }
                if (y+height > leftMonitorHeight) ;ถ้าwindow อยู่ใต้
                {
                    y := y - (y + height - leftMonitorHeight)
                }
                if (leftMonitorWidth + x + width > rightMonitorWidth) ;กันเลยขอบจอขวา
                {
                    x := x - (Width) 
                }
                xScale := rightMonitorWidth / leftMonitorWidth
                yScale := rightMonitorHeight / leftMonitorHeight
                x := leftMonitorWidth + x
                newX := x * xScale
                newY := y * yScale
            }
        ;Window is on right monitor and right monitor is main
        else if (xmid > 0) && (mainmonitoris = "Right Monitor") ;จอขวาไปซ้าย
        {
            if (RightMonitorHeight > leftMonitorHeight && y < 0) ;ถ้าwindow อยู่เหนือ
            {
                y := y - y - ymid
            }
            if (y+height > RightMonitorHeight) ;ถ้าwindow อยู่ใต้
            {
                y := y - (y + height - RightMonitorHeight)
            }
            if (x + width < -leftMonitorWidth) ;กันเลยขอบจอซ้าย
            {
                x := x + (Width) 
            }
            xScale := leftMonitorWidth / rightMonitorWidth
            yScale := leftMonitorHeight / rightMonitorHeight
            x := x - leftMonitorWidth
            newX := x * xScale
            newY := y * yScale
        }
        else if (xmid > leftMonitorWidth) && (mainmonitoris = "Left Monitor") ;จอขวาไปซ้าย
            {
                if (RightMonitorHeight > leftMonitorHeight && y < 0) ;ถ้าwindow อยู่เหนือ
                {
                    y := y - y - ymid
                }
                if (y+height > RightMonitorHeight) ;ถ้าwindow อยู่ใต้
                {
                    y := y - (y + height - RightMonitorHeight)
                }
                if (x + width < -leftMonitorWidth) ;กันเลยขอบจอซ้าย
                {
                    x := x + (Width) 
                }
                xScale := leftMonitorWidth / rightMonitorWidth
                yScale := leftMonitorHeight / rightMonitorHeight
                newX := newX - leftMonitorWidth
                newX := x * xScale
                newY := y * yScale
            }
        WinMove, ahk_id %activeWindow%, , %newX%, %newY%, Width, Height
        ; If window is in maxmize state after moving change it back to maximize state
        if minMax = 1
        {
            WinMaximize, ahk_id %activeWindow%
        }
        WinActivate ahk_id %activeWindow% ;Needed - otherwise another window may overlap it
    }
    if (NotiPopup = 1)
    {
        SplashImage = %A_ScriptDir%\UHotkey Move to another.png
        if FileExist(SplashImage)
        {
            ysplash := rightMonitorHeight -200
            SplashImageGUI(SplashImage, "Center", ysplash, 200, False)
        }
    }
return

;Discord Mic
~*RCtrl up::
if (EnableDiscordMic = 1)
    {
    if (dismic = 0)
    {
        Gui, 4: Color, 1BFF00
        dismic = 1
    }
    else if (dismic = 1)
    {
        Gui, 4: Color, FF0000
        dismic = 0
    }
    Else
    {
        dismic = 0
    }
    SetTimer, MicIndicatorOnTop, 1
}
return

;Left click action
~LButton::
    if (enablestopwatch = 1)
    {
        enablestopwatch = 0
        GuiControl,2:, stopwatchbutt,StopWatchIsWorking ClickToStop
        GuiControl,2:, StopWatchShow,StopWatch is working
        stopwatchworking = 1

        Tooltip,
        S_HH := 00
        S_MM := 00
        S_SS := -1

        SetTimer ,StopWatchCount, 1000
    }

    if (A_Cursor = "IBeam") ;ถ้าเปิดจะทำให้ action จาก Lbutton ช้าหมด
    {
    SetTimer ,IndicatorLangguageLClick, 1
    }

    ;Detect Discord Mic
    if (EnableDiscordMic = 1) && (DetectDiscordMic = 1)
    {
        sleep 2
        if (WinActive(" - Discord")) || (WinActive("Discord - • Discord"))
        {
            CoordMode, Pixel, Relative
            WinGetPos, x, y, width, height, A
            
                sleep 100
                ;fullscreen mode
                height2 := height - 30
                PixelGetColor, OutputVarDisMic2, 185, %height2%
                height := height - 17
                ;window mode
                PixelGetColor, OutputVarDisMic, 173, %height% 

            if (OutputVarDisMic = 0x35318A || OutputVarDisMic = 0x443E97 || OutputVarDisMic2 = 0x2F2B57 || OutputVarDisMic2 = 0x453E6B || OutputVarDisMic2 = 0xA5A19D)
            {
                if (dismic = 1)
                {
                    Gui, 4: Color, FF0000
                    dismic = 0
                }
            }
            else if (OutputVarDisMic = 0x282423 || OutputVarDisMic = 0x453E3D ||OutputVarDisMic2 = 0xA29C9C || OutputVarDisMic2 = 0xA4A09C)
            {
                if (dismic = 0)
                {
                    Gui, 4: Color, 1BFF00
                    dismic = 1
                }
            }
            CoordMode, Pixel, Screen
        } ;end ของ if (WinActive("Discord"))
    }

    if (EnableFocusChange = 1)
    {
        sleep 1
        IfWinNotActive Addition Menu,
        {
            Gui, 6: Destroy
            EnableFocusChange = 0
        }
    }

    if (stopbookmarkcheck = 1) && (bookmarktab_on = 1) && ((WinActive(" - Google Chrome") || WinActive(" - Microsoft​ Edge")) || WinActive(" - Brave"))
    {
        CoordMode, Mouse, Window
        MouseGetPos , OutputVarX, OutputVarY
        if (OutputVarY > 114)
        {
            Send, ^+b
            bookmarktab_on = 0
            stopbookmarkcheck = 0
            if (OutputVarY < 113)
            {
                return
            }
            OutputVarY := OutputVarY -33
            sleep 10
            MouseMove, OutputVarX, OutputVarY
            return
        }
        Else{
            stopbookmarkcheck = 0
        }
    }

    if (autocollapsebookmarkbar = 1)
    {
    sleep 2
    if (WinActive(" - Google Chrome") || WinActive(" - Microsoft​ Edge") || WinActive(" - Brave"))
    {
        if WinActive("New Tab") || WinActive(".pdf")
        {
            return
        }
        CoordMode, Pixel, Window
        PixelGetColor, OutputVar, 14, 89
        SetTimer, bookmarktab_onaction, OFF
        ;Tooltip, %OutputVar%
        if (OutputVar = 0x3A3635 || OutputVar = 0x3B3B3B || OutputVar = 0xE4E1B7 || OutputVar = 0x433430)
        {
            bookmarktab_on = 1
        }
        else
        {
            bookmarktab_on = 0
        }
        bookmarktab_check:
            if (bookmarktab_on = 0)
            {
                SetTimer, bookmarktab_onaction, 100 ;แก้เป็น 400 ถ้าต้องการให้เป็นแบบ hover
                autocollapsebookmarkbar = 0
                GuiControl,2: Disable, autocollapsebookmarkbar
            }
            else if (bookmarktab_on = 1)
            {
                Send, ^+b
                bookmarktab_on = 0
                goto, bookmarktab_check
            }		
        }
    }
return

StopWatchCount:
        if (S_MM >= 59 && S_SS >= 59)
        {
            S_HH := S_HH + 1
            GuiControl,2:, GUI_HH,%S_HH%
            S_MM := 00
            S_MM:=SubStr("00" . S_MM,-1)
            GuiControl,2:, GUI_MM,%S_MM%
            S_SS := -1
        }
        if (S_SS >= 59)
        {
            S_MM := S_MM + 1
            S_MM:=SubStr("00" . S_MM,-1)
            GuiControl,2:, GUI_MM,%S_MM%
            S_SS := -1
        }
        S_SS := S_SS + 1
        S_SS:=SubStr("00" . S_SS,-1)
        GuiControl,2:, GUI_SS,%S_SS%

        if (stopwatchworking = 0)
        {
            GuiControl,2:, StopWatchShow, StopWtach is disable
            SetTimer ,StopWatchCount, OFF
            return
        }
    return

; เป็น ปลายทง Settimer มาจากด้านบน แต่ถ้าเปิดจะทำให้ action จาก Lbutton ช้าหมด
IndicatorLangguageLClick:
if !LangID := GetKeyboardLanguage(WinActive("A"))
{
	Tooltip, Failed,,,1
}

if (LangID = 0x041e) ;ภาษาไทย
{
	ToolTip,ไทย,,,1
		;run C:\Program Files (x86)\foobar2000\foobar2000.exe  /immediate /play "%A_ScriptDir%\thai.wav"  /hide 
}
else if (LangID = 0x0409) ;ภาษาอังกฤษ
{
    ToolTip,ENG,,,1
    ;run C:\Program Files (x86)\foobar2000\foobar2000.exe  /immediate /play "%A_ScriptDir%\eng.wav"  /hide 
}
else if (LangID = 0x0411) ;JP
{
    ToolTip ,JP,,, 1
	;run C:\Program Files (x86)\foobar2000\foobar2000.exe  /immediate /play "%A_ScriptDir%\JP.wav"  /hide 
}
sleep 100
ToolTip,,,,1
SetTimer ,IndicatorLangguageLClick, OFF
return

bookmarktab_onaction:
    ;Tooltip, %bookmarktab_on% Detect
    if WinActive("New Tab") || WinActive(".pdf")
    {
        return
    }
    if (WinActive(" - Google Chrome") || WinActive(" - Microsoft​ Edge") || WinActive(" - Brave"))
    {
    }
    else
    {
        SetTimer, bookmarktab_onaction, OFF
        autocollapsebookmarkbar = 1
        GuiControl,2: Enable, autocollapsebookmarkbar
        GuiControl,2:,autocollapsebookmarkbar,1
        return
    }
    CoordMode, Mouse, Window
    WinGetPos, x, y, width, height, A
    MouseGetPos , OutputVarX, OutputVarY
    if (WinActive(" - Google Chrome") || WinActive(" - Microsoft​ Edge") || WinActive(" - Brave"))
    {
    }
    else
    {
        ;Tooltip, %bookmarktab_on% Detect
        SetTimer, bookmarktab_onaction, OFF
        autocollapsebookmarkbar = 1
        GuiControl,2: Enable, autocollapsebookmarkbar
        GuiControl,2:,autocollapsebookmarkbar,1
        return
    }
    if (OutputVarY > 73 && OutputVarY < 82) && (OutputVarX < width && OutputVarX > 0) && (WinActive(" - Google Chrome") || WinActive(" - Microsoft​ Edge") || WinActive(" - Brave")) && bookmarktab_on = 0
    {
        Send, ^+b
        bookmarktab_on = 1
        ;Tooltip, %bookmarktab_on% Detect
        stopbookmarkcheck = 1
        loop {
            ;Tooltip, 1 %stopbookmarkcheck% %bookmarktab_on%
            if (stopbookmarkcheck = 0)
            {
                autocollapsebookmarkbar = 1
                GuiControl,2: Enable, autocollapsebookmarkbar
                GuiControl,2:,autocollapsebookmarkbar,1
                return
            }
            sleep 100
            ;Tooltip, Looping %stopbookmarkcheck% %bookmarktab_on%
            CoordMode, Mouse, Window
            MouseGetPos , OutputVarX, OutputVarY
            if (OutputVarY < 73 || OutputVarX > width || OutputVarX < 0) && (WinActive(" - Google Chrome") || WinActive(" - Microsoft​ Edge") || WinActive(" - Brave"))
            {
                if (stopbookmarkcheck = 0)
                {
                    autocollapsebookmarkbar = 1
                    return
                }
                Send, ^+b
                bookmarktab_on = 0
                break
            }
            if (WinActive(" - Google Chrome") || WinActive(" - Microsoft​ Edge") || WinActive(" - Brave"))
            {
            }
            else
            {
                ;Tooltip, %bookmarktab_on% Detect
                SetTimer, bookmarktab_onaction, OFF
                autocollapsebookmarkbar = 1
                GuiControl,2: Enable, autocollapsebookmarkbar
                GuiControl,2:,autocollapsebookmarkbar,1
                break
            }
        }
    }
    if (WinActive(" - Google Chrome") || WinActive(" - Microsoft​ Edge") || WinActive(" - Brave"))
    {
    }
    else
    {
        ;Tooltip, %bookmarktab_on% Detect
        ;Tooltip,
        SetTimer, bookmarktab_onaction, OFF
        autocollapsebookmarkbar = 1
        GuiControl,2: Enable, autocollapsebookmarkbar
        GuiControl,2:,autocollapsebookmarkbar,1
        return
    }
    ;ตั้งแต่บรรทัดนี้
    SetTimer, bookmarktab_onaction, OFF
    autocollapsebookmarkbar = 1
    GuiControl,2: Enable, autocollapsebookmarkbar
    GuiControl,2:,autocollapsebookmarkbar,1
    ;ถึงบรรทัดนี้ ทำให้เปลี่ยนเป็นแบบ click แทน hover
return

;Check Change Language
~LWin & ~Space::
~LCtrl & ~LShift::
while GetKeyState("LCtrl", "P") ; While right mouse button is being held:
{ ;หากกดค้าง
    if (TooltipNoti = 1)
    {
        Tooltip, Waiting
        ToolTip , Waiting, %TooltipX%, %TooltipY%, 2
    }
    sleep 10
}
sleep 5
if !LangID := GetKeyboardLanguage(WinActive("A"))
{
    Tooltip, Failed, %TooltipX%, %TooltipY%, 2
    return
}

if (LangID = 0x041e) ;ภาษาไทย
{
    if (TooltipNoti = 1)
    {
        ToolTip , ไทย, %TooltipX%, %TooltipY%, 2
    }
    if (SpeakLang = 1)
    {
        SoundPlay, %A_ScriptDir%\thai.wav
    }
    if (NotiPopup = 1)
    {
        SplashImage = %A_ScriptDir%\UHotkey ไทย.png
        if FileExist(SplashImage)
        {
            ysplash := rightMonitorHeight -200
            SplashImageGUI(SplashImage, "Center", ysplash, 200, False)
        }
    }
    ToolTip, ไทย,,,1
    ;run C:\Program Files (x86)\foobar2000\foobar2000.exe /immediate /play "%A_ScriptDir%\thai.wav" /hide 
}
else if (LangID = 0x0409) ;ภาษาอังกฤษ
{
    if (TooltipNoti = 1)
    {
        ToolTip , ENG, %TooltipX%, %TooltipY%, 2
    }
    if (SpeakLang = 1)
    {
        SoundPlay, %A_ScriptDir%\eng.wav
    }
    if (NotiPopup = 1)
    {
        SplashImage = %A_ScriptDir%\UHotkey ENG.png
        if FileExist(SplashImage)
        {
            ysplash := rightMonitorHeight -200
            SplashImageGUI(SplashImage, "Center", ysplash, 200, False)
        }
    }
    ToolTip, ENG,,,1
    ;run C:\Program Files (x86)\foobar2000\foobar2000.exe /immediate /play "%A_ScriptDir%\eng.wav" /hide 
}
else if (LangID = 0x0411) ;JP
{
    if (TooltipNoti = 1)
    {
        ToolTip , JP, %TooltipX%, %TooltipY%, 2
        
    }
    if (SpeakLang = 1)
    {
        SoundPlay, %A_ScriptDir%\JP.wav
    }
    ToolTip, JP,,,1
    ;run C:\Program Files (x86)\foobar2000\foobar2000.exe /immediate /play "%A_ScriptDir%\JP.wav" /hide 
}
sleep 100
ToolTip, ,,,1
return

~RButton::
if (A_Cursor = "IBeam")
{
    CoordMode, Mouse, Screen
    MouseGetPos,vCurX1, vCurY1
    keywait, RButton, T.6
    if (errorlevel = "1")
    {
        send, ^c
        MouseGetPos, vCurX2, vCurY2
        if(vCurX1 = vCurX2 and vCurY1 = vCurY2)
        {
            send {LWin down}{v down}
            sleep 20
            send {LWin up}{v up}
            vCurX2 := vCurX2+295
            vCurY2 := vCurY2+392
            MouseMove,vCurX2, vCurY2
            ;WaitDisableRight = 1
        }
        else if ((vCurX1-vCurX2 < 50 or -50 < vCurX1-vCurX2) and vCurY1 > vCurY2)
        {
            if (Dark_Mode = 1)
            {
                Gui, 6: Color, 1E1E1E
                Gui, 6: Font, c0xFFFFFF
            }
            if (EnableFocusChange = 0)
            {
                Gui, 6: Add, Button, x10 y10 w80 h30 gForgotEntoTh hWndhBtn1,1 ลืมเปลี่ยนภาษา EngtoTh
                if (Dark_Mode = 1)
                    ImageButton.Create(hBtn1, IBBtnStyles*)
                Gui, 6: Add, Button, x100 y10 w80 h30 gForgotThtoEn hWndhBtn1,2 ลืมเปลี่ยนภาษา ThtoEng
                if (Dark_Mode = 1)
                    ImageButton.Create(hBtn1, IBBtnStyles*)
                Gui, 6: Add, Button, x190 y10 w80 h30 gGoogleDef hWndhBtn1,3 GoogleDef
                if (Dark_Mode = 1)
                    ImageButton.Create(hBtn1, IBBtnStyles*)
                Gui, 6: Add, Button, x280 y10 w80 h30 gLongmanDef hWndhBtn1,4 LongmanDef
                if (Dark_Mode = 1)
                    ImageButton.Create(hBtn1, IBBtnStyles*)
                Gui, 6: Add, Button, x370 y10 w80 h30 gGGTranslate hWndhBtn1,5 GG Translate
                if (Dark_Mode = 1)
                    ImageButton.Create(hBtn1, IBBtnStyles*)
                Gui, 6: -MinimizeBox -MaximizeBox -SysMenu +AlwaysOnTop -Caption
            }
            EnableFocusChange = 1
            vCurY2 := vCurY2-50
            Gui, 6: Show, w472 h50 x%vCurX2% y%vCurY2% NA,Addition Menu
            WinSet, Transparent, 255, Addition Menu
            WinSet, Transparent, 200, Addition Menu
        }
    }
}
IfWinActive , YouTube Music,,Chrome
{
    CoordMode, Mouse, Screen
    MouseGetPos, xpos, ypos
    WinGetPos, ytX, ytY, ytWidth, ytHeight, YouTube Music,,Chrome
    ;sleep 100
    ;Msgbox, %ypos%
    ;Tooltip, %ytMouseY% %ytX% %ytY% %ytWidth% %ytHeight% YouTube Music
    if ((ypos < 1000) && (ytX=-8 && ytY=970 && ytWidth = 1936 && ytHeight = 90))
    {
        WinMove, YouTube Music,, 600, 200 , 700, 700,
    }
}
return

GoogleDef:
    sleep 10
    clipboardtolink = %clipboard%
    GuiControlGet, Checkbox
    Run "https://www.google.com/search?q=%clipboardtolink%+meaning"
    Gui, 6: Destroy
Return

LongmanDef:
    sleep 10
    clipboardtolink = %clipboard%
    GuiControlGet, Checkbox
    Run "https://www.ldoceonline.com/dictionary/%clipboardtolink%"
    Gui, 6: Destroy
Return

GGTranslate:
    sleep 10
    clipboardtolink = %clipboard%
    GuiControlGet, Checkbox
    Run "https://translate.google.co.th/?hl=th&tab=rT&sl=auto&tl=th&text=%clipboardtolink%&op=translate"
    Gui, 6: Destroy
Return

#IfWinActive ahk_exe GenshinImpact.exe
~H::
	send {MButton down}
	ToolTip, MButton down
	sleep 4000
	ToolTip,
	send {MButton up}
Return

#If EnableFocusChange = 1
1::
	goto, ForgotEntoTh

#If EnableFocusChange = 1
2::
	goto, ForgotThtoEn

#If EnableFocusChange = 1
3::
	goto, GoogleDef

#If EnableFocusChange = 1
4::
	goto, LongmanDef

#If EnableFocusChange = 1
5::
	goto, GGTranslate


#If WinActive(version)
Numpad1 up::
	goto, TurnMonitorOff

#If WinActive(version)
Numpad2 up::
	goto, Ac_TooltipNoti

#If WinActive(version)
Numpad3 up::
	;goto, FindIDmic

#If WinActive(version)
Numpad4 up::
	goto, TranslateShow

#If WinActive(version)
Numpad5 up::
	goto, ForgotEntoTh

#If WinActive(version)
Numpad6 up::
	goto, ForgotThtoEn

#If WinActive(version)
Numpad7 up::
	goto, WindowManager

#If WinActive(version)
Numpad8 up::
	goto, Spy

;# Function check language
GetKeyboardLanguage(_hWnd=0) 
{
	if !_hWnd
		ThreadId=0
	else
		if !ThreadId := DllCall("user32.dll\GetWindowThreadProcessId", "Ptr", _hWnd, "UInt", 0, "UInt")
		return false

	if !KBLayout := DllCall("user32.dll\GetKeyboardLayout", "UInt", ThreadId, "UInt")
		return false

return KBLayout & 0xFFFF
}

ForgotEntoTh:
StringCaseSense, On
;EngtoTh NoCapslock
StringReplace, clipboardRe1, clipboard,q,ๆ,all
StringReplace, clipboardRe1, clipboardRe1,w,ไ,all
StringReplace, clipboardRe1, clipboardRe1,r,พ,all
StringReplace, clipboardRe1, clipboardRe1,i,ร,all
StringReplace, clipboardRe1, clipboardRe1,o,น,all
StringReplace, clipboardRe1, clipboardRe1,p,ย,all
StringReplace, clipboardRe1, clipboardRe1,a,ฟ,all
StringReplace, clipboardRe1, clipboardRe1,s,ห,all
StringReplace, clipboardRe1, clipboardRe1,d,ก,all
StringReplace, clipboardRe1, clipboardRe1,f,ด,all
StringReplace, clipboardRe1, clipboardRe1,g,เ,all
StringReplace, clipboardRe1, clipboardRe1,l,ส,all
StringReplace, clipboardRe1, clipboardRe1,z,ผ,all
StringReplace, clipboardRe1, clipboardRe1,x,ป,all
StringReplace, clipboardRe1, clipboardRe1,c,แ,all
StringReplace, clipboardRe1, clipboardRe1,v,อ,all
StringReplace, clipboardRe1, clipboardRe1,m,ท,all
StringReplace, clipboardRe1, clipboardRe1,[,บ,all
StringReplace, clipboardRe1, clipboardRe1,],ล,all
StringReplace, clipboardRe1, clipboardRe1,;,ว,all
StringReplace, clipboardRe1, clipboardRe1,',ง,all
StringReplace, clipboardRe1, clipboardRe1,.,ใ,all
StringReplace, clipboardRe1, clipboardRe1,/,ฝ,all
StringReplace, clipboardRe1, clipboardRe1,=,ช,all
StringReplace, clipboardRe1, clipboardRe1,-,ข,all
StringReplace, clipboardRe1, clipboardRe1,0,จ,all
StringReplace, clipboardRe1, clipboardRe1,9,ต,all
StringReplace, clipboardRe1, clipboardRe1,8,ค,all
StringReplace, clipboardRe1, clipboardRe1,5,ถ,all
StringReplace, clipboardRe1, clipboardRe1,4,ภ,all
StringReplace, clipboardRe1, clipboardRe1,3,-,all
StringReplace, clipboardRe1, clipboardRe1,2,/,all
StringReplace, clipboardRe1, clipboardRe1,1,ๅ,all
;EngtoTh Capslock
StringReplace, clipboardRe1, clipboardRe1,Q,๐,all
StringReplace, clipboardRe1, clipboardRe1,W,",all
StringReplace, clipboardRe1, clipboardRe1,E,ฎ,all
StringReplace, clipboardRe1, clipboardRe1,R,ฑ,all
StringReplace, clipboardRe1, clipboardRe1,T,ธ,all
StringReplace, clipboardRe1, clipboardRe1,I,ณ,all
StringReplace, clipboardRe1, clipboardRe1,O,ฯ,all
StringReplace, clipboardRe1, clipboardRe1,P,ญ,all
StringReplace, clipboardRe1, clipboardRe1,A,ฤ,all
StringReplace, clipboardRe1, clipboardRe1,S,ฆ,all
StringReplace, clipboardRe1, clipboardRe1,D,ฏ,all
StringReplace, clipboardRe1, clipboardRe1,F,โ,all
StringReplace, clipboardRe1, clipboardRe1,G,ฌ,all
StringReplace, clipboardRe1, clipboardRe1,K,ษ,all
StringReplace, clipboardRe1, clipboardRe1,L,ศ,all
StringReplace, clipboardRe1, clipboardRe1,Z,(,all
StringReplace, clipboardRe1, clipboardRe1,X,),all
StringReplace, clipboardRe1, clipboardRe1,C,ฉ,all
StringReplace, clipboardRe1, clipboardRe1,V,ฮ,all
StringReplace, clipboardRe1, clipboardRe1,<,ฒ,all
StringReplace, clipboardRe1, clipboardRe1,>,ฬ,all
StringReplace, clipboardRe1, clipboardRe1,?,ฦ,all
StringReplace, clipboardRe1, clipboardRe1,",.,all
StringReplace, clipboardRe1, clipboardRe1,:,ซ,all
StringReplace, clipboardRe1, clipboardRe1,},,,all
StringReplace, clipboardRe1, clipboardRe1,{,ฐ,all
StringReplace, clipboardRe1, clipboardRe1,+,๙,all
StringReplace, clipboardRe1, clipboardRe1,_,๘,all
StringReplace, clipboardRe1, clipboardRe1,),๗,all
StringReplace, clipboardRe1, clipboardRe1,(,๖,all
StringReplace, clipboardRe1, clipboardRe1,*,๕,all
StringReplace, clipboardRe1, clipboardRe1,&,฿,all
StringReplace, clipboardRe1, clipboardRe1,%Percent%,๔,all
StringReplace, clipboardRe1, clipboardRe1,$,๓,all
StringReplace, clipboardRe1, clipboardRe1,#,๒,all
StringReplace, clipboardRe1, clipboardRe1,@,๑,all
StringReplace, clipboardRe1, clipboardRe1,!,+,all
StringReplace, clipboardRe1, clipboardRe1,^,ู,all
StringReplace, clipboardRe1, clipboardRe1,k,า,all
StringReplace, clipboardRe1, clipboardRe1,e,ำ,all
StringReplace, clipboardRe1, clipboardRe1,t,ะ,all
StringReplace, clipboardRe1, clipboardRe1,y,ั,all
StringReplace, clipboardRe1, clipboardRe1,u,ี,all
StringReplace, clipboardRe1, clipboardRe1,b,ิ,all
StringReplace, clipboardRe1, clipboardRe1,n,ื,all
Text := ","
StringReplace, clipboardRe1, clipboardRe1,%Text%,ม,all
StringReplace, clipboardRe1, clipboardRe1,7,ึ,all
StringReplace, clipboardRe1, clipboardRe1,6,ุ,all
StringReplace, clipboardRe1, clipboardRe1,Y,ํ,all
StringReplace, clipboardRe1, clipboardRe1,U,๊,all
StringReplace, clipboardRe1, clipboardRe1,H,็,all
StringReplace, clipboardRe1, clipboardRe1,B,ฺ,all
StringReplace, clipboardRe1, clipboardRe1,N,์,all
StringReplace, clipboardRe1, clipboardRe1,M,?,all
StringReplace, clipboardRe1, clipboardRe1,J,๋,all
StringReplace, clipboardRe1, clipboardRe1,h,้,all
StringReplace, clipboardRe1, clipboardRe1,j,่,all
clipboard = %clipboardRe1%
StringCaseSense, OFF
if (EnableFocusChange = 1)
{
	Gui, 6: Destroy
	send, ^v
	EnableFocusChange = 0
}
return

ForgotThtoEn:
StringCaseSense, On
;ThtoEng NoCapslock
StringReplace, clipboardRe1, clipboard,ๆ,q,all
StringReplace, clipboardRe1, clipboardRe1,้,h,all
StringReplace, clipboardRe1, clipboardRe1,่,j,all
StringReplace, clipboardRe1, clipboardRe1,ู,^,all
StringReplace, clipboardRe1, clipboardRe1,็,H,all
StringReplace, clipboardRe1, clipboardRe1,๋,J,all
StringReplace, clipboardRe1, clipboardRe1,ฺ,B,all
StringReplace, clipboardRe1, clipboardRe1,์,N,all
StringReplace, clipboardRe1, clipboardRe1,ํ,Y,all
StringReplace, clipboardRe1, clipboardRe1,๊,U,all
StringReplace, clipboardRe1, clipboardRe1,ึ,7,all
StringReplace, clipboardRe1, clipboardRe1,ุ,6,all
StringReplace, clipboardRe1, clipboardRe1,ิ,b,all
StringReplace, clipboardRe1, clipboardRe1,ื,n,all
StringReplace, clipboardRe1, clipboardRe1,า,k,all
StringReplace, clipboardRe1, clipboardRe1,ำ,e,all
StringReplace, clipboardRe1, clipboardRe1,ะ,t,all
StringReplace, clipboardRe1, clipboardRe1,ั,y,all
StringReplace, clipboardRe1, clipboardRe1,ี,u,all
StringReplace, clipboardRe1, clipboardRe1,ๅ,1,all
StringReplace, clipboardRe1, clipboardRe1,พ,r,all
StringReplace, clipboardRe1, clipboardRe1,ร,i,all
StringReplace, clipboardRe1, clipboardRe1,ไ,w,all
StringReplace, clipboardRe1, clipboardRe1,น,o,all
StringReplace, clipboardRe1, clipboardRe1,ย,p,all
StringReplace, clipboardRe1, clipboardRe1,ฟ,a,all
StringReplace, clipboardRe1, clipboardRe1,ห,s,all
StringReplace, clipboardRe1, clipboardRe1,ก,d,all
StringReplace, clipboardRe1, clipboardRe1,ด,f,all
StringReplace, clipboardRe1, clipboardRe1,เ,g,all
StringReplace, clipboardRe1, clipboardRe1,ส,l,all
StringReplace, clipboardRe1, clipboardRe1,ผ,z,all
StringReplace, clipboardRe1, clipboardRe1,ป,x,all
StringReplace, clipboardRe1, clipboardRe1,แ,c,all
StringReplace, clipboardRe1, clipboardRe1,อ,v,all
StringReplace, clipboardRe1, clipboardRe1,ท,m,all
StringReplace, clipboardRe1, clipboardRe1,บ,[,all
StringReplace, clipboardRe1, clipboardRe1,ล,],all
StringReplace, clipboardRe1, clipboardRe1,ว,;,all
StringReplace, clipboardRe1, clipboardRe1,ง,',all
Text := ","
StringReplace, clipboardRe1, clipboardRe1,e,%xt%,ม,all
StringReplace, clipboardRe1, clipboardRe1,ใ,.,all
StringReplace, clipboardRe1, clipboardRe1,ฝ,/,all
StringReplace, clipboardRe1, clipboardRe1,ช,=,all
StringReplace, clipboardRe1, clipboardRe1,ข,-,all
StringReplace, clipboardRe1, clipboardRe1,จ,0,all
StringReplace, clipboardRe1, clipboardRe1,ต,9,all
StringReplace, clipboardRe1, clipboardRe1,ค,8,all
StringReplace, clipboardRe1, clipboardRe1,ถ,5,all
StringReplace, clipboardRe1, clipboardRe1,ภ,4,all
StringReplace, clipboardRe1, clipboardRe1,-,3,all
StringReplace, clipboardRe1, clipboardRe1,/,2,all

;ThtoEng Capslock
StringReplace, clipboardRe1, clipboardRe1,๐,Q,all
StringReplace, clipboardRe1, clipboardRe1,",W,all
StringReplace, clipboardRe1, clipboardRe1,ฎ,E,all
StringReplace, clipboardRe1, clipboardRe1,ฑ,R,all
StringReplace, clipboardRe1, clipboardRe1,ธ,T,all
StringReplace, clipboardRe1, clipboardRe1,ณ,I,all
StringReplace, clipboardRe1, clipboardRe1,ฯ,O,all
StringReplace, clipboardRe1, clipboardRe1,ญ,P,all
StringReplace, clipboardRe1, clipboardRe1,ฤ,A,all
StringReplace, clipboardRe1, clipboardRe1,ฆ,S,all
StringReplace, clipboardRe1, clipboardRe1,ฏ,D,all
StringReplace, clipboardRe1, clipboardRe1,โ,F,all
StringReplace, clipboardRe1, clipboardRe1,ฌ,G,all
StringReplace, clipboardRe1, clipboardRe1,ษ,K,all
StringReplace, clipboardRe1, clipboardRe1,ศ,L,all
StringReplace, clipboardRe1, clipboardRe1,(,Z,all
StringReplace, clipboardRe1, clipboardRe1,),X,all
StringReplace, clipboardRe1, clipboardRe1,ฉ,C,all
StringReplace, clipboardRe1, clipboardRe1,ฮ,V,all
StringReplace, clipboardRe1, clipboardRe1,?,M,all
StringReplace, clipboardRe1, clipboardRe1,ฒ,<,all
StringReplace, clipboardRe1, clipboardRe1,ฬ,>,all
StringReplace, clipboardRe1, clipboardRe1,ฦ,?,all
StringReplace, clipboardRe1, clipboardRe1,.,",all
StringReplace, clipboardRe1, clipboardRe1,ซ,:,all
StringReplace, clipboardRe1, clipboardRe1,%Text%,},all
StringReplace, clipboardRe1, clipboardRe1,ฐ,{,all
StringReplace, clipboardRe1, clipboardRe1,๙,+,all
StringReplace, clipboardRe1, clipboardRe1,๘,_,all
StringReplace, clipboardRe1, clipboardRe1,๗,),all
StringReplace, clipboardRe1, clipboardRe1,๖,(,all
StringReplace, clipboardRe1, clipboardRe1,๕,*,all
StringReplace, clipboardRe1, clipboardRe1,฿,&,all
Percent := "%"
StringReplace, clipboardRe1, clipboardRe1,e,%rcent%,๔,all
StringReplace, clipboardRe1, clipboardRe1,๓,$,all
StringReplace, clipboardRe1, clipboardRe1,๒,#,all
StringReplace, clipboardRe1, clipboardRe1,๑,@,all
StringReplace, clipboardRe1, clipboardRe1,+,!,all
clipboard = %clipboardRe1%
StringCaseSense, OFF
if (EnableFocusChange = 1)
{
	Gui, 6: Destroy
	send, ^v
	EnableFocusChange = 0
}
return

;# Find Active Microphone Name for toogle mute mic
; https://www.autohotkey.com/boards/viewtopic.php?p=475079
; https://www.autohotkey.com/board/topic/21984-vista-audio-control-functions/

FindMicName:
MicName_list := ""
Loop
    {
        mic_state := VA_GetMasterMute("capture:" A_Index)
        if(mic_state = "")
            break
        ;VA_SetMasterMute(!mic_state, "capture:" A_Index)
        if(mic_state = 1)
            action := "Unmuted"
        else
            action := "Muted"
        device := VA_GetDevice("capture:" A_Index)
        deviceName := VA_GetDeviceName(device)
        ;msg := msg action " : " deviceName "`n"
        MicName_list := MicName_list deviceName "|"
        ObjRelease(Device)
    }
    ;MsgBox % msg
    StringTrimRight, MicName_list, MicName_list, 1
    ;MsgBox, % MicName_list
return


;# TakeScreenshot

TakeScreenshot(FileName)
; beaucoup thanks to tic (Tariq Porter) for his GDI+ Library
; https://autohotkey.com/boards/viewtopic.php?t=6517
; https://github.com/tariqporter/Gdip/raw/master/Gdip.ahk
{
		pToken:=Gdip_Startup()
		If (pToken=0)
		{
			MsgBox,4112,Fatal Error,Unable to start GDIP
		ExitApp
	}
	pBitmap:=Gdip_BitmapFromScreen()
	If (pBitmap<=0)
	{
		MsgBox,4112,Fatal Error,pBitmap=%pBitmap% trying to get bitmap from the screen
		ExitApp
	}
	Gdip_SaveBitmapToFile(pBitmap,FileName)
	If (ErrorLevel<>0)
	{
		MsgBox,4112,Fatal Error,ErrorLevel=%ErrorLevel% trying to save bitmap to`n%FileName%
		ExitApp
	}
	Return
}
; change the line below to wherever you have the downloaded GDIP source code

;From https://www.autohotkey.com/board/topic/93800-function-splashimagegui-display-splash-imagesupport-transparent-using-gui/
;From https://www.autohotkey.com/board/topic/80577-how-to-animate-a-gui-window/
SplashImageGUI(Picture, X, Y, Duration, Transparent = false)
{
	global FADE := 524288
	global SHOW := 131072
	global HIDE := 65536

	global FADE_SHOW := FADE+SHOW
	global FADE_HIDE := FADE+HIDE

	;Converting the above to Hexdecimal value

	SetFormat, Integer, Hex
	FADE_SHOW+=0 ; Converts to 0xa0000
	FADE_HIDE+=0 ; Converts to 0x90000
	SetFormat, Integer, d

	global DurationFade = 500 ; Duration of Animation in milliseconds

	Gui, XPT99:Margin , 0, 0
	Gui, XPT99:Add, Picture,, %Picture%
	Gui, XPT99:Color, ECE9D8
	Gui, XPT99:+LastFound -Caption +AlwaysOnTop +ToolWindow -Border E0x20
	If Transparent
	{
		Winset, TransColor, ECE9D8
	}
	global GUI_ID ;ประกาศตัวแปรGlobal
	GUI_ID:=WinExist() ; Handle to the GUI
	Gui, XPT99:Show, x%X% y%Y% NoActivate, Animated Window ( Fade-In / Fade-Out )
	AnimateWindow(GUI_ID, DurationFade, FADE_SHOW)
	SetTimer, DestroySplashGUI, -%Duration%
	return

	DestroySplashGUI:
		DurationFade = 1000 ; Duration of Animation in milliseconds

		AnimateWindow(GUI_ID, DurationFade, FADE_HIDE)
		Gui, XPT99:Destroy
	return
}

AnimateWindow(hWnd,Duration,Flag) {
	Return DllCall("AnimateWindow","UInt",hWnd,"Int",DurationFade,"UInt",Flag)
}

; Class CtlColors by Just me
; https://autohotkey.com/boards/viewtopic.php?f=6&t=2197


; ======================================================================================================================
; AHK 1.1+
; ======================================================================================================================
; Function:          Auxiliary object to color controls on WM_CTLCOLOR... notifications.
;                    Supported controls are: Checkbox, ComboBox, DropDownList, Edit, ListBox, Radio, Text.
;                    Checkboxes and Radios accept only background colors due to design.
; Namespace:         CtlColors
; Tested with:       1.1.25.02
; Tested on:         Win 10 (x64)
; Change log:        1.0.04.00/2017-10-30/just me  -  added transparent background (BkColor = "Trans").
;                    1.0.03.00/2015-07-06/just me  -  fixed Change() to run properly for ComboBoxes.
;                    1.0.02.00/2014-06-07/just me  -  fixed __New() to run properly with compiled scripts.
;                    1.0.01.00/2014-02-15/just me  -  changed class initialization.
;                    1.0.00.00/2014-02-14/just me  -  initial release.
; ======================================================================================================================
; This software is provided 'as-is', without any express or implied warranty.
; In no event will the authors be held liable for any damages arising from the use of this software.
; ======================================================================================================================
Class CtlColors {
   ; ===================================================================================================================
   ; Class variables
   ; ===================================================================================================================
   ; Registered Controls
   Static Attached := {}
   ; OnMessage Handlers
   Static HandledMessages := {Edit: 0, ListBox: 0, Static: 0}
   ; Message Handler Function
   Static MessageHandler := "CtlColors_OnMessage"
   ; Windows Messages
   Static WM_CTLCOLOR := {Edit: 0x0133, ListBox: 0x134, Static: 0x0138}
   ; HTML Colors (BGR)
   Static HTML := {AQUA: 0xFFFF00, BLACK: 0x000000, BLUE: 0xFF0000, FUCHSIA: 0xFF00FF, GRAY: 0x808080, GREEN: 0x008000
                 , LIME: 0x00FF00, MAROON: 0x000080, NAVY: 0x800000, OLIVE: 0x008080, PURPLE: 0x800080, RED: 0x0000FF
                 , SILVER: 0xC0C0C0, TEAL: 0x808000, WHITE: 0xFFFFFF, YELLOW: 0x00FFFF}
   ; Transparent Brush
   Static NullBrush := DllCall("GetStockObject", "Int", 5, "UPtr")
   ; System Colors
   Static SYSCOLORS := {Edit: "", ListBox: "", Static: ""}
   ; Error message in case of errors
   Static ErrorMsg := ""
   ; Class initialization
   Static InitClass := CtlColors.ClassInit()
   ; ===================================================================================================================
   ; Constructor / Destructor
   ; ===================================================================================================================
   __New() { ; You must not instantiate this class!
      If (This.InitClass == "!DONE!") { ; external call after class initialization
         This["!Access_Denied!"] := True
         Return False
      }
   }
   ; ----------------------------------------------------------------------------------------------------------------
   __Delete() {
      If This["!Access_Denied!"]
         Return
      This.Free() ; free GDI resources
   }
   ; ===================================================================================================================
   ; ClassInit       Internal creation of a new instance to ensure that __Delete() will be called.
   ; ===================================================================================================================
   ClassInit() {
      CtlColors := New CtlColors
      Return "!DONE!"
   }
   ; ===================================================================================================================
   ; CheckBkColor    Internal check for parameter BkColor.
   ; ===================================================================================================================
   CheckBkColor(ByRef BkColor, Class) {
      This.ErrorMsg := ""
      If (BkColor != "") && !This.HTML.HasKey(BkColor) && !RegExMatch(BkColor, "^[[:xdigit:]]{6}$") {
         This.ErrorMsg := "Invalid parameter BkColor: " . BkColor
         Return False
      }
      BkColor := BkColor = "" ? This.SYSCOLORS[Class]
              :  This.HTML.HasKey(BkColor) ? This.HTML[BkColor]
              :  "0x" . SubStr(BkColor, 5, 2) . SubStr(BkColor, 3, 2) . SubStr(BkColor, 1, 2)
      Return True
   }
   ; ===================================================================================================================
   ; CheckTxColor    Internal check for parameter TxColor.
   ; ===================================================================================================================
   CheckTxColor(ByRef TxColor) {
      This.ErrorMsg := ""
      If (TxColor != "") && !This.HTML.HasKey(TxColor) && !RegExMatch(TxColor, "i)^[[:xdigit:]]{6}$") {
         This.ErrorMsg := "Invalid parameter TextColor: " . TxColor
         Return False
      }
      TxColor := TxColor = "" ? ""
              :  This.HTML.HasKey(TxColor) ? This.HTML[TxColor]
              :  "0x" . SubStr(TxColor, 5, 2) . SubStr(TxColor, 3, 2) . SubStr(TxColor, 1, 2)
      Return True
   }
   ; ===================================================================================================================
   ; Attach          Registers a control for coloring.
   ; Parameters:     HWND        - HWND of the GUI control                                   
   ;                 BkColor     - HTML color name, 6-digit hexadecimal RGB value, or "" for default color
   ;                 ----------- Optional 
   ;                 TxColor     - HTML color name, 6-digit hexadecimal RGB value, or "" for default color
   ; Return values:  On success  - True
   ;                 On failure  - False, CtlColors.ErrorMsg contains additional informations
   ; ===================================================================================================================
   Attach(HWND, BkColor, TxColor := "") {
      ; Names of supported classes
      Static ClassNames := {Button: "", ComboBox: "", Edit: "", ListBox: "", Static: ""}
      ; Button styles
      Static BS_CHECKBOX := 0x2, BS_RADIOBUTTON := 0x8
      ; Editstyles
      Static ES_READONLY := 0x800
      ; Default class background colors
      Static COLOR_3DFACE := 15, COLOR_WINDOW := 5
      ; Initialize default background colors on first call -------------------------------------------------------------
      If (This.SYSCOLORS.Edit = "") {
         This.SYSCOLORS.Static := DllCall("User32.dll\GetSysColor", "Int", COLOR_3DFACE, "UInt")
         This.SYSCOLORS.Edit := DllCall("User32.dll\GetSysColor", "Int", COLOR_WINDOW, "UInt")
         This.SYSCOLORS.ListBox := This.SYSCOLORS.Edit
      }
      This.ErrorMsg := ""
      ; Check colors ---------------------------------------------------------------------------------------------------
      If (BkColor = "") && (TxColor = "") {
         This.ErrorMsg := "Both parameters BkColor and TxColor are empty!"
         Return False
      }
      ; Check HWND -----------------------------------------------------------------------------------------------------
      If !(CtrlHwnd := HWND + 0) || !DllCall("User32.dll\IsWindow", "UPtr", HWND, "UInt") {
         This.ErrorMsg := "Invalid parameter HWND: " . HWND
         Return False
      }
      If This.Attached.HasKey(HWND) {
         This.ErrorMsg := "Control " . HWND . " is already registered!"
         Return False
      }
      Hwnds := [CtrlHwnd]
      ; Check control's class ------------------------------------------------------------------------------------------
      Classes := ""
      WinGetClass, CtrlClass, ahk_id %CtrlHwnd%
      This.ErrorMsg := "Unsupported control class: " . CtrlClass
      If !ClassNames.HasKey(CtrlClass)
         Return False
      ControlGet, CtrlStyle, Style, , , ahk_id %CtrlHwnd%
      If (CtrlClass = "Edit")
         Classes := ["Edit", "Static"]
      Else If (CtrlClass = "Button") {
         IF (CtrlStyle & BS_RADIOBUTTON) || (CtrlStyle & BS_CHECKBOX)
            Classes := ["Static"]
         Else
            Return False
      }
      Else If (CtrlClass = "ComboBox") {
         VarSetCapacity(CBBI, 40 + (A_PtrSize * 3), 0)
         NumPut(40 + (A_PtrSize * 3), CBBI, 0, "UInt")
         DllCall("User32.dll\GetComboBoxInfo", "Ptr", CtrlHwnd, "Ptr", &CBBI)
         Hwnds.Insert(NumGet(CBBI, 40 + (A_PtrSize * 2, "UPtr")) + 0)
         Hwnds.Insert(Numget(CBBI, 40 + A_PtrSize, "UPtr") + 0)
         Classes := ["Edit", "Static", "ListBox"]
      }
      If !IsObject(Classes)
         Classes := [CtrlClass]
      ; Check background color -----------------------------------------------------------------------------------------
      If (BkColor <> "Trans")
         If !This.CheckBkColor(BkColor, Classes[1])
            Return False
      ; Check text color -----------------------------------------------------------------------------------------------
      If !This.CheckTxColor(TxColor)
         Return False
      ; Activate message handling on the first call for a class --------------------------------------------------------
      For I, V In Classes {
         If (This.HandledMessages[V] = 0)
            OnMessage(This.WM_CTLCOLOR[V], This.MessageHandler)
         This.HandledMessages[V] += 1
      }
      ; Store values for HWND ------------------------------------------------------------------------------------------
      If (BkColor = "Trans")
         Brush := This.NullBrush
      Else
         Brush := DllCall("Gdi32.dll\CreateSolidBrush", "UInt", BkColor, "UPtr")
      For I, V In Hwnds
         This.Attached[V] := {Brush: Brush, TxColor: TxColor, BkColor: BkColor, Classes: Classes, Hwnds: Hwnds}
      ; Redraw control -------------------------------------------------------------------------------------------------
      DllCall("User32.dll\InvalidateRect", "Ptr", HWND, "Ptr", 0, "Int", 1)
      This.ErrorMsg := ""
      Return True
   }
   ; ===================================================================================================================
   ; Change          Change control colors.
   ; Parameters:     HWND        - HWND of the GUI control
   ;                 BkColor     - HTML color name, 6-digit hexadecimal RGB value, or "" for default color
   ;                 ----------- Optional 
   ;                 TxColor     - HTML color name, 6-digit hexadecimal RGB value, or "" for default color
   ; Return values:  On success  - True
   ;                 On failure  - False, CtlColors.ErrorMsg contains additional informations
   ; Remarks:        If the control isn't registered yet, Add() is called instead internally.
   ; ===================================================================================================================
   Change(HWND, BkColor, TxColor := "") {
      ; Check HWND -----------------------------------------------------------------------------------------------------
      This.ErrorMsg := ""
      HWND += 0
      If !This.Attached.HasKey(HWND)
         Return This.Attach(HWND, BkColor, TxColor)
      CTL := This.Attached[HWND]
      ; Check BkColor --------------------------------------------------------------------------------------------------
      If (BkColor <> "Trans")
         If !This.CheckBkColor(BkColor, CTL.Classes[1])
            Return False
      ; Check TxColor ------------------------------------------------------------------------------------------------
      If !This.CheckTxColor(TxColor)
         Return False
      ; Store Colors ---------------------------------------------------------------------------------------------------
      If (BkColor <> CTL.BkColor) {
         If (CTL.Brush) {
            If (Ctl.Brush <> This.NullBrush)
               DllCall("Gdi32.dll\DeleteObject", "Prt", CTL.Brush)
            This.Attached[HWND].Brush := 0
         }
         If (BkColor = "Trans")
            Brush := This.NullBrush
         Else
            Brush := DllCall("Gdi32.dll\CreateSolidBrush", "UInt", BkColor, "UPtr")
         For I, V In CTL.Hwnds {
            This.Attached[V].Brush := Brush
            This.Attached[V].BkColor := BkColor
         }
      }
      For I, V In Ctl.Hwnds
         This.Attached[V].TxColor := TxColor
      This.ErrorMsg := ""
      DllCall("User32.dll\InvalidateRect", "Ptr", HWND, "Ptr", 0, "Int", 1)
      Return True
   }
   ; ===================================================================================================================
   ; Detach          Stop control coloring.
   ; Parameters:     HWND        - HWND of the GUI control
   ; Return values:  On success  - True
   ;                 On failure  - False, CtlColors.ErrorMsg contains additional informations
   ; ===================================================================================================================
   Detach(HWND) {
      This.ErrorMsg := ""
      HWND += 0
      If This.Attached.HasKey(HWND) {
         CTL := This.Attached[HWND].Clone()
         If (CTL.Brush) && (CTL.Brush <> This.NullBrush)
            DllCall("Gdi32.dll\DeleteObject", "Prt", CTL.Brush)
         For I, V In CTL.Classes {
            If This.HandledMessages[V] > 0 {
               This.HandledMessages[V] -= 1
               If This.HandledMessages[V] = 0
                  OnMessage(This.WM_CTLCOLOR[V], "")
         }  }
         For I, V In CTL.Hwnds
            This.Attached.Remove(V, "")
         DllCall("User32.dll\InvalidateRect", "Ptr", HWND, "Ptr", 0, "Int", 1)
         CTL := ""
         Return True
      }
      This.ErrorMsg := "Control " . HWND . " is not registered!"
      Return False
   }
   ; ===================================================================================================================
   ; Free            Stop coloring for all controls and free resources.
   ; Return values:  Always True.
   ; ===================================================================================================================
   Free() {
      For K, V In This.Attached
         If (V.Brush) && (V.Brush <> This.NullBrush)
            DllCall("Gdi32.dll\DeleteObject", "Ptr", V.Brush)
      For K, V In This.HandledMessages
         If (V > 0) {
            OnMessage(This.WM_CTLCOLOR[K], "")
            This.HandledMessages[K] := 0
         }
      This.Attached := {}
      Return True
   }
   ; ===================================================================================================================
   ; IsAttached      Check if the control is registered for coloring.
   ; Parameters:     HWND        - HWND of the GUI control
   ; Return values:  On success  - True
   ;                 On failure  - False
   ; ===================================================================================================================
   IsAttached(HWND) {
      Return This.Attached.HasKey(HWND)
   }
}
; ======================================================================================================================
; CtlColors_OnMessage
; This function handles CTLCOLOR messages. There's no reason to call it manually!
; ======================================================================================================================
CtlColors_OnMessage(HDC, HWND) {
   Critical
   If CtlColors.IsAttached(HWND) {
      CTL := CtlColors.Attached[HWND]
      If (CTL.TxColor != "")
         DllCall("Gdi32.dll\SetTextColor", "Ptr", HDC, "UInt", CTL.TxColor)
      If (CTL.BkColor = "Trans")
         DllCall("Gdi32.dll\SetBkMode", "Ptr", HDC, "UInt", 1) ; TRANSPARENT = 1
      Else
         DllCall("Gdi32.dll\SetBkColor", "Ptr", HDC, "UInt", CTL.BkColor)
      Return CTL.Brush
   }
}

;# Library
/* Written by Masonjar13

	Set the volume of a given WinTitle. This is equivalent to
	opening the volume mixer and changing an applications volume.

	Dependencies:
		VA
-----------------

	Parameters:
---------------
	winName (optional): winTitle of any window, defaults to active
	
	vol: volume level between 0-100; can be + or - prefixed to step
---------------

	Example:
------------
setWindowVol("ahk_exe vlc.exe",50) ; set it to 50%
setWindowVol("ahk_exe vlc.exe","+10") ; set it to +10 percent of its current volume
setWindowVol("ahk_exe vlc.exe","-10") ; set it to -10 percent of its current volume
------------
*/
setWindowVol(winName:="a",vol:="n"){
	if (vol=="n")
		return
	winGet,winPid,PID,% winName
	if !(volume:=GetVolumeObject(winPid))
		return
	vsign:=subStr(vol,1,1)
	if (vsign="+"||vsign="-") {
		vol:=subStr(vol,2),vol/=100
		
		VA_ISimpleAudioVolume_GetMasterVolume(volume,cvol)
		if (vsign="+")
			vol:=cvol+vol>1?1:cvol+vol
		else if (vsign="-")
			vol:=cvol-vol<0?0:cvol-vol
	} else
		vol/=100.0
	VA_ISimpleAudioVolume_SetMasterVolume(volume,vol),objRelease(volume)
}