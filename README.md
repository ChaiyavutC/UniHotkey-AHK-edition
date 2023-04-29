# UniHotkey AHK edition
UniHotkey AHk edition is a utility program that provides you much more convenient way to use and manage your Windows PC.

## How to use
- `PageUp` + `PageDown` to launch the main UI.
- the only way to exit this program is to click the `Exit` button in the [main UI](https://github.com/Iz-zzzzz/UniHotkey-AHK-edition/edit/main/README.md#in-the-main-ui)

## This program provides these features

### Hotkey
- `LAlt` + `Shift` + `R` to move window to another moniter. (now supports only 2 monitors)
- `LAlt` + `Shift` + `A` to toggle Always On Top the active window.
- `LAlt` + `Shift` + `B` to move the active window to backward.
- `LAlt` + `Shift` + `Q` to move the active window along the mouse cursor position.
- `LAlt` + `Shift` + `E` to minimize the active window to task bar.
- `LAlt` + `Shift` + `M` to launch "Fast Note Text" UI which provides a lot of [features](https://github.com/Iz-zzzzz/UniHotkey-AHK-edition#fast-note-text).
- `LAlt` + `Shift` + `S` to lanuch Addition Menu.
- `LAlt` + `Shift` + `Arrow(Left/Right/Up/Down)` to move the active window by the arrow.
- `RAlt` to toggle microphone (Push-to-Talk also support)
- `RCtrl` to change Discord indicator UI color `Red to green` or `Green to Red` (use to sync with Discord Key Blind)
- `Insert` to decrease the output volume
- `Pause Break` to increase the output volume
- `LCtrl` + `LShift` to provide program data that you change the language.

### In the main UI
- "Turn off the monitor"
- "Turn On/Off Language tooltip bar" - this also use to display copied text.
- "Find ID of audio driver" - launch table of PC's audio driver ID then you can use this ID to simply toggle the microphone.
- "Google Translate" - launch Google Translate UI which's listening to clipboard change. If the clipboard changes, it will translate to the selected language.
- "ลื่มเปลี่ยนภาษา Eng to Th" - เปลี่ยนการพิมพ์ภาษาไทยโดยใช้รูปแบบแป้นพิมพ์อังกฤษ เป็นภาษาไทยจริงๆ
- "ลื่มเปลี่ยนภาษา Th to Eng" - เปลี่ยนการพิมพ์ภาษาอังกฤษโดยใช้รูปแบบแป้นพิมพ์ไทย เป็นภาษาอังกฤษจริงๆ
- "Window manager" - launch "Window manager"
- "Run Spy" - launch "Spy UI" to provide you with some interesting data.
- "StopWatch" - start the timer by clicking. This button usually uses along the recorder program to provide the correct timestamp in "Fast Note Text"
- "เรียง LA1/2" - not useable
- "AutoCollapseBookmarkBar" - in popular browsers (Chrome, Edge, Brave). You can show and hide the bookmark bar with a left click under the Browser's address bar.
- "Time to Click" - emulate left click if time is HH:MM
- "Idle Checking" - check if the PC is in an idle state, this program will mute the microphone automatically.
- "Sync Mic" - sync PC's mic and Discord's mic indicator UI color and mute state.
- "Dark Mode"
- "NotiPopup" - Show notification if you "change language", "move the active window to another monitor", "minimize the active window", "reach allow time to play game"

### Fast Note Text
- support Realtime, YT, MKV, StopWatch timestamp
- screenshot the whole screen while saving the note

### Others
- launch daily check-in site
- auto hide tooltip when a window is in full-screen mode.
- when the clipboard is changed, the tooltip will display clipboard content.
- Support Audio Relay Volume sync by `Insert` and `Pause Break` hotkeys. (need SoundVolumeView.exe)
- can simply press num instead of click action in the main UI
- autosave data
  1. Last Run date to launch daily check-in site
  2. Microphone ID
  3. Discord Mic state
  4. Dark mode state
  5. Noti Popup state
  6. ClearClipHistoryWhenPasswordManagerAutoclearclipboard state (Doesn't work)
