# UniHotkey AHKv1.1 edition v.26.2
UniHotkey AHk edition is a utility program that provides you much more convenient way to use and manage your Windows PC.

## Now this repository is not in active development. [This](https://github.com/ChaiyavutC/UniHotkey-Python-edition) is the new version which is more active.

![image](https://github.com/ChaiyavutC/UniHotkey-AHK-edition/assets/134151822/b3e9e6b9-407d-4138-8170-e9101c9f1f0a)

## How to use
1. Just download the lastest from [here](https://github.com/ChaiyavutC/UniHotkey-AHK-edition/releases)
2. (Only 2 monitors device) Provide device's monitors info.
3. `PageUp` + `PageDown` to launch the main UI.
4. The only way to terminate this program is to click the `Exit` button in the [main UI](https://github.com/Iz-zzzzz/UniHotkey-AHK-edition#in-the-main-ui)

## This program provides these features

### Hotkey
- `LAlt` + `LShift` + `R` (2 monitors)to move window to another moniter. (1 monitors) to move the active windows along with mouse cursor.
- `LAlt` + `LShift` + `A` to toggle Always On Top the active window.
- `LAlt` + `LShift` + `B` to move the active window to backward.
- `LAlt` + `LShift` + `Q` to move the active window along the mouse cursor position.
- `LAlt` + `LShift` + `E` to minimize the active window to task bar.
- `LAlt` + `LShift` + `M` to launch "Fast Note Text" UI which provides a lot of [features](https://github.com/Iz-zzzzz/UniHotkey-AHK-edition#fast-note-text).
- `LAlt` + `LShift` + `S` to lanuch Addition Menu.
- `LAlt` + `LShift` + `Arrow(Left/Right/Up/Down)` to move the active window by the arrow.
- `LAlt` + `LShift` + `<` to increase active window's opacity.
- `LAlt` + `LShift` + `>` to decrease active window's opacity.
- `RAlt` (can disable) to toggle microphone mute by mic's name. (Push-to-Talk also support. Config it in main UI)
- `RCtrl` (can disable) to change Discord indicator UI color `Red(Muted) to green(Unmuted)` or `Green(Unmuted) to Red(Muted)`. (use to sync with Discord Key Blind)
- `Insert` to decrease the output volume. (If process AudioRealy.exe is working, this hotke will also decrease the capture vol)
- `Pause Break` to increase the output volume. (If process AudioRealy.exe is working, this hotke will also increase the capture vol)
- `LCtrl` + `LShift` or `Start` + `Spacebar` to provide program data that you change the language.

### In the main UI
- "Turn off the monitor"
- "Tooltip noti On/Off" - Show language, idle mode, any error and copied text.
- "Google Translate" - launch Google Translate UI which's listening to clipboard change. If the clipboard changes, it will translate to the selected language. (Not my project)
- "ลื่มเปลี่ยนภาษา Eng to Th" - เปลี่ยนการพิมพ์ภาษาไทยโดยใช้รูปแบบแป้นพิมพ์อังกฤษ เป็นภาษาไทยจริงๆ
- "ลื่มเปลี่ยนภาษา Th to Eng" - เปลี่ยนการพิมพ์ภาษาอังกฤษโดยใช้รูปแบบแป้นพิมพ์ไทย เป็นภาษาอังกฤษจริงๆ
- "Window manager" - launch "Window manager"
- "Run Spy" - launch "Spy UI" to provide you with some interesting data.
- "StopWatch" - start the timer by clicking. This button usually uses along the recorder program to provide the correct timestamp in "Fast Note Text"
- "AutoCollapseBookmarkBar" - (work only with default theme) in popular browsers (Chrome, Edge, Brave). You can show and hide the bookmark bar with a left click under the Browser's address bar.
- "Idle Checking - AutoMuteMic" - check if the PC is in an idle state(2 mins), this program will mute the microphone automatically.
- "Sync Mic" - sync PC's mic and Discord's mic indicator UI color and mute state.
- "Dark Mode"
- "NotiPopup" - Show notification if you "change language", "move the active window to another monitor", "minimize the active window", "reach allow time to play game"
- "Reset Background button" - Reset desktop's background position.
- "Narrative language"

### Fast Note Text
- support create Realtime, YT, MKV, StopWatch timestamp.
- screenshot the whole screen while saving the note.
- `LAlt` + `LShift` + `T` - to add timestamp(Time from StopWatch in the main UI) in YT format.
- `LAlt` + `LShift` + `Y` - fast screenshot and save to desktop dir.

### Others
- launch daily check-in site (there are default directory of popular browsers)
- auto hide tooltip when a window is in full-screen mode.
- when the clipboard is changed, the tooltip will display clipboard content.
- Support Audio Relay Volume sync by `Insert` and `Pause Break` hotkeys. (need SoundVolumeView.exe)
- can simply press num instead of click action in the main UI
- check mute mic command actually works or not
- Support "AudioRelay.exe" by `Insert` and `Pause Break`
- autosave variables immediately
  1. Last Run - date to launch daily check-in site
  2. MicNamae
  3. Discord Mic state
  4. Dark mode state
  5. Noti Popup state
  6. SyncDiscordMic with SystemMic
  7. EnablePushtotalk
  8. leftMonitorWidth
  9. leftMonitorHeight
  10. rightMonitorWidth
  11. rightMonitorHeight
  12. EnableToggleMic
  13. EnableDiscordMic
  14. autocollapsebookmarkbar=
  15. SpeakLang
  16. TooltipX
  17. TooltipY
  18. IndicatorX
  19. IndicatorY
  20. mainmonitoris
