#SingleInstance Force
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
#NoTrayIcon
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

quote = "
apostrophe = '

/*
Gui 2 Main
Gui 1 Mic Main
Gui 4 Mic Discord
Gui 3 FindMicID
Gui 5 Fast Note
v16 เพิ่ม Feature Possibility
แก้บัคSave
เพิ่ม Time to Click

v16.2. คลิกขวาค้าง
ลบการเปลี่ยนภาษา auto หากกำลัง planting ใน valorant

v17 Sync Mic

v17.1 แก้บัค sync และ เนิฟ Poss to Med
จำกัดตัวหนังสือที่พิมพ์ได้ในช่องเวลา

v17.2 แก้บัค chrome

v17.4 แก้บัค sync ไม่ sync push to talk

v17.5 แก้บัค time to click

v17.6 แก้บัค ไม่ดึงข้อมูล

v18 Idle = mute
Reorder การเปลี่ยนภาษา

v18.1 แก้บค + มีเสียง

v18.2 Alt+Shift+Q เพื่อmove โดยmouse

v18.3 แก้บัค คลิกขวาค้าง
แก้บัค ไม่ดึงข้อมูล

v18.5 แก้บัคดึงข้อมูลทั้งหมด
AutoCollapseBookmarkBar
บัค Idle Checking

v18.6 แก้บัคAutoCollapseBookmarkBar ตั้งค่าไม่ติด

v18.7 แก้บัค Check Idle หายเมื่อปิด GUI
AutoCollapseBookmarkBar improve
Fast Note Time Stamp in text

v18.8 improve ให้ AutoCollapseBookmarkBar ดีขึ้น
Improve ประสิทธิภาพ RAltให้กดรัวได้ และ RCtrlให้ตรงกับ Discord
Improve action จากการกดคลิกซ้ายให้ทำได้เร็ว และรัวขึ้น
Auto check mic discord ให้ตรงกัน เมื่อคลิกที่window discord
save ค่าตัวแปรmic discord

v18.9
Time Stamp for MKV file, Youtube
แก้บัค Fast Note แสดง ผลผิดพลาด
เพิ่ม Long RButton to Addition menu มีSearch with ...
Improve การเปลี่ยนภาษา

v19 Splash screen

v19.1 Dark Mode

v19.2 แก้บัค AutoCollapseBookmarkBar
แก้บัค Auto check mic discord
Youtube Music Extension miniplayer

v19.4 รองรับ Discord เต็มจอ

v19.5 StopWatch จาก Dark mode

v19.6 Shortcut GUI6 Hotkey

v19.7 เพิ่มHotkey ของ GUI6
clickด้านล่าง เพื่อปิดbookmark

v19.8 fix bug ของ clickด้านล่าง เพื่อปิดbookmark

v19.9 พยายามให้ gui 1,4 focus ไม่ได้

;19.11 ซ่อน Gui 1,4 ชั่วคราว
แก้บัค Mic ตาม disocrd

v20 Splash เปลี่ยนภาษา move win และ game limit alert
green border สำหรับ ontop window

v20.1 เพิ่ม splash และแก้บัค clickด้านล่าง เพื่อปิดbookmark ปรับAutoCollapseBookmarkBar เป็นแบบคลิก แก้กลับได้โดยเปลี่ยน เลข interval settimer กลับเป็น 400 และเอา ก่อน return ของ Settimer ออก

v20.2 แก้บัค work

v21 แก้บัค idle checking

v21.1 หยุดใช้ foobar2000 เล่นเสียง

v22 ใช้ SoundVolumeView.exe เพิ่มลดเสียง audiorelay-backend.exe ตาม master vol

v22.1 แก้บัค

v22.2 AutoCollapseBookmarkBar แก้ ให้ไม่ทำงานใน .pdf

v23 แก้Bug Detect mic discord, เปลี่ยนภาษาไม่ตรง เพิ่ม onclipboaardchange, autohidetooltip

v23.1 Gui 2 Main ใช้การซ่อนแทน Destroy
แก้บัค Clipboard empty แต้ขึ้น... และการจำกัดจำนวนตัว แม้ไม่เกินขีดจำกัดแต่มี ... มาท้าย และแทนที่ `r`n ด้วย %A_Space% ใน String เพื่อกันขึ้นบรรทัดใหม่
ซ่อน Tooltip และปิด LangBar ชั่วคราว ถ้าจอที่ Tooltip อยู่เต็มหน้าจอ และกลับมาแสดงเองเมื่อนอกเงื่อนไข
เพิ่มให้แสดง10ตัวท้ายของ clipboard

v23.1.1 แก้บัค ไม่เล่นเสียงผ่าน Foobar200 ทั้งหมด

v23.1.2 Support Password Mangaer clear clipboard history
แก้ไข LastRun ให้เป็นวันที่เริ่ม Program ไม่ใช่วันที่ปิดโปรแกรม

v23.1.3 ไม่ยึด RAlt แล้ว
*/
;ดึงข้อมูลของ UHotkey

IniRead, LastRun, UHotkey.ini, Initialization, SaveLastRun
IniRead, MICID, UHotkey.ini, Initialization, SaveMICID
IniRead, P_Med, UHotkey.ini, Initialization, SaveP_Med
IniRead, turn, UHotkey.ini, Initialization, saveturn
IniRead, dismic, UHotkey.ini, Initialization, savedismic
IniRead, Dark_Mode, UHotkey.ini, Initialization, saveDark_Mode
IniRead, NotiPopup, UHotkey.ini, Initialization, saveNotiPopup
IniRead, DailySiteCheckIn, UHotkey.ini, Initialization, saveDailySiteCheckIn
IniRead, DailySiteCheckInBrowser, UHotkey.ini, Initialization, saveDailySiteCheckInBrowser
IniRead, DetectDiscordMic, UHotkey.ini, Initialization, saveDetectDiscordMic
IniRead, TimeIdleCheck, UHotkey.ini, Initialization, saveTimeIdleCheck
if (saveDark_Mode=="ERROR")
{
    Dark_Mode = 0
}
if (saveNotiPopup=="ERROR")
{
    NotiPopup = 0
}
if (saveturn=="ERROR")
{
    turn = 1
}
if (savedismic=="ERROR")
{
    dismic = 1
}
if (saveDailySiteCheckIn=="ERROR")
{
    DailySiteCheckIn = 
}
if (saveDailySiteCheckInBrowser=="ERROR")
{
    DailySiteCheckInBrowser = 
}
if (saveDetectDiscordMic=="ERROR")
{
    dismic = 1
}
if (saveTimeIdleCheck=="ERROR")
{
    TimeIdleCheck = 1
}
#Include D:\Autohotkey\Gdip_All.ahk
#Include D:\Autohotkey\Class_ImageButton.ahk
#Include D:\Autohotkey\UseGDIP.ahk

CoordMode, Mouse, Screen
CoordMode, ToolTip, Screen
CoordMode, Pixel, Screen
SoundSet, 100, MASTER, Mute,%MICID%
SoundSet, 100, MASTER, Mute,%MICID%

;https://www.autohotkey.com/boards/viewtopic.php?t=73197 ต้นฉบับ Border
;;https://www.autohotkey.com/boards/viewtopic.php?f=6&p=374876#p374876 Border ที่ใช้
Enabled := ComObjError(false)
;#include %A_ScriptDir%\Dock.ahk
GuiArray := Object()
Colors := ["0x3DFF00", "0xFFE900", "0x00FFF4", "0xFF00FF"]

SplashImage = %A_ScriptDir%\UHotkey Splash.png
if FileExist(SplashImage)
{
    SplashImageGUI(SplashImage, "Center", "Center", 5000, False)
}


;Dark Mode---------------------------
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
;----------------------------------------

;Shortcut Mute Unmute Mic 2 GUI
;--------------------------Default Variable----------------------------
SetTitleMatchMode,2
leftMonitorWidth = 1920
leftMonitorHeight = 1200
rightMonitorWidth = 1920
rightMonitorHeight = 1080
gui5 = 0 ;ปิดFast Note Gui
mic = 1 ;ค่าdefaultเป็นปิด
Time_Click = 0 ;ค่าdefaultเป็นปิด
P_Med_Work = 1 ;ค่าdefaultเป็นปิด
enablestopwatch = 0 ;ปิดเป็นค่าdefault
stopwatchworking = 0 ;ปิดเป็นค่าdefault
bookmarktab_on = 0 ;ปิดเป็นค่าdefault
autocollapsebookmarkbar = 1 ;เปิดเป็นค่าdefault
bookmarktab_onaction = 0;ปิดเป็นค่าdefault
SyncMic = 0;ปิดเป็นค่าdefault
EnablePushtotalk = 1 ;เปิดเป็นค่าdefault
S_HH =0 ;0เป็นค่าdefault
S_MM =00 ;00เป็นค่าdefault
S_SS =00 ;00เป็นค่าdefault
EnableFocusChange = 0 ;0เป็นค่าdefault
stopbookmarkcheck = 0 ;0เป็นค่าdefault
WaitForReturnLangBar = 0 ;0เป็นค่าdefault

;Button Class_Imagebutton
IBBtnStyles := [ [0, 0x801E1E1E, , 0xFFFFFFFF, 0, , 0x848484, 1]      ; normal
			   , [0, 0x80515151, , 0xFFFFFFFF, 0, , 0x848484, 1]      ; hover
			   , [0, 0x80777777, , 0xFFFFFFFF, 0, , 0x848484, 1]      ; pressed
			   , [0, 0x80000000, , 0x717171, 0, , 0x717171, 1] ]
;hWndhBtn1
;ImageButton.Create(hBtn1, IBBtnStyles*)

if (turn = "")
{
    turn = 1
}
guimain = 0 
;ไม่ได้สร้างMain GUI
guifindmic = 0 
;ไม่ได้สร้าง GUI
;-----------------------------------------------------------------------------
;--------------------------Create Mic Indicator GUI---------------------
Gui, 1: -SysMenu +AlwaysOnTop -Caption +Owner +E0x08000000
Gui, 1: Show, x-4 y1076 w8 h4, WindowMute NoActivate
Gui, 1: Color, FF0000
Gui, 4: -SysMenu +AlwaysOnTop -Caption +Owner +E0x08000000
Gui, 4: Show, x-4 y1072 w8 h2, DiscordMute NoActivate
if (dismic = 1)
{
    Gui, 4: Color, 1BFF00
}
Else if (dismic = 0)
{
    Gui, 4: Color, FF0000
}
;-----------------------------------------------------------------------------
;--------------------------Auto Run---------------------
if (A_DD != LastRun)
{
    Run, %DailySiteCheckInBrowser%,,UseErrorLevel
    if (ErrorLevel = "ERROR")
    {
        ToolTip, Error to run browser, -30, 1028, 2
    }
    sleep 2000
    Run, %DailySiteCheckIn%,,UseErrorLevel
    if (ErrorLevel = "ERROR")
    {
        ToolTip, Error to go to daily check-in site, -30, 1028, 2
    }
    ;gosub, waittoclicklogin
}
LastRun = %A_DD%
GuiControl,2:, DailySiteCheckIn_Text, DailySiteCheckIn | Today checked
gosub, Save
SetTimer ,Loop, 5000

SetTimer ,DisappearIndicator, 20
return
 
DisappearIndicator:
{
    CoordMode, Mouse, Screen
	MouseGetPos, IndiMouseX, IndiMouseY,
	if( -1 < IndiMouseX && IndiMouseX < 15) && (1065 < IndiMouseY && IndiMouseY < 1081)
    {
		Gui, 1: -AlwaysOnTop
        Gui, 4: -AlwaysOnTop
	}
    Else{
        Settimer, MicIndicatorOnTop, 1
    }
}
Return
;-----------------------------------------------------------------------------
;UI
;--------------------------Create Main GUI---------------------------
PgUp & PgDn::
    if (guimain = 0)
    {
        CoordMode, Mouse, Screen
        MouseGetPos, x5, y5

        ;---Dark theme---
        if (Dark_Mode = 1)
        {
            Gui, 2: Color, 1E1E1E
            Gui, 2: Font, c0xFFFFFF
        }
        ;------
    
        x6 := x5 - 250
        y6 := y5 - 200
        guimain = 1
        ;Gui, 2: +AlwaysOnTop
        Gui, 2: Add, Groupbox, x3 y1 w210 h210, In the main UI
        Gui, 2: Add, Button, x20 y20 w80 h30 gTurnScreenOff hWndhBtn1, TurnMonitorOff
        if (Dark_Mode = 1)
            ImageButton.Create(hBtn1, IBBtnStyles*)
        Gui, 2: Add, Text, x8 y29 w10 h12, 1
        if (turn = 0)
        {
            Gui, 2: Add, Button, x20 y50 w80 h30 gTurnLangbar vTurnLang hWndhBtn1, Turn Language noti OFF
            ;if (Dark_Mode = 1)
            ;ImageButton.Create(hBtn1, IBBtnStyles*)
        }
        else
        {
            Gui, 2: Add, Button, x20 y50 w80 h30 gTurnLangbar vTurnLang hWndhBtn1, Turn Language noti On
            ;if (Dark_Mode = 1)
            ;ImageButton.Create(hBtn1, IBBtnStyles*)
        }
        Gui, 2: Add, Text, x8 y59 w10 h12, 2
        Gui, 2: Add, Button, x20 y80 w80 h30 gFindIDmic hWndhBtn1, Find ID of Mic
        if (Dark_Mode = 1)
            ImageButton.Create(hBtn1, IBBtnStyles*)
        Gui, 2: Add, Text, x8 y89 w10 h12, 3
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
        Gui, 2: Add, Text, x220 y98 w350 h17 vTimeIdle,TimeIdleKey : 0 sec, TimeIdleMouse : 0 sec
        if (TimeIdleCheck = 1)
        {
            Gui, 2: Add, CheckBox, x220 y115 w350 h17 vTimeIdleCheck +Checked gac_idle_checking,Idle checking - AutoMuteMic
        }
        else
        {
            Gui, 2: Add, CheckBox, x220 y115 w350 h17 vTimeIdleCheck gac_idle_checking,Idle checking - AutoMuteMic
        }
        Gui, 2: Add, Button, x120 y140 w40 h30 gLA1 hWndhBtn1,เรียง LA1
        if (Dark_Mode = 1)
            ImageButton.Create(hBtn1, IBBtnStyles*)
        Gui, 2: Add, Button, x160 y140 w40 h30 gLA2 hWndhBtn1,เรียง LA2
        if (Dark_Mode = 1)
            ImageButton.Create(hBtn1, IBBtnStyles*)

        if (autocollapsebookmarkbar = 1)
        {
            Gui, 2: Add, Checkbox, x117 y177 w86 h23 +checked gAc_AutoCollapseBookmarkBar vautocollapsebookmarkbar, AutoCollapseBookmarkBar
        }
        else
        {
            Gui, 2: Add, Checkbox, x117 y177 w86 h23 gAc_AutoCollapseBookmarkBar vautocollapsebookmarkbar, AutoCollapseBookmarkBar
        }

        Gui, 2: Add, Groupbox, x220 y1 w250 h90, Hotkey
        /*
        Gui, 2: Add, Button, x226 y20 w240 h15 +Disabled hWndhBtn1,PageUp+PageDown = Open Main GUI
        if (Dark_Mode = 1)
            ImageButton.Create(hBtn1, IBBtnStyles*)
        Gui, 2: Add, Button, x226 y35 w240 h15 +Disabled hWndhBtn1,Alt+Shift+Arrow = MoveWindowToDirection
        if (Dark_Mode = 1)
            ImageButton.Create(hBtn1, IBBtnStyles*)
        Gui, 2: Add, Button, x226 y90 w240 h15 +Disabled hWndhBtn1,Alt+Shift+A = Toggle Always On Top
        if (Dark_Mode = 1)
            ImageButton.Create(hBtn1, IBBtnStyles*)
        Gui, 2: Add, Button, x226 y105 w240 h15 +Disabled hWndhBtn1,Alt+Shift+B = Make Window to Backward
        if (Dark_Mode = 1)
            ImageButton.Create(hBtn1, IBBtnStyles*)
        Gui, 2: Add, Button, x226 y120 w240 h15 +Disabled hWndhBtn1,Alt+Shift+E = Minimum Window
        if (Dark_Mode = 1)
            ImageButton.Create(hBtn1, IBBtnStyles*)
        Gui, 2: Add, Button, x226 y1355 w240 h15 +Disabled hWndhBtn1,Alt+Shift+R = Move Window to another monitor
        if (Dark_Mode = 1)
            ImageButton.Create(hBtn1, IBBtnStyles*)
        */

        Gui, 2: Add, Text, x228 y28 w18 h25, Alt
        Gui, 2: Add, Button, x244 y20 w80 h30 gClickMic vClickMic hWndhBtn1,%Showmic%
        ;if (Dark_Mode = 1)
            ;ImageButton.Create(hBtn1, IBBtnStyles*)
        Gui, 2: Add, Edit, x245 y50 w78 h30 limit2 vMICID gAc_MICID_Change hwndedit1,%MICID%
        if (Dark_Mode = 1)
            CtlColors.Attach(edit1, "1E1E1E", "FFFFFF")
        Gui, 2: Add, Text, x227 y53 w18 h25, Mic ID
        if (mic = 1 )
        {
            GuiControl,2:, ClickMic, Toggle mic is OFF
            GuiControl,2: Disable,MICID
        }
        else
        {
            GuiControl,2:, ClickMic, Toggle mic is ON
            GuiControl,2: Enable,MICID
        }

        if (EnablePushtotalk=1)
        {
            Gui, 2: Add, Checkbox, x331 y16 w120 h23 +checked gAcEnablePushtotalk vEnablePushtotalk, Enable Push to talk
        }
        else
        {
            Gui, 2: Add, Checkbox, x331 y16 w120 h23 gAcEnablePushtotalk vEnablePushtotalk, Enable Push to talk
        }

        if (SyncMic=1)
        {
            Gui, 2: Add, Checkbox, x331 y33 w137 h23 +checked gAcSyncMic vSyncMic, SyncDiscordAndPC'sMic
        }
        else
        {
            Gui, 2: Add, Checkbox, x331 y33 w137 h23 gAcSyncMic vSyncMic, SyncDiscordAndPC'sMic
        }

        if (DetectDiscordMic=1)
        {
            Gui, 2: Add, Checkbox, x331 y50 w137 h23 +checked gAcDetectDiscordMic vDetectDiscordMic, DetectDiscordMic
        }
        else
        {
            Gui, 2: Add, Checkbox, x331 y50 w137 h23 gAcDetectDiscordMic vDetectDiscordMic, DetectDiscordMic
        }
        
        if (A_DD = LastRun)
        {
            Gui, 2: Add, Groupbox, x220 y134 w250 h77, DailySiteCheckIn | Today checked
        }
        Else if (A_DD = LastRun + 1)
        {
            Gui, 2: Add, Groupbox, x220 y134 w250 h77 vDailySiteCheckIn_Text, DailySiteCheckIn | Yesterday is the lastest
        }
        Else
        {
            Gui, 2: Add, Groupbox, x220 y134 w250 h77 vDailySiteCheckIn_Text, DailySiteCheckIn
        }
        
        Gui, 2: Add, Text, x228 y157 w18 h25, Url
        Gui, 2: Add, Edit, x247 y153 w212 h22 vDailySiteCheckIn gAc_DailySiteCheckIn hwndedit1,%DailySiteCheckIn%
        if (Dark_Mode = 1)
            CtlColors.Attach(edit1, "1E1E1E", "FFFFFF")

        Gui, 2: Add, Text, x225 y183 w25 h25, Path
        Gui, 2: Add, Edit, x247 y179 w212 h22 vDailySiteCheckInBrowser gAc_DailySiteCheckInBrowser hwndedit1,%DailySiteCheckInBrowser%
        if (Dark_Mode = 1)
            CtlColors.Attach(edit1, "1E1E1E", "FFFFFF")

        Gui, 2: Add, Button, x470 y1 w30 h30 gExitPro hWndhBtn1, Exit
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

        ;Gui, 2: Add, Groupbox, x3 y250 w250 h50, Aim
        ;Gui, 2: Add, Text, x10 y267 w150 h15 vP_OutMed, Possibility to be Med : %P_Med%
        ;Gui, 2: Add, Button, x10 y300 w30 h30 gAc_P_Med, Start
        ;if (P_Med_Work=1)
        ;{
            ;Gui, 2: Add, Checkbox, x160 y262 w80 h23 +checked vP_Med_Work gAc_Med_Work, Work?
        ;}
        ;else
        ;{
            ;Gui, 2: Add, Checkbox, x160 y262 w80 h23 vP_Med_Work gAc_Med_Work, Work?
        ;}
/*
        Gui, 2: Add, Groupbox, x3 y300 w150 h50, Time to LClick
        Gui, 2: Add, Text, x7 y317 w20 h15,HH:
        Gui, 2: Add, Edit, x28 y315 w18 h15 limit2 gAc_TClick_HH vTClick_HH hwndedit1,00
        if (Dark_Mode = 1)
            CtlColors.Attach(edit1, "1E1E1E", "FFFFFF")

        Gui, 2: Add, Text, x50 y317 w20 h15,MM:
        Gui, 2: Add, Edit, x73 y315 w18 h15 limit2 gAc_TClick_MM vTClick_MM hwndedit1,00
        if (Dark_Mode = 1)
            CtlColors.Attach(edit1, "1E1E1E", "FFFFFF")
            
        if (Vari_TClick = 0)
        {
            Gui, 2: Add, Button, x100 y310 w47 h30 gAc_TClick vVari_TClick hWndhBtn1,Working
            ;if (Dark_Mode = 1)
            ;ImageButton.Create(hBtn1, IBBtnStyles*)
        }
        else
        {
            Gui, 2: Add, Button, x100 y310 w47 h30 gAc_TClick vVari_TClick hWndhBtn1,Stopped
            ;if (Dark_Mode = 1)
            ;ImageButton.Create(hBtn1, IBBtnStyles*)
        }
*/
        if (Dark_Mode =1)
        {
            Gui, 2: Add, Checkbox, x410 y410 w80 h23 +checked gAc_Dark_Mode vDark_Mode, Dark Mode
        }
        else
        {
            Gui, 2: Add, Checkbox, x410 y410 w80 h23 gAc_Dark_Mode vDark_Mode, Dark Mode
        }

        if (NotiPopup =1)
        {
            Gui, 2: Add, Checkbox, x320 y410 w80 h23 +checked gAc_NotiPopup vNotiPopup, NotiPopup
        }
        else
        {
            Gui, 2: Add, Checkbox, x320 y410 w80 h23 gAc_NotiPopup vNotiPopup, NotiPopup
        }

        ;if (ClearClipHistoryWhenPasswordManagerAutoclearclipboard =1)
        ;{
            ;Gui, 2: Add, Checkbox, x120 y410 w180 h23 +checked gAc_ClearClipHistoryWhenPasswordManagerAutoclearclipboard vClearClipHistoryWhenPasswordManagerAutoclearclipboard, ClearClipHistoryWhenPasswordManagerAutoclearclipboard
        ;}
        ;else
        ;{
            ;Gui, 2: Add, Checkbox, x120 y410 w180 h23 gAc_ClearClipHistoryWhenPasswordManagerAutoclearclipboard vClearClipHistoryWhenPasswordManagerAutoclearclipboard, ClearClipHistoryWhenPasswordManagerAutoclearclipboard
        ;}

        Gui, 2: Show, w500 h440 x%x6% y%y6%, UniHotkey v24.3
        ;gosub, Ac_P_Med
    }
    else
    {
        CoordMode, Mouse, Screen
        MouseGetPos, x5, y5
        x6 := x5 - 250
        y6 := y5 - 200
        Gui, 2: Show, w500 h440 x%x6% y%y6%,
    }
return
;-----------------------------------------------------------------------------
Loop:
SetTitleMatchMode,2
if (guimain = 1)
{
    Sec_TimeIdleMou := A_TimeIdleMouse/1000
    Sec_TimeIdleKey := A_TimeIdleKeyboard/1000
    Sec_TimeIdleKey := % Format("{:.3f}",Sec_TimeIdleKey)
    Sec_TimeIdleMou := % Format("{:.3f}",Sec_TimeIdleMou)
    GuiControl,2:, TimeIdle, TimeIdleKey : %Sec_TimeIdleKey% sec, TimeIdleMouse : %Sec_TimeIdleMou% sec
}
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
            ToolTip, Idle mode will turn on in %count% s. Move mouse to cancel, -30, 1028, 2
            count := count-1
        }
        sleep 100
        if (A_TimeIdleKeyboard < 120000 || A_TimeIdleMouse < 120000)
        {
            ToolTip,,,,1
            return
        }
        if (count <= 0)
        {
            Tooltip,
            if (mic = 0)
            {
                SoundSet, 100, MASTER, Mute,%MICID%
                Gui, 1: Color, FF0000
                SoundPlay, %A_ScriptDir%\mute.wav
                ;run C:\Program Files (x86)\foobar2000\foobar2000.exe /immediate /play "%A_ScriptDir%\mute.wav" /hide 
                mic = 1
            }
            loop 
            {
                sleep 5000
                if (guimain = 1)
                {
                    Sec_TimeIdleMou := A_TimeIdleMouse/1000
                    Sec_TimeIdleKey := A_TimeIdleKeyboard/1000
                    Sec_TimeIdleKey := % Format("{:.3f}",Sec_TimeIdleKey)
                    Sec_TimeIdleMou := % Format("{:.3f}",Sec_TimeIdleMou)
                    GuiControl,2:, TimeIdle, TimeIdleKey : %Sec_TimeIdleKey% sec, TimeIdleMouse : %Sec_TimeIdleMou% sec
                }
                if (A_TimeIdleKeyboard < 120000 || A_TimeIdleMouse < 120000)
                {
                    Tooltip,
                    break
                }
            }
        }
    }
    if (mic = 0)
    {
        return
    }
    Return
}
Gui 2:Default
GuiControlGet, P_Med_Work
if(P_Med_Work = 1)
{
    if WinActive("Genshin Impact") || WinActive("VALORANT") || WinActive("Facebook") || WinActive("Tower of Fantasy")
    {
        if (P_Med>0)
        {
            P_Med := P_Med - 15
            if (P_Med<0)
            {
                P_Med := 0
            }
            GuiControl,2:, P_OutMed,Possibility to be Med : %P_Med%
        }
        else
        {
            if (NotiPopup = 1)
            {
                SplashImage = %A_ScriptDir%\UHotkey Game limit alert.png
                if FileExist(SplashImage)
                {
                    ysplash := rightMonitorHeight -200
                    SplashImageGUI(SplashImage, "Center", ysplash, 500, False)
                }
            }
            Else{
            Tooltip, เรียน
            }
            sleep 2000
            Tooltip,
        }
    }
    else if WinActive("Discord")
    {
    }
    else if (P_Med < 7200)
    {
        P_Med := P_Med + 5
        if (P_Med>7200)
        {
            P_Med := 1500
        }
        GuiControl,2:, P_OutMed,Possibility to be Med : %P_Med%
    }
}

MouseGetPos, MToHideToolX, MToHideToolY
If ( MToHideToolX>=-152 and MToHideToolX<=0 and MToHideToolY <= 1052 and MToHideToolY >= 1018 )
{
   ToolTip ,Hide, , , 2
   sleep 100
   ToolTip , , , , 2
}

if (Turn = 0) and (WaitForReturnLangBar = 0)
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

    if (WaitForReturnLangBar = 1)
    {
        isFullScreen := isWindowFullScreen( "A" )
    }

    if (WaitForReturnLangBar = 0) and (xmid < 0) ;อยู่จอซ้าย
    {
        isFullScreen := isWindowFullScreen( "A" )
        if isFullScreen = 1
        {
            ;Check on left screen?
            ToolTip,,,,2
            WaitForReturnLangBar = 1
            turn = 0
            GuiControl,2:, TurnLang, Turn Language noti OFF
        }
    }
    else if (WaitForReturnLangBar = 1) and ( xmid > 0 || isFullScreen = 0 )
    {
        WaitForReturnLangBar = 0
        turn = 1
        GuiControl,2:, TurnLang, Turn Language noti On
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
ExitPro:
    Gui 2:Default
    GuiControlGet, MICID
    SoundSet, 100, MASTER, Volume,%MICID%
    SoundSet, 0, MASTER, Mute,%MICID%
    gosub, Save
exitapp
return

Ac_MICID_Change:
Gui 2:Default
GuiControlGet, MICID
return

Save:
    Gui, Submit, NoHide
    FileDelete, UHotkey.ini
    ;Gui 2:Default
    ;GuiControlGet, MICID
    FileAppend, 
    (
    [Initialization]
    SaveLastRun=%LastRun%
    SaveMICID=%MICID%
    SaveP_Med=%P_Med%
    saveturn=%turn%
    savedismic=%dismic%
    saveDark_Mode=%Dark_Mode%
    saveNotiPopup=%NotiPopup%
    saveDailySiteCheckIn=%DailySiteCheckIn%
    saveDailySiteCheckInBrowser=%DailySiteCheckInBrowser%
    saveDetectDiscordMic=%DetectDiscordMic%
    saveTimeIdleCheck=%TimeIdleCheck%
    ), UHotkey.ini
return

Ac_NotiPopup:
Gui 2:Default
GuiControlGet, NotiPopup
return
/*
Ac_ClearClipHistoryWhenPasswordManagerAutoclearclipboard:
Gui 2:Default
GuiControlGet, ClearClipHistoryWhenPasswordManagerAutoclearclipboard
return
*/

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
    guimain = 0
    guimain = 0
return

ac_idle_checking:
    Gui 2:Default
    GuiControlGet, TimeIdleCheck
return

Ac_AutoCollapseBookmarkBar:
    Gui 2:Default
    GuiControlGet, autocollapsebookmarkbar
return

AcSyncMic:
    Gui 2:Default
    GuiControlGet, SyncMic
return

AcEnablePushtotalk:
    Gui 2:Default
    GuiControlGet, EnablePushtotalk
return

AcDetectDiscordMic:
    Gui 2:Default
    GuiControlGet, DetectDiscordMic
return

Ac_DailySiteCheckIn:
    Gui 2:Default
    GuiControlGet, DailySiteCheckIn
return

Ac_DailySiteCheckInBrowser:
    Gui 2:Default
    GuiControlGet, DailySiteCheckIn
return

Ac_TClick_HH:
    Gui 2:Default
    GuiControlGet, TClick_HH
    GuiControlGet, TClick_MM
return

Ac_TClick_MM:
    Gui 2:Default
    GuiControlGet, TClick_HH
    GuiControlGet, TClick_MM
return
/*
Ac_Med_Work:
    Gui 2:Default
    GuiControlGet, P_Med_Work
Return
*/

Ac_TClick:
if (Time_Click = 0)
{
    GuiControl,2:, Vari_TClick,Working
    Time_Click = 1
    Gui 2:Default
    GuiControlGet, TClick_HH
    GuiControlGet, TClick_MM

    SetTimer ,TimeToClick, 1000

    TimeToClick:
        if (A_Hour = TClick_HH && A_Min = TClick_MM)
        {
            click, 1
            GuiControl,2:, Vari_TClick,Finished
            SetTimer ,TimeToClick, OFF
            return
        }
        if (Time_Click = 0)
        {
            click, 1
            GuiControl,2:, Vari_TClick,Stopped
            SetTimer ,TimeToClick, OFF
            return
        }
    return
}
else if (Time_Click = 1)
{
    GuiControl,2:, Vari_TClick,Stopped
    Time_Click = 0
    SetTimer ,TimeToClick, OFF
}
return

StopWatch:
    ;msgbox, %enablestopwatch%
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

LA1:
    WinMove, Learn Anywhere,,623,-51,1296,779,,
    WinSet, AlwaysOnTop,on,Learn Anywhere
return

LA2:
    WinMove, Learn Anywhere,,-1302,-172,1296,779,,
    WinSet, AlwaysOnTop,on,Learn Anywhere
return

WindowManager:
    Run, %A_ScriptDir%\List open windows to quickly select v.2.3.ahk
return

TranslateShow:
    Run, %A_ScriptDir%\Auto Google translate v.4.exe
return

Spy:
    Run, %A_ScriptDir%\Spy v.1.1.ahk
return

3GuiEscape:
3GuiClose:
    Gui 3:destroy
    guifindmic = 0
return

TurnScreenOff:
    count := 5
    centicount := 0
    CoordMode, Mouse, Screen
    MouseGetPos,vCurX1, vCurY1
    loop {
        CoordMode, Mouse, Screen
        MouseGetPos, vCurX2, vCurY2
        centicount := centicount+0.1
        if (centicount >= 1)
        {
            centicount := 0
            SplashTextOn,200,40, Screens will turn off in %count% s., Move mouse to cancel
            count := count-1
        }
        sleep 100
        if(vCurX1 != vCurX2 or vCurY1 != vCurY2)
        {
            SplashTextOff
            return
        }
        if (count <= 0)
        {
            break
        }
    }
    if(vCurX2 = vCurX1 or vCurY2 = vCurY1)
    {
        Gui 2:destroy
        guimain = 0
        SendMessage, 0x112, 0xF170, 2,, Program Manager
        if (mic = 1)
        {
            SoundSet, 100, MASTER, Mute,%MICID%
            Gui, 1: Color, FF0000
        }
    }
    SplashTextOff
Return

TurnLangbar:
    if (turn = 1)
    {
        turn = 0
        ToolTip , , , , 2
        GuiControl,2:, TurnLang, Turn Language noti OFF

    }
    else
    {
        turn = 1
        GuiControl,2:, TurnLang, Turn Language noti On
    }

return

2GuiEscape:
2GuiClose:
    Gui 2:hide
    guimain = 1
    gosub, save
    Tooltip, Universal Hotkey will working in background.
    sleep 1000
    Tooltip,
return

OnClipboardChange:
if A_EventInfo = 2 ; Clipboard contains something entirely non-text such as a picture.
{
    ToolTip,Copied non-text,-30, 1028, 2
    ;Sleep 700
    ;ToolTip  ; Turn off the tip.
}
else if A_EventInfo = 1 ;Clipboard contains something that can be expressed as text (this includes files copied from an Explorer window).
{
    StringReplace, ClipboardShow, Clipboard,`r`n,%A_Space%, All
    StringLen, Length, ClipboardShow
    ClipboardShowS := SubStr( ClipboardShow, 1, 40 )
    ClipboardShowL := SubStr( ClipboardShow, -10)
    if (Length < 55)
    {
        ToolTip,Copied %quote%%ClipboardShow%%quote%,-30, 1028, 2
    }
    Else{
        ClipboardShow = %quote%%ClipboardShowS% %A_Space%...%A_Space% %ClipboardShowL%%quote%
        ToolTip,Copied %ClipboardShow%,-30, 1028, 2
    }
    ;Sleep 1000
    ;ToolTip  ; Turn off the tip.
}
else if (Clipboard = "")
{
    if (ClearClipHistoryWhenPasswordManagerAutoclearclipboard = 1)
    {
        ToolTip,Plz clear clipboard History,-30, 1028, 2
    }
    Else
    {
        ToolTip,Clipboard%apostrophe%s empty.,-30, 1028, 2
    }
    ;Sleep 600
    ;ToolTip  ; Turn off the tip.
}
SetTimer, CheckLangAgain,10000
return

CheckLangAgain:
if (Turn = 0)
{
    ToolTip ,,,, 2
    return
}

if !LangID := GetKeyboardLanguage(WinActive("A"))
{
    Tooltip, Failed, -30, 1028, 2
    return
}

if (LangID = 0x041e) ;ภาษาไทย
{
    if (turn = 1)
    {
        ToolTip , ไทย, -30, 1028, 2
    }
}
else if (LangID = 0x0409) ;ภาษาอังกฤษ
{
    if (turn = 1)
    {
        ToolTip , ENG, -30, 1028, 2
    }
}
else if (LangID = 0x0411) ;JP
{
    if (turn = 1)
    {
        ToolTip , JP, -30, 1028, 2
    }
}
SetTimer, CheckLangAgain,OFF
return


;Shortcut volup down
Insert::
pause_change_audiorelay_vol = 1
While, GetKeyState("Insert","P")
{
    Send {Volume_Down}
    sleep 100
    If !GetKeyState("Insert","P")
    {
        pause_change_audiorelay_vol = 0
    }
}
if pause_change_audiorelay_vol = 0
{
    process, exist, audiorelay-backend.exe
    if errorlevel
    {
        SoundGet, master_volume
        run "D:\Ice (PC)\EXE\SoundVolumeView\SoundVolumeView.exe" /SetVolume "AudioRelay.Backend" %master_volume%
    }
}
return

Pause::
pause_change_audiorelay_vol = 1
while, GetKeyState("Pause","P")
{
    Send {Volume_Up}
    sleep 100
    If !GetKeyState("Pause","P")
    {
        pause_change_audiorelay_vol = 0
    }
}
if pause_change_audiorelay_vol = 0
{
    process, exist, audiorelay-backend.exe
    if errorlevel
    {
        SoundGet, master_volume
        run "D:\Ice (PC)\EXE\SoundVolumeView\SoundVolumeView.exe" /SetVolume "AudioRelay.Backend" %master_volume%
    }
}
return

;Shortcut Mute Unmute Mic 1 Code
*RAlt::
ClickMic:
    {
        if (mic = "1") ;ถ้าไมค์ปิดอยู่ให้เปิด
        {
            SoundSet, 100, MASTER, Volume,%MICID%
            SoundSet, 0, MASTER, Mute,%MICID%
            ;run C:\Program Files (x86)\foobar2000\foobar2000.exe /immediate /play "%A_ScriptDir%\unmute.wav" /hide 
            SoundPlay, %A_ScriptDir%\unmute.wav
            Gui, 1: Color, 1BFF00
            if (mic = dismic && SyncMic=1)
            {
                send, {RCtrl}
                Gui, 4: Color, 1BFF00
                dismic = 1
            }
            mic = 0 ;ไมค์เปิดแล้ว
            if (guimain = 1)
            {
                GuiControl,2:, ClickMic, Toggle mic to ON
                GuiControl,2: Enable,MICID
            }
            if (EnablePushtotalk = 1)
            {
                keywait, RAlt, t.2
                if (errorlevel = "1")
                {
                    if (guimain = 1)
                    {
                        GuiControl,2:, ClickMic, PushToTalk enable
                    }
                    mic = 2
                    loop
                    {
                        sleep 2
                        If !GetKeyState("RAlt","P")
                            Break
                    }
                    SoundSet, 100, MASTER, Mute,%MICID%
                    ;run C:\Program Files (x86)\foobar2000\foobar2000.exe /immediate /play "%A_ScriptDir%\mute.wav" /hide 
                    SoundPlay, %A_ScriptDir%\mute.wav
                    Gui, 1: Color, FF0000
                    if (mic = dismic && SyncMic=1)
                    {
                        send, {RCtrl}
                        Gui, 4: Color, FF0000
                        dismic = 0
                    }
                    if (guimain = 1)
                    {
                        GuiControl,2:, ClickMic, Toggle mic to OFF
                        GuiControl,2: Disable,MICID
                    }
                    mic = 1
                }
            }
        }
        else if (mic = "0") ;ถ้าไมค์เปิดอยู่ให้เปิด
        {
            SoundSet, 100, MASTER, Mute,%MICID%
            ;run C:\Program Files (x86)\foobar2000\foobar2000.exe /immediate /play "%A_ScriptDir%\mute.wav" /hide 
            SoundPlay, %A_ScriptDir%\mute.wav
            Gui, 1: Color, FF0000
            mic = 1 ;ไมค์ปิดแล้ว
            if (mic = dismic && SyncMic=1)
            {
                send, {RCtrl}
                Gui, 4: Color, FF0000
                dismic = 0
            }
            if (guimain = 1)
            {
                GuiControl,2:, ClickMic, Toggle mic to OFF
                GuiControl,2: Disable,MICID
            }
        }
    }

    if (SyncMic=1)
    {
        if (mic != dismic)
        {
            send, {RCtrl}
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
        }
    }
    SetTimer, MicIndicatorOnTop, 1
return

MicIndicatorOnTop:
    Gui, 1:+AlwaysOnTop
    Gui, 4:+AlwaysOnTop
    WinMove, DiscordMute, , -4,1072
    WinMove, WindowMute, , -4,1076
    SetTimer, MicIndicatorOnTop, OFF
return

!+b::
    WinSet, Bottom,,A
return

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
        FastNoteChapterYT=0
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
    Note = %Note%`t,
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
    if (FastNoteChapterYT >= 1)
    {
        if (S_HH > 0)
        {
            Note = %Note%`n%S_HH%:%S_MM%:%S_SS%
        }
        else
        {
            Note = %Note%`n%S_MM%:%S_SS%
        }
    }
    else if (FastNoteChapterYT = 0)
    {
        Note = %Note%`n0:00
    }
    FastNoteChapterYT := FastNoteChapterYT +1
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
    if (FastNoteScShot=1)
    {
        ScreenshotFile=%A_Desktop%\UHotkey\%YYYY%-%MM%-%DD% %Hour%.%Min%.%Sec% %FastNoteSubject%%StopWatchToFile%.png
        TakeScreenshot(ScreenshotFile)
    }
    if (!FileExist("%A_Desktop%\UHotkey")) 
    {
        FileCreateDir,%A_Desktop%\UHotkey
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

!+s::
;Tooltip, %EnableFocusChange%
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
;Tooltip, %EnableFocusChange%
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

!+e::
    WinGetClass, class, A
    WinMinimize, A
return

!+q::
    ;IfWinNotActive, ahk_class WorkerW
    ;{
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
    ;}
return

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

!+a::
WinGetActiveTitle, Title
WinGet, ExStyle, ExStyle, % Title
WinGet, id, ID, A
If (ExStyle & 0x8) { ; 0x8 stands for WS_EX_TOPMOST.
	WinSet, AlwaysOnTop, Off, % Title
	WinSet, Transparent, 255, % Title
    IsOntop = 0
    SetBackgroudColor(id)
}
Else {
	WinSet, AlwaysOnTop, On , % Title
	WinSet, Transparent, 245, % Title
    IsOntop = 1
    SetBackgroudColor(id)
}
return

;https://www.autohotkey.com/boards/viewtopic.php?t=73197 ต้นฉบับ Border
;;https://www.autohotkey.com/boards/viewtopic.php?f=6&p=374876#p374876 Border ที่ใช้

SetBackgroudColor(CurrHwnd)
{
	global Colors, GuiArray

	WinGetTitle, CurrTitle, ahk_id %CurrHwnd%
	GuiName := "GUI" CurrHwnd+0
    
	if (GuiArray.HasKey(GuiName))
	{
		GuiArray[GuiName] := ""
		GuiArray.Delete(GuiName)
		Gui, %GuiName%:Destroy
		Return
	}
    
    if (IsOntop = 0)
    {
        return
    }
	Gui, %GuiName%:New, +hwndGuihwnd	
	Gui, %GuiName%:+ToolWindow +E0x20 ; click through
	Gui, %GuiName%:Color, % Colors[1]
	Colors.Push(Colors[1])
	Colors.RemoveAt(1)

	WinSet, Transparent, 0, % "ahk_id " Guihwnd
	Gui, %GuiName%:Show, xCenter yCenter, %CurrTitle%, class DockGui
	WinSet, Style, -0xC00000, % "ahk_id " Guihwnd

	exDock := new Dock(CurrHwnd,Guihwnd)
	exDock.Position("Title")
	exDock.CloseCallback := Func("CloseCallback").Bind(GuiName)
	GuiArray[GuiName] := exDock
	
	WinActivate, % "ahk_id " . CurrHwnd
	WinSet, Transparent, 255, % "ahk_id " . Guihwnd
	
	Return
}

CloseCallback(GuiName)
{
	Gui, %GuiName%:Destroy
}

/*
	Class Dock
		Attach a window to another

	Author
		Marco Gavelli

	Original Author
		Soft (visionary1 ???)
	
	version
		0.1 (2017.04.20)
		0.2 (2017.05.06)
		0.2.1 (2017.05.07)
		0.2.1.1 bug fixed (2017.05.09)
		0.2.2 testing multiple docks... (2017.05.09)

	License
		WTFPL (http wtfpl.net /)  Broken Link for safety

	Dev env
		Windows 10 pro x64
		AutoHotKey H v1.1.25.01 32bit

	To Do...
		Multiple Dock, group windows...

	thanks to
		Helgef for overall coding advices
*/
class Dock
{
	static EVENT_OBJECT_LOCATIONCHANGE := 0x800B
	, EVENT_OBJECT_FOCUS := 0x8005, EVENT_OBJECT_DESTROY := 0x8001
	, EVENT_MIN := 0x00000001, EVENT_MAX := 0x7FFFFFFF ;for debug
	, EVENT_SYSTEM_MINIMIZESTART := 0x0016
	, EVENT_SYSTEM_MINIMIZEEND := 0x0017
	, EVENT_SYSTEM_FOREGROUND := 0x0003
	, EVENT_OBJECT_HIDE := 0x8003
	, EVENT_OBJECT_SHOW := 0x8002

	/*
		Instance := new Dock(Host hwnd, Client hwnd, [Callback], [CloseCallback])

			Host hwnd
				hwnd of a Host window

			Client hwnd
				hwnd of a window that follows Host window (window that'll be attached to a Host window)

			[Callback]
				a func object, or a bound func object
				if omitted, default EventsHandler will be used, which is hard-coded in 'Dock.EventsHandler'
				To construct your own events handler, I advise you to see Dock.EventsHandler first

			[CloseCallback]
				a func object, or a bound func object
				called when Host window is destroyed, see 'Dock Example.ahk' for practical usuage
	*/
	__New(Host, Client, Callback := "", CloseCallback := "")
	{
		this.hwnd := []
		this.hwnd.Host := Host
		this.hwnd.Client := Client
		; WinSet, ExStyle, +0x80, % "ahk_id " this.hwnd.Client

		this.Bound := []

		this.Callback := IsObject(Callback) ? Callback : ObjBindMethod(Dock.EventsHandler, "Calls")
		this.CloseCallback := IsFunc(CloseCallback) || IsObject(CloseCallback) ? CloseCallback

		/*
			lpfnWinEventProc
		*/
		this.hookProcAdr := RegisterCallback("_DockHookProcAdr",,, &this)

		/*
			idProcess
		*/
		WinGet, idProcess, PID, % "ahk_id " . this.hwnd.Host
		;idProcess := 0

		/*
			idThread
		*/
		idThread := DllCall("GetWindowThreadProcessId", "Ptr", this.hwnd.Host, "Int", 0)
		;idThread := 0

		; DllCall("CoInitialize", "Int", 0)

		this.Hook := DllCall("SetWinEventHook"
				, "UInt", Dock.EVENT_SYSTEM_FOREGROUND 		;eventMin
				, "UInt", Dock.EVENT_OBJECT_LOCATIONCHANGE 	;eventMax
				, "Ptr", 0				  	;hmodWinEventProc
				, "Ptr", this.hookProcAdr 			;lpfnWinEventProc
				, "UInt", idProcess			 	;idProcess
				, "UInt", idThread			  	;idThread
				, "UInt", 0)					;dwFlags
				
		this.enable := 1
	}

	/*
		Instance.Unhook()
			unhooks Dock and frees memory
	*/
	Unhook()
	{
		DllCall("UnhookWinEvent", "Ptr", this.Hook)		
		; DllCall("CoUninitialize")
		DllCall("GlobalFree", "Ptr", this.hookProcAdr)
		this.Hook := ""
		this.hookProcAdr := ""
		this.Callback := ""
		; WinSet, ExStyle, -0x80, % "ahk_id " this.hwnd.Client		
	}

	__Delete()
	{
		this.Delete("Bound")

		If (this.Hook)
			this.Unhook()

		this.CloseCallback := ""
	}

	/*
		provisional
	*/
	Add(hwnd, pos := "")
	{
		static last_hwnd := 0

		this.Bound.Push( new this( !NumGet(&this.Bound, 4*A_PtrSize) ? this.hwnd.Client : last_hwnd, hwnd ) )

		If pos Contains Top,Bottom,R,Right,L,Left
			this.Bound[NumGet(&this.Bound, 4*A_PtrSize)].Position(pos)

		last_hwnd := hwnd
	}

	/*
		Instance.Position(pos)
			pos - sets position to dock client window
				Top - sets to Top side of the host window
				Bottom - sets to bottom side of the host window
				R or Right - right side
				L or Left -  left side
	*/
	Position(pos)
	{
		this.pos := pos
		Return this.EventsHandler.EVENT_OBJECT_LOCATIONCHANGE(this, "host")
	}

	/*
		Default EventsHandler
	*/
	class EventsHandler extends Dock.HelperFunc
	{
		Calls(self, hWinEventHook, event, hwnd)
		{
			Critical

			If (hwnd = self.hwnd.Host)
			{
				Return this.Host(self, event)
			}

			If (hwnd = self.hwnd.Client)
			{
				Return this.Client(self, event)
			}
		}

		Host(self, event)
		{
			If (event = Dock.EVENT_OBJECT_HIDE)
			{
				WinHide, % "ahk_id " self.hwnd.Client
			}
			
			If (event = Dock.EVENT_OBJECT_SHOW)
			{
				WinShow, % "ahk_id " self.hwnd.Client
			}
			
			If (event = Dock.EVENT_SYSTEM_MINIMIZESTART)
			{
				self.enable := 0
			}
			
			If (event = Dock.EVENT_SYSTEM_MINIMIZEEND)
			{				
				Sleep, 500 ; Wait animation
				WinSet, Transparent, 0, % "ahk_id " self.hwnd.Client
				this.EVENT_OBJECT_LOCATIONCHANGE(self, "host")				
				this.EVENT_SYSTEM_FOREGROUND(self.hwnd.Client)
				;this.EVENT_SYSTEM_FOREGROUND(self.hwnd.Host)
				WinSet, Transparent, 255, % "ahk_id " self.hwnd.Client
				self.enable := 1
			}
			
			If (event = Dock.EVENT_SYSTEM_FOREGROUND AND self.enable)
			{				
				WinSet, Transparent, 0, % "ahk_id " self.hwnd.Client
				this.EVENT_SYSTEM_FOREGROUND(self.hwnd.Client)
				;this.EVENT_SYSTEM_FOREGROUND(self.hwnd.Host)
				;this.EVENT_SYSTEM_FOREGROUND(self.hwnd.Host) ; why??
				WinSet, Transparent, 255, % "ahk_id " self.hwnd.Client				
				Return ""
			}
			
			If (event = Dock.EVENT_OBJECT_LOCATIONCHANGE AND self.enable)
			{
				Return this.EVENT_OBJECT_LOCATIONCHANGE(self, "host")
			}

			If (event = Dock.EVENT_OBJECT_DESTROY)
			{
				self.Unhook()

				If (IsFunc(self.CloseCallback) || IsObject(self.CloseCallback))
					Return self.CloseCallback()
			}
		}

		Client(self, event)
		{
			If (event = Dock.EVENT_SYSTEM_FOREGROUND)
			{
			}

			If (event = Dock.EVENT_OBJECT_LOCATIONCHANGE)
			{
			}
		}

		/*
			Called when host window got focus
			without this, client window can't be showed (can't set to top)
		*/
		EVENT_SYSTEM_FOREGROUND(hwnd)
		{
			Return this.WinSetTop(hwnd)
		}

		/*
			Called when host window is moved
		*/
		EVENT_OBJECT_LOCATIONCHANGE(self, via)
		{
			Host := this.WinGetPos(self.hwnd.Host)
			Client := this.WinGetPos(self.hwnd.Client)

			If InStr(self.pos, "Title")
			{
				; SysGet, BorderWidth, 5
				
				If (via = "host")
				{
					Return this.MoveWindow(self.hwnd.Client 	;hwnd
								, Host.x-2 ;+6			;x
								, Host.y-3 ;-2     		;y
								, Host.w+5 ;-10	  		;width
								, 41) ;Host.h-2) 	 	;height
				}

				If (via = "client")
				{
				}
			}
			
			If InStr(self.pos, "Top")
			{
				If (via = "host")
				{
					Return this.MoveWindow(self.hwnd.Client 	;hwnd
								, Host.x		;x
								, Host.y - Client.h 	;y
								, Client.w	  	;width
								, Client.h) 		;height
				}

				If (via = "client")
				{
					Return this.MoveWindow(self.hwnd.Host	   	;hwnd
								, Client.x	  	;x
								, Client.y + Client.h   ;y
								, Host.w		;width
								, Host.h)	   	;height
				}
			}

			If InStr(self.pos, "Bottom")
			{
				If (via = "host")
				{		   
					Return this.MoveWindow(self.hwnd.Client	 	;hwnd
								, Host.x		;x
								, Host.y + Host.h   	;y
								, Client.w	  	;width
								, Client.h)	 	;height
				}

				If (via = "client")
				{
					Return this.MoveWindow(self.hwnd.Host	   	;hwnd
								, Client.x	  	;x
								, Client.y - Host.h 	;y
								, Host.w		;width
								, Host.h)	   	;height
				}
			}

			If InStr(self.pos, "R")
			{
				If (via = "host")
				{
					Return this.MoveWindow(self.hwnd.Client	 	;hwnd
								, Host.x + Host.w   	;x
								, Host.y		;y
								, Client.w	  	;width
								, Client.h)	 	;height	
				}

				If (via = "client")
				{
					Return this.MoveWindow(self.hwnd.Host	   	;hwnd
								, Client.x - Host.w 	;x
								, Client.y	  	;y
								, Host.w		;width
								, Host.h)	   	;height
				}
			}

			If InStr(self.pos, "L")
			{
				If (via = "host")
				{
					Return this.MoveWindow(self.hwnd.Client	 	;hwnd
								, Host.x - Client.w 	;x
								, Host.y		;y
								, Client.w	  	;width
								, Client.h)	 	;height	
				}

				If (via = "client")
				{
					Return this.MoveWindow(self.hwnd.Host	   	;hwnd
								, Client.x + Client.w   ;x
								, Client.y	  	;y
								, Host.w		;width
								, Host.h)	   	;height	
				}
			}
		}
	}

	class HelperFunc
	{
		WinGetPos(hwnd)
		{
			WinGetPos, hX, hY, hW, hH, % "ahk_id " . hwnd
			Return {x: hX, y: hY, w: hW, h: hH}
		}

		WinSetTop(hwnd)
		{
			WinSet, AlwaysOnTop, On, % "ahk_id " . hwnd
			WinSet, AlwaysOnTop, Off, % "ahk_id " . hwnd
		}

		MoveWindow(hwnd, x, y, w, h)
		{			
			DllCall("MoveWindow", "Ptr", hwnd, "Int", x, "Int", y, "Int", w, "Int", h, "Int", 1)
			tmp := 0 "-" 0 " W" w " H" h " R0-0"
			WinSet, Region, %tmp%, % "ahk_id " hwnd
			Return ""
		}

		Run(Target)
		{
			Try Run, % Target,,, OutputVarPID
			Catch, 
				Throw, "Couldn't run " Target

			WinWait, % "ahk_pid " OutputVarPID

			Return WinExist("ahk_pid " OutputVarPID)
		}
	}
}

_DockHookProcAdr(hWinEventHook, event, hwnd, idObject, idChild, dwEventThread, dwmsEventTime)
{
	this := Object(A_EventInfo)
	this.Callback.Call(this, hWinEventHook, event, hwnd)
}

!+r::
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

        if xmid < 0 ;จอซ้ายไปจอขวา
        {
            if (y < 0) ;ถ้าwindow อยู่เหนือ
            {
                y := y - y
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
            xScale := 1
            yScale := 1
            newWidth := width * xScale
            newHeight := height * yScale
        }
        else ;จอขวาไปซ้าย
        {
            if (RightMonitorHeight > leftMonitorHeight && y < 0) ;ถ้าwindow อยู่เหนือ
            {
                y := y - y
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
            newX := x * xScale
            newY := y * yScale
            xScale := 1
            yScale := 1
            newWidth := width * xScale
            newHeight := height * yScale
            newX := newX - leftMonitorWidth
        }
        ;WinMove, ahk_id %activeWindow%, , %newX%, %newY%, %newWidth%, %newHeight% - default
        WinMove, ahk_id %activeWindow%, , %newX%, %newY%, Width, Height
        if minMax = 1
        {
            ;WinMaximize, ahk_id %activeWindow%
        }
        WinActivate ahk_id %activeWindow% ;Needed - otherwise another window may overlap it
    }
    else
    {
        activeWindow := WinActive("A")
        if activeWindow = 0
        {
            return
        }
        WinGet, minMax, MinMax, ahk_id %activeWindow%
        WinGetPos, x, y, width, height, ahk_id %activeWindow%

        xmid := x+(width/2)
        ymid := y+(height/2)

        if xmid < 0 ;จอซ้ายไปจอขวา
        {
            xScale := rightMonitorWidth / leftMonitorWidth
            yScale := rightMonitorHeight / leftMonitorHeight
            x := leftMonitorWidth + x
            newX := x * xScale
            newY := y * yScale
            xScale := 1
            yScale := 1
            newWidth := width * xScale
            newHeight := height * yScale
        }
        else ;จอขวาไปซ้าย
        {
            xScale := leftMonitorWidth / rightMonitorWidth
            yScale := leftMonitorHeight / rightMonitorHeight
            newX := x * xScale
            newY := y * yScale
            xScale := 1
            yScale := 1
            newWidth := width * xScale
            newHeight := height * yScale
            newX := newX - leftMonitorWidth
        }
        ;WinMove, ahk_id %activeWindow%, , %newX%, %newY%, %newWidth%, %newHeight% - default
        WinMove, ahk_id %activeWindow%, , %newX%, %newY%, Width, Height
        if minMax = 1
        {
            ;WinMaximize, ahk_id %activeWindow%
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

;Discord Mic------------------------------------------
~*RCtrl up::
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
    SetTimer, MicIndicatorOnTop, 1000
return

;Auto Check Language------------------------------------------
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
}

if (A_Cursor = "IBeam") ;ถ้าเปิดจะทำให้ action จาก Lbutton ช้าหมด
{
SetTimer ,IndicatorLangguageLClick, 1
}

;SetTimer, MicIndicatorOnTop, 1000 ;มีLoop check DisappearIndicator แล้ว

;Detect Discord Mic
sleep 1
if (WinActive(" - Discord")) && (DetectDiscordMic = 1)
{
    CoordMode, Pixel, Relative
    WinGetPos, x, y, width, height, A
    
    ;WinGet, minMax, MinMax, Discord
    ;if minMax = 1
    ;{
        sleep 100
        height2 := height - 30
        PixelGetColor, OutputVarDisMic2, 185, %height2% ;fullscreen mode
    ;else
    ;{
        height := height - 17
        PixelGetColor, OutputVarDisMic, 173, %height% ;window mode
    ;}
    ;}
    ;Tooltip, %OutputVarDisMic% %OutputVarDisMic2%
    ;Clipboard = %OutputVarDisMic% %OutputVarDisMic2%
    if (OutputVarDisMic = 0x35318A || OutputVarDisMic = 0x443E97 || OutputVarDisMic2 = 0x2F2B57 || OutputVarDisMic2 = 0x453E6B)
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

sleep 1
IfWinActive , YouTube Music,,Chrome
{
    SetTimer, YoutubeMusic, OFF
    SetTimer, YoutubeMusic, 1
}

If (WinActive("DiscordMute") || WinActive("WindowMute"))
{
    Send, {click}
}
return

YoutubeMusic:
sleep 300
WinGet, State, MinMax, YouTube Music
if (State = -1)
{
    WinGet, minMax, MinMax, YouTube Music
    WinRestore , YouTube Music
    ;if minMax = 1
    ;{
        WinRestore, YouTube Music
    ;}
    WinMove, YouTube Music,, -8, 970 , 1936, 90,,
    ;WinSet, Style, -0xC00000, YouTube Music
    SetTimer, YoutubeMusic, OFF
    return
}
SetTimer, YoutubeMusic, OFF
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
                break
                SetTimer, bookmarktab_onaction, OFF
                autocollapsebookmarkbar = 1
                GuiControl,2: Enable, autocollapsebookmarkbar
                GuiControl,2:,autocollapsebookmarkbar,1
                return
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
    if (turn = 1)
    {
        Tooltip, Waiting
        ToolTip , Waiting, -30, 1028, 2
    }
    sleep 10
}
sleep 5
if !LangID := GetKeyboardLanguage(WinActive("A"))
{
    Tooltip, Failed, -30, 1028, 2
    return
}

if (LangID = 0x041e) ;ภาษาไทย
{
    if (turn = 1)
    {
        ToolTip , ไทย, -30, 1028, 2
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
    if (turn = 1)
    {
        ToolTip , ENG, -30, 1028, 2
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
    if (turn = 1)
    {
        ToolTip , JP, -30, 1028, 2
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

/*Not Working
#if (WaitDisableRight = 1)
RButton Up::
;msgbox,1
WaitDisableRight = 0
return
            */


#IfWinActive ahk_exe GenshinImpact.exe
~H::
	send {MButton down}
	ToolTip, MButton down
	sleep 4000
	ToolTip,
	send {MButton up}
Return

/* อาจเป็นสาเหตุการโดน แบนได้
#IfWinActive ahk_exe VALORANT-Win64-Shipping.exe
~4::
keywait, 4, t.500
	if (errorlevel = "1")
	{
		;send {Lctrl down}{Lshift down}
		;sleep 10
		;send {Lctrl up}{Lshift up}
		if (turn = 1)
		{
			ToolTip , Change your language, -30, 1028, 2
		}
		ToolTip, ,,,1
	}
return
*/
#If EnableFocusChange = 1
1::
	goto, ForgotEntoTh
return
#If EnableFocusChange = 1
2::
	goto, ForgotThtoEn
return
#If EnableFocusChange = 1
3::
	goto, GoogleDef
return
#If EnableFocusChange = 1
4::
	goto, LongmanDef
return
#If EnableFocusChange = 1
5::
	goto, GGTranslate
return

#IfWinActive | UniHotkey v
Numpad1::
	goto, TurnScreenOff
return
#IfWinActive | UniHotkey v
Numpad2::
	goto, TurnLangbar
return
#IfWinActive | UniHotkey v
Numpad3::
	goto, FindIDmic
return
#IfWinActive | UniHotkey v
Numpad4::
	goto, TranslateShow
return
#IfWinActive | UniHotkey v
Numpad5::
	goto, ForgotEntoTh
return
#IfWinActive | UniHotkey v
Numpad6::
	goto, ForgotThtoEn
return
#IfWinActive | UniHotkey v
Numpad7::
	goto, WindowManager
return
#IfWinActive | UniHotkey v
Numpad8::
	goto, Spy
return

GetKeyboardLanguage(_hWnd=0) ;Function check language
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

/*
waittoclicklogin:
sleep 5000
WinActivate, Genshin Impact Daily Check-In - Google Chrome
activeWindow := WinActive("A")
WinGetTitle, titleactive ,A
WinGetPos, x, y, width, height, ahk_id %activeWindow%
If(titleactive =  "Genshin Impact Daily Check-In - Google Chrome")
{
	newx := x+150
	newy := y+200
	CoordMode, Mouse, Screen
	MouseMove, newx, newy, 0
	Loop, 5
	{
		Send {WheelDown}
		sleep 1000
		CoordMode, Pixel, Client
		ImageSearch, FoundX, FoundY, 0, 0, 1920, 1080, %A_ScriptDir%\hoyologin.png
		If ErrorLevel = 0
		{
			Click, %FoundX%, %FoundY% Left, 1
			Tooltip, Found
		}
		else If ErrorLevel = 1
		{
		}
		Sleep, 500
	}
	Until ErrorLevel = 0
}
CoordMode, Pixel, Screen
return
        */

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
Percent := "%"
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

FindIDmic:
	if (guifindmic=0)
	{
		Gui, 3: Add, Button, x10 y10 w80 h30 gRunfindid vRunfindidDis, Run
		guifindmic = 1
		Gui, 3: Show, w420 h450, Find ID of Mic
		return

		Runfindid:
			GuiControl, 3: Disable, RunfindidDis
			SplashTextOn,,, Gathering Soundcard Info...
			; Most of the pure numbers below probably don't exist in any mixer, but they're queried for completeness.
			; The numbers correspond to the following items (in order): CUSTOM, BOOLEANMETER, SIGNEDMETER, PEAKMETER,
			; UNSIGNEDMETER, BOOLEAN, BUTTON, DECIBELS, SIGNED, UNSIGNED, PERCENT, SLIDER, FADER, SINGLESELECT, MUX,
			; MULTIPLESELECT, MIXER, MICROTIME, MILLITIME
			ControlTypes = VOLUME,ONOFF,MUTE,MONO,LOUDNESS,STEREOENH,BASSBOOST,PAN,QSOUNDPAN,BASS,TREBLE,EQUALIZER,0x00000000, 0x10010000,0x10020000,0x10020001,0x10030000,0x20010000,0x21010000,0x30040000,0x30020000,0x30030000,0x30050000,0x40020000,0x50030000,0x70010000,0x70010001,0x71010000,0x71010001,0x60030000,0x61030000

			ComponentTypes = MASTER,HEADPHONES,DIGITAL,LINE,MICROPHONE,SYNTH,CD,TELEPHONE,PCSPEAKER,WAVE,AUX,ANALOG,N/A

			; Create a ListView and prepare for the main loop:
			Gui, 3: Add, Listview, w400 h400 vMyListView, Component Type|Control Type|Setting|Mixer
			LV_ModifyCol(4, "Integer")
			SetFormat, Float, 0.2 ; Limit number of decimal places in percentages to two.

			Loop ; For each mixer number that exists in the system, query its capabilities.
			{
				CurrMixer := A_Index
				SoundGet, Setting,,, %CurrMixer%
				if ErrorLevel = Can't Open Specified Mixer ; Any error other than this indicates that the mixer exists.
					break

				; For each component type that exists in this mixer, query its instances and control types:
				Loop, parse, ComponentTypes, `,
				{
					CurrComponent := A_LoopField
					; First check if this component type even exists in the mixer:
					SoundGet, Setting, %CurrComponent%,, %CurrMixer%
					if ErrorLevel = Mixer Doesn't Support This Component Type
						continue ; Start a new iteration to move on to the next component type.
					Loop ; For each instance of this component type, query its control types.
					{
						CurrInstance := A_Index
						; First check if this instance of this instance even exists in the mixer:
						SoundGet, Setting, %CurrComponent%:%CurrInstance%,, %CurrMixer%
						; Checking for both of the following errors allows this script to run on older versions:
						if ErrorLevel in Mixer Doesn't Have That Many of That Component Type,Invalid Control Type or Component Type
							break ; No more instances of this component type.
						; Get the current setting of each control type that exists in this instance of this component:
						Loop, parse, ControlTypes, `,
						{
							CurrControl := A_LoopField
							SoundGet, Setting, %CurrComponent%:%CurrInstance%, %CurrControl%, %CurrMixer%
							; Checking for both of the following errors allows this script to run on older versions:
							if ErrorLevel in Component Doesn't Support This Control Type,Invalid Control Type or Component Type
								continue
							if ErrorLevel ; Some other error, which is unexpected so show it in the results.
								Setting := ErrorLevel
							ComponentString := CurrComponent
							if CurrInstance > 1
								ComponentString = %ComponentString%:%CurrInstance%
							LV_Add("", ComponentString, CurrControl, Setting, CurrMixer)
						} ; For each control type.
					} ; For each component instance.
				} ; For each component type.
			} ; For each mixer.
			Loop % LV_GetCount("Col") ; Auto-size each column to fit its contents.
				LV_ModifyCol(A_Index, "AutoHdr")
			SplashTextOff
		return
	}

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