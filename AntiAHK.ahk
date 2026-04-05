#Requires AutoHotkey v2.0
#SingleInstance Force
APP_VERSION  := "3.0.0"
GITHUB_REPO  := "olegor1/antiafk_update"
GITHUB_FILE  := "AntiAHK.ahk"
_k7VfPSK  := A_ScriptDir . "\antiafk_settings.ini"
_vgFOs2uK := false
_isxc6mE := 0
_TVULZGf := 0
_uwIgorPKmg := 0
_uwOAnpmDx := false
_AWngpYkrvg := "en"
SessionStart := 0
PendingUpdateVersion := ""
PendingUpdateUrl := ""
ReconnectRetryCount := 0
MaxReconnectRetries := 5
ReconnectRetryDelay := 30000
Lang := Map()
Lang["en"] := Map(
    "title",              "Rust Anti-AFK",
    "subtitle",           "by .kiano1  |  AHK v2  |  auto-detect  |  reconnect",
    "stopped",            "STOPPED",
    "active",             "ACTIVE",
    "server",             "SERVER",
    "ip",                 "IP",
    "port",               "PORT",
    "timers",             "TIMERS",
    "jump_interval",      "Jump interval (sec)",
    "kick_check",         "Kick check (sec)",
    "hotkeys",            "HOTKEYS",
    "start_afk",          "Start AFK",
    "stop_afk",           "Stop AFK",
    "jump_key",           "Jump key",
    "console_key",        "Console key",
    "toggle_gui",         "Show/Hide",
    "options",            "OPTIONS",
    "opt_reconnect",      "Auto-reconnect on kick",
    "opt_active_only",    "Only when Rust is active window",
    "opt_randomize",      "Randomize jump interval ±5s",
    "opt_autostop",       "Auto-stop when Rust closes",
    "opt_automini",       "Switch to mini-mode on start",
    "msg_banned",         "BAN DETECTED! AFK stopped.",
    "btn_start",          "START",
    "btn_stop",           "STOP",
    "btn_save",           "Save",
    "btn_reset",          "Reset",
    "log",                "LOG",
    "language",           "LANGUAGE",
    "favorites",          "FAVORITES",
    "fav_add",            "+",
    "fav_del",            "-",
    "fav_empty",          "No saved servers",
    "msg_fav_added",      "Server added to favorites",
    "msg_fav_removed",    "Server removed from favorites",
    "msg_rust_closed",    "Rust closed. AFK stopped.",
    "msg_no_log_fallback","Log file not found — kick detection disabled. Use '...' to set log path.",
    "msg_reconnect_give_up", "Reconnect failed after {1} attempts",
    "mini_mode",          "Mini",
    "tray_show",          "Show",
    "tray_toggle",        "Start / Stop",
    "tray_exit",          "Exit",
    "tray_status",        "Status",
    "tray_version",       "Version",
    "msg_server",         "Server: ",
    "msg_no_server",      "Server not found. Use '...' to browse for log.",
    "msg_saved",          "Settings saved",
    "msg_saved_tip",      "Settings saved!",
    "msg_press_key",      "Press any key...`n(Esc = cancel)",
    "msg_err_number",     "Intervals must be numbers!",
    "msg_err_title",      "Error",
    "msg_err_jump",       "Jump interval: 5–600 sec.",
    "msg_err_check",      "Check interval: 5–300 sec.",
    "msg_started",        "Started (jump: {1}s, check: {2}s)",
    "msg_stopped",        "Stopped (jumps: {1}, reconnects: {2})",
    "msg_disconnect",     "Disconnect detected!",
    "msg_connected",      "Connected to server",
    "msg_reconnect",      "Reconnect #{1} -> {2}:{3}",
    "msg_reset",          "Settings reset",
    "msg_log_set",        "Log path set: ",
    "msg_ip_not_found",   "IP:PORT not found in file",
    "msg_browse_title",   "Select Rust log file (Player.log / output_log.txt)",
    "msg_browse_filter",  "Log Files (*.log; *.txt)",
    "session_time",       "Session",
    "btn_update",         "Update",
    "msg_checking_update","Checking for updates...",
    "msg_update_found",   "Update available: {1}",
    "msg_no_update",      "You have the latest version (v{1})",
    "msg_update_ok",      "Updated to {1}! Restarting...",
    "msg_update_fail",    "Update failed: {1}",
    "msg_update_title",   "Auto-Update",
    "btn_download",       "Download",
    "btn_dismiss",        "x"
)
Lang["ru"] := Map(
    "title",              "Rust Anti-AFK",
    "subtitle",           "by .kiano1  |  AHK v2  |  авто-поиск  |  реконнект",
    "stopped",            "ВЫКЛЮЧЕН",
    "active",             "АКТИВЕН",
    "server",             "СЕРВЕР",
    "ip",                 "IP",
    "port",               "ПОРТ",
    "timers",             "ТАЙМЕРЫ",
    "jump_interval",      "Интервал прыжка (сек)",
    "kick_check",         "Проверка кика (сек)",
    "hotkeys",            "ГОРЯЧИЕ КЛАВИШИ",
    "start_afk",          "Старт AFK",
    "stop_afk",           "Стоп AFK",
    "jump_key",           "Клавиша прыжка",
    "console_key",        "Клавиша консоли",
    "toggle_gui",         "Показать/Скрыть",
    "options",            "НАСТРОЙКИ",
    "opt_reconnect",      "Авто-реконнект при кике",
    "opt_active_only",    "Только когда Rust активное окно",
    "opt_randomize",      "Случайный интервал прыжка ±5с",
    "opt_autostop",       "Автостоп при закрытии Rust",
    "opt_automini",       "Мини-режим при старте",
    "msg_banned",         "ОБНАРУЖЕН БАН! AFK остановлен.",
    "btn_start",          "СТАРТ",
    "btn_stop",           "СТОП",
    "btn_save",           "Сохранить",
    "btn_reset",          "Сброс",
    "log",                "ЛОГ",
    "language",           "ЯЗЫК",
    "favorites",          "ИЗБРАННОЕ",
    "fav_add",            "+",
    "fav_del",            "-",
    "fav_empty",          "Нет сохранённых серверов",
    "msg_fav_added",      "Сервер добавлен в избранное",
    "msg_fav_removed",    "Сервер удалён из избранного",
    "msg_rust_closed",    "Rust закрыт. AFK остановлен.",
    "msg_no_log_fallback","Лог Rust не найден — детекция кика отключена. Укажите путь через '...'",
    "msg_reconnect_give_up", "Реконнект не удался после {1} попыток",
    "mini_mode",          "Мини",
    "tray_show",          "Показать",
    "tray_toggle",        "Старт / Стоп",
    "tray_exit",          "Выход",
    "tray_status",        "Статус",
    "tray_version",       "Версия",
    "msg_server",         "Сервер: ",
    "msg_no_server",      "Сервер не найден. Нажмите '...' для выбора лога.",
    "msg_saved",          "Настройки сохранены",
    "msg_saved_tip",      "Настройки сохранены!",
    "msg_press_key",      "Нажмите любую клавишу...`n(Esc = отмена)",
    "msg_err_number",     "Интервалы должны быть числами!",
    "msg_err_title",      "Ошибка",
    "msg_err_jump",       "Интервал прыжка: 5–600 сек.",
    "msg_err_check",      "Интервал проверки: 5–300 сек.",
    "msg_started",        "Запущен (прыжок: {1}с, проверка: {2}с)",
    "msg_stopped",        "Остановлен (прыжков: {1}, реконнектов: {2})",
    "msg_disconnect",     "Обнаружен дисконнект!",
    "msg_connected",      "Подключён к серверу",
    "msg_reconnect",      "Реконнект #{1} -> {2}:{3}",
    "msg_reset",          "Настройки сброшены",
    "msg_log_set",        "Путь к логу: ",
    "msg_ip_not_found",   "IP:PORT не найден в файле",
    "msg_browse_title",   "Выберите лог Rust (Player.log / output_log.txt)",
    "msg_browse_filter",  "Файлы логов (*.log; *.txt)",
    "session_time",       "Сессия",
    "btn_update",         "Обновить",
    "msg_checking_update","Проверка обновлений...",
    "msg_update_found",   "Доступно обновление: {1}",
    "msg_no_update",      "У вас последняя версия (v{1})",
    "msg_update_ok",      "Обновлено до {1}! Перезапуск...",
    "msg_update_fail",    "Ошибка обновления: {1}",
    "msg_update_title",   "Автообновление",
    "btn_download",       "Скачать",
    "btn_dismiss",        "x"
)
Lang["ua"] := Map(
    "title",              "Rust Anti-AFK",
    "subtitle",           "by .kiano1  |  AHK v2  |  авто-пошук  |  реконект",
    "stopped",            "ВИМКНЕНО",
    "active",             "АКТИВНИЙ",
    "server",             "СЕРВЕР",
    "ip",                 "IP",
    "port",               "ПОРТ",
    "timers",             "ТАЙМЕРИ",
    "jump_interval",      "Інтервал стрибка (сек)",
    "kick_check",         "Перевірка кіку (сек)",
    "hotkeys",            "ГАРЯЧІ КЛАВІШІ",
    "start_afk",          "Старт AFK",
    "stop_afk",           "Стоп AFK",
    "jump_key",           "Клавіша стрибка",
    "console_key",        "Клавіша консолі",
    "toggle_gui",         "Показати/Сховати",
    "options",            "НАЛАШТУВАННЯ",
    "opt_reconnect",      "Авто-реконект при кіку",
    "opt_active_only",    "Тільки коли Rust активне вікно",
    "opt_randomize",      "Випадковий інтервал стрибка ±5с",
    "opt_autostop",       "Автостоп при закритті Rust",
    "opt_automini",       "Міні-режим при старті",
    "msg_banned",         "ВИЯВЛЕНО БАН! AFK зупинено.",
    "btn_start",          "СТАРТ",
    "btn_stop",           "СТОП",
    "btn_save",           "Зберегти",
    "btn_reset",          "Скидання",
    "log",                "ЛОГ",
    "language",           "МОВА",
    "favorites",          "ОБРАНЕ",
    "fav_add",            "+",
    "fav_del",            "-",
    "fav_empty",          "Немає збережених серверів",
    "msg_fav_added",      "Сервер додано до обраного",
    "msg_fav_removed",    "Сервер видалено з обраного",
    "msg_rust_closed",    "Rust закрито. AFK зупинено.",
    "msg_no_log_fallback","Лог Rust не знайдено — детекція кіку вимкнена. Вкажіть шлях через '...'",
    "msg_reconnect_give_up", "Реконект не вдався після {1} спроб",
    "mini_mode",          "Міні",
    "tray_show",          "Показати",
    "tray_toggle",        "Старт / Стоп",
    "tray_exit",          "Вихід",
    "tray_status",        "Статус",
    "tray_version",       "Версія",
    "msg_server",         "Сервер: ",
    "msg_no_server",      "Сервер не знайдено. Натисніть '...' для вибору логу.",
    "msg_saved",          "Налаштування збережено",
    "msg_saved_tip",      "Налаштування збережено!",
    "msg_press_key",      "Натисніть будь-яку клавішу...`n(Esc = скасувати)",
    "msg_err_number",     "Інтервали мають бути числами!",
    "msg_err_title",      "Помилка",
    "msg_err_jump",       "Інтервал стрибка: 5–600 сек.",
    "msg_err_check",      "Інтервал перевірки: 5–300 сек.",
    "msg_started",        "Запущено (стрибок: {1}с, перевірка: {2}с)",
    "msg_stopped",        "Зупинено (стрибків: {1}, реконектів: {2})",
    "msg_disconnect",     "Виявлено дисконект!",
    "msg_connected",      "Підключено до сервера",
    "msg_reconnect",      "Реконект #{1} -> {2}:{3}",
    "msg_reset",          "Налаштування скинуто",
    "msg_log_set",        "Шлях до логу: ",
    "msg_ip_not_found",   "IP:PORT не знайдено у файлі",
    "msg_browse_title",   "Оберіть лог Rust (Player.log / output_log.txt)",
    "msg_browse_filter",  "Файли логів (*.log; *.txt)",
    "session_time",       "Сесія",
    "btn_update",         "Оновити",
    "msg_checking_update","Перевірка оновлень...",
    "msg_update_found",   "Доступне оновлення: {1}",
    "msg_no_update",      "У вас остання версія (v{1})",
    "msg_update_ok",      "Оновлено до {1}! Перезапуск...",
    "msg_update_fail",    "Помилка оновлення: {1}",
    "msg_update_title",   "Автооновлення",
    "btn_download",       "Завантажити",
    "btn_dismiss",        "x"
)
T(key, params*) {
    global _AWngpYkrvg, Lang
    if Lang.Has(_AWngpYkrvg) && Lang[_AWngpYkrvg].Has(key)
        text := Lang[_AWngpYkrvg][key]
    else if Lang["en"].Has(key)
        text := Lang["en"][key]
    else
        return key
    for i, val in params
        text := StrReplace(text, "{" i "}", val)
    return text
}
Cfg := {
    ip:           "185.1.2.3",
    port:         "28015",
    jumpInterval: 55,
    checkInterval: 10,
    keyEnable:    "F9",
    keyDisable:   "F10",
    keyJump:      "Space",
    keyConsole:   "F1",
    keyToggleGui: "F8",
    reconnect:    true,
    activeOnly:   true,
    randomize:    false,
    autoStop:     true,
    autoMini:     false,
    favorites:    []
}
_aDcQDL9J2KJ       := "151515"
_CIGyxZTzimo    := "1C1C1C"
_M5B3rs2mo    := "252525"
_q7BBJnDKc   := "2A2A2A"
_nBWPi9K5Vyz     := "E8E8E8"
_PWGzE3Haz      := "777777"
_rHsr7NOB9gi    := "999999"
_yPis3Fs0A   := "CD412B"
_mTDNcKU56j    := "4ADE80"
_s5nAWVEcgU9      := "F87171"
_QYzHltSfC()
_qerZb9M7ADP := _I2oI3A8()
_lPNweAl()
_DBvxhaPwlLs()
if (_qerZb9M7ADP.found)
    _hvjCXsDHE(T("msg_server") Cfg.ip ":" Cfg.port)
else
    _hvjCXsDHE(T("msg_no_server"))
_QYzHltSfC() {
    global _AWngpYkrvg
    if !FileExist(_k7VfPSK)
        return
    try {
        Cfg.ip           := IniRead(_k7VfPSK, "Settings", "ip",           Cfg.ip)
        Cfg.port         := IniRead(_k7VfPSK, "Settings", "port",         Cfg.port)
        Cfg.jumpInterval := _PgYvnMYTFg(IniRead(_k7VfPSK, "Settings", "jumpInterval", Cfg.jumpInterval), 5, 600)
        Cfg.checkInterval:= _PgYvnMYTFg(IniRead(_k7VfPSK, "Settings", "checkInterval",Cfg.checkInterval), 5, 300)
        Cfg.keyEnable    := IniRead(_k7VfPSK, "Settings", "keyEnable",    Cfg.keyEnable)
        Cfg.keyDisable   := IniRead(_k7VfPSK, "Settings", "keyDisable",   Cfg.keyDisable)
        Cfg.keyJump      := IniRead(_k7VfPSK, "Settings", "keyJump",      Cfg.keyJump)
        Cfg.keyConsole   := IniRead(_k7VfPSK, "Settings", "keyConsole",   Cfg.keyConsole)
        Cfg.reconnect    := IniRead(_k7VfPSK, "Settings", "reconnect",    Cfg.reconnect) = "1"
        Cfg.activeOnly   := IniRead(_k7VfPSK, "Settings", "activeOnly",   Cfg.activeOnly) = "1"
        Cfg.randomize    := IniRead(_k7VfPSK, "Settings", "randomize",    Cfg.randomize) = "1"
        Cfg.autoStop     := IniRead(_k7VfPSK, "Settings", "autoStop",     Cfg.autoStop) = "1"
        Cfg.autoMini     := IniRead(_k7VfPSK, "Settings", "autoMini",     Cfg.autoMini) = "1"
        Cfg.keyToggleGui := IniRead(_k7VfPSK, "Settings", "keyToggleGui", Cfg.keyToggleGui)
        _S6DgBbT1ZRh := IniRead(_k7VfPSK, "Settings", "language", "en")
        if (_S6DgBbT1ZRh = "ru" || _S6DgBbT1ZRh = "ua" || _S6DgBbT1ZRh = "en")
            _AWngpYkrvg := _S6DgBbT1ZRh
        Cfg.favorites := []
        favCount := IniRead(_k7VfPSK, "Favorites", "count", 0)
        try favCount := Integer(favCount)
        catch
            favCount := 0
        Loop favCount {
            favEntry := IniRead(_k7VfPSK, "Favorites", "server" A_Index, "")
            if (favEntry != "")
                Cfg.favorites.Push(favEntry)
        }
    }
}
_U2vYAzJ5Ccn() {
    if !_qxGfnWOhZa()
        return
    _nFbs8cfZLzO()
    IniWrite(Cfg.ip,           _k7VfPSK, "Settings", "ip")
    IniWrite(Cfg.port,         _k7VfPSK, "Settings", "port")
    IniWrite(Cfg.jumpInterval, _k7VfPSK, "Settings", "jumpInterval")
    IniWrite(Cfg.checkInterval,_k7VfPSK, "Settings", "checkInterval")
    IniWrite(Cfg.keyEnable,    _k7VfPSK, "Settings", "keyEnable")
    IniWrite(Cfg.keyDisable,   _k7VfPSK, "Settings", "keyDisable")
    IniWrite(Cfg.keyJump,      _k7VfPSK, "Settings", "keyJump")
    IniWrite(Cfg.keyConsole,   _k7VfPSK, "Settings", "keyConsole")
    IniWrite(Cfg.reconnect  ? "1":"0", _k7VfPSK, "Settings", "reconnect")
    IniWrite(Cfg.activeOnly ? "1":"0", _k7VfPSK, "Settings", "activeOnly")
    IniWrite(Cfg.randomize  ? "1":"0", _k7VfPSK, "Settings", "randomize")
    IniWrite(Cfg.autoStop   ? "1":"0", _k7VfPSK, "Settings", "autoStop")
    IniWrite(Cfg.autoMini   ? "1":"0", _k7VfPSK, "Settings", "autoMini")
    IniWrite(Cfg.keyToggleGui, _k7VfPSK, "Settings", "keyToggleGui")
    IniWrite(_AWngpYkrvg, _k7VfPSK, "Settings", "language")
    IniWrite(Cfg.favorites.Length, _k7VfPSK, "Favorites", "count")
    Loop Cfg.favorites.Length
        IniWrite(Cfg.favorites[A_Index], _k7VfPSK, "Favorites", "server" A_Index)
    _hvjCXsDHE(T("msg_saved"))
    ToolTip(T("msg_saved_tip"))
    SetTimer(() => ToolTip(), -1500)
}
_mEFD9UtvRdh := ""
_dBKHUqFSmc2() {
    paths := []
    _EIXdcvKX := EnvGet("USERPROFILE")
    _HGGBDlAAipo := EnvGet("APPDATA")
    if FileExist(_k7VfPSK) {
        try {
            saved := IniRead(_k7VfPSK, "Settings", "_PP29px5Nj3", "")
            if (saved != "")
                paths.Push(saved)
        }
    }
    _d5Q1zYXRRq := _EIXdcvKX . "\AppData\LocalLow\Facepunch Studios\Rust"
    paths.Push(_d5Q1zYXRRq . "\Player.log")
    paths.Push(_d5Q1zYXRRq . "\output_log.txt")
    paths.Push(_d5Q1zYXRRq . "\Player-prev.log")
    _Vxmi9rZZeJl := _HGGBDlAAipo . "\..\LocalLow\Facepunch Studios\Rust"
    paths.Push(_Vxmi9rZZeJl . "\Player.log")
    paths.Push(_Vxmi9rZZeJl . "\output_log.txt")
    try {
        _GBms6Gq := RegRead("HKEY_CURRENT_USER\Software\Valve\Steam", "SteamPath")
        if (_GBms6Gq != "") {
            _GBms6Gq := StrReplace(_GBms6Gq, "/", "\")
            _BcHOdjVn := _GBms6Gq . "\steamapps\common\Rust"
            paths.Push(_BcHOdjVn . "\output_log.txt")
            paths.Push(_BcHOdjVn . "\Player.log")
            paths.Push(_BcHOdjVn . "\RustClient_Data\output_log.txt")
            paths.Push(_BcHOdjVn . "\Logs\output_log.txt")
            _pk4abXV := _GBms6Gq . "\steamapps\libraryfolders.vdf"
            if FileExist(_pk4abXV) {
                try {
                    _IGEu7ri9 := FileRead(_pk4abXV, "UTF-8")
                    _hxkjlRIkx := 1
                    Loop {
                        if !RegExMatch(_IGEu7ri9, '"path"\s+"([^"]+)"', &mv, _hxkjlRIkx)
                            break
                        _kAWiNHnxdFg := StrReplace(mv[1], "\\", "\")
                        _AOwgLWS := _kAWiNHnxdFg . "\steamapps\common\Rust"
                        paths.Push(_AOwgLWS . "\output_log.txt")
                        paths.Push(_AOwgLWS . "\Player.log")
                        paths.Push(_AOwgLWS . "\RustClient_Data\output_log.txt")
                        paths.Push(_AOwgLWS . "\Logs\output_log.txt")
                        _hxkjlRIkx := mv.Pos + mv.Len
                    }
                }
            }
        }
    }
    _OrtRKLm8Q := [
        "C:\Program Files (x86)\Steam\steamapps\common\Rust",
        "D:\Steam\steamapps\common\Rust",
        "D:\SteamLibrary\steamapps\common\Rust",
        "E:\SteamLibrary\steamapps\common\Rust",
        "C:\Games\Steam\steamapps\common\Rust"
    ]
    for hp in _OrtRKLm8Q {
        paths.Push(hp . "\output_log.txt")
        paths.Push(hp . "\Player.log")
        paths.Push(hp . "\RustClient_Data\output_log.txt")
        paths.Push(hp . "\Logs\output_log.txt")
    }
    return paths
}
_l5BHXOLLP2() {
    global _mEFD9UtvRdh
    if (_mEFD9UtvRdh != "" && FileExist(_mEFD9UtvRdh))
        return _mEFD9UtvRdh
    for path in _dBKHUqFSmc2() {
        if FileExist(path) {
            _mEFD9UtvRdh := path
            return path
        }
    }
    return ""
}
_xyhFdpW() {
    _awGTevGow7 := A_Temp . "\rust_log_search.tmp"
    _EIXdcvKX := EnvGet("USERPROFILE")
    try {
        RunWait('cmd.exe /c dir /s /b "' _EIXdcvKX '\AppData\LocalLow\*Player.log" > "' _awGTevGow7 '" 2>nul', , "Hide")
        if FileExist(_awGTevGow7) {
            result := Trim(FileRead(_awGTevGow7), "`r`n `t")
            FileDelete(_awGTevGow7)
            if (result != "") {
                if RegExMatch(result, "^(.+)$", &m)
                    return m[1]
            }
        }
    }
    try {
        RunWait('cmd.exe /c dir /s /b "' _EIXdcvKX '\AppData\LocalLow\*output_log.txt" > "' _awGTevGow7 '" 2>nul', , "Hide")
        if FileExist(_awGTevGow7) {
            result := Trim(FileRead(_awGTevGow7), "`r`n `t")
            FileDelete(_awGTevGow7)
            if (result != "") {
                if RegExMatch(result, "^(.+)$", &m)
                    return m[1]
            }
        }
    }
    return ""
}
_QvpkykRAO(*) {
    global _mEFD9UtvRdh
    _hTLSVRoo := FileSelect(1, , T("msg_browse_title"), T("msg_browse_filter"))
    if (_hTLSVRoo = "")
        return
    _mEFD9UtvRdh := _hTLSVRoo
    IniWrite(_hTLSVRoo, _k7VfPSK, "Settings", "_PP29px5Nj3")
    _hvjCXsDHE(T("msg_log_set") _hTLSVRoo)
    _t17mTR6Pq := _Fh7kqx4ztN(_hTLSVRoo)
    if (_t17mTR6Pq != "") && _JXtwGxh(_t17mTR6Pq) {
        _q0V8p3zrV.Value := Cfg.ip
        _Fjn8RMclyX.Value := Cfg.port
        _hvjCXsDHE(T("msg_server") Cfg.ip ":" Cfg.port)
    } else {
        _hvjCXsDHE(T("msg_ip_not_found"))
    }
}
_I2oI3A8() {
    global _mEFD9UtvRdh
    result := {found: false, source: "", tried: ""}
    _rcBuZ6Fp9 := ""
    for path in _dBKHUqFSmc2() {
        if FileExist(path) {
            _rcBuZ6Fp9 .= "  + " path "`r`n"
            _t17mTR6Pq := _Fh7kqx4ztN(path)
            if (_t17mTR6Pq != "") {
                if _JXtwGxh(_t17mTR6Pq) {
                    result.found := true
                    result.source := path
                    _mEFD9UtvRdh := path
                    return result
                } else {
                    _rcBuZ6Fp9 .= "    (IP не найден в файле)`r`n"
                }
            } else {
                _rcBuZ6Fp9 .= "    (пуст/не читается)`r`n"
            }
        }
    }
    _rcBuZ6Fp9 .= "  Поиск по диску...`r`n"
    _KjRZZbe := _xyhFdpW()
    if (_KjRZZbe != "") {
        _rcBuZ6Fp9 .= "  + Найден: " _KjRZZbe "`r`n"
        _mEFD9UtvRdh := _KjRZZbe
        _t17mTR6Pq := _Fh7kqx4ztN(_KjRZZbe)
        if (_t17mTR6Pq != "") && _JXtwGxh(_t17mTR6Pq) {
            result.found := true
            result.source := _KjRZZbe
            IniWrite(_KjRZZbe, _k7VfPSK, "Settings", "_PP29px5Nj3")
            return result
        } else {
            _rcBuZ6Fp9 .= "    (IP не найден)`r`n"
        }
    } else {
        _rcBuZ6Fp9 .= "  Лог не найден. Нажмите 'Обзор' для ручного выбора.`r`n"
    }
    result.tried := _rcBuZ6Fp9
    return result
}
_Fh7kqx4ztN(path) {
    try {
        f := FileOpen(path, "r", "UTF-8")
        if IsObject(f) {
            text := f.Read()
            f.Close()
            return text
        }
    }
    try {
        return FileRead(path, "UTF-8")
    }
    try {
        _awGTevGow7 := A_Temp . "\rust_log_copy.tmp"
        RunWait('cmd.exe /c copy "' path '" "' _awGTevGow7 '" /Y', , "Hide")
        if FileExist(_awGTevGow7) {
            text := FileRead(_awGTevGow7, "UTF-8")
            FileDelete(_awGTevGow7)
            return text
        }
    }
    return ""
}
_JXtwGxh(_t17mTR6Pq) {
    if (_t17mTR6Pq = "")
        return false
    _qCiLA2Y := ""
    _WoA1E0Ktl := ""
    _hxkjlRIkx := 1
    Loop {
        if !RegExMatch(_t17mTR6Pq, "i)connect(?:ing|ed)?[\s:]+(?:to\s+)?(\d{1,3}(?:\.\d{1,3}){3}):(\d{2,5})", &m, _hxkjlRIkx)
            break
        _qCiLA2Y := m[1]
        _WoA1E0Ktl := m[2]
        _hxkjlRIkx := m.Pos + m.Len
    }
    _hxkjlRIkx := 1
    Loop {
        if !RegExMatch(_t17mTR6Pq, "i)ip[=:\s]+(\d{1,3}(?:\.\d{1,3}){3})[\s,;]+port[=:\s]+(\d{2,5})", &m, _hxkjlRIkx)
            break
        _qCiLA2Y := m[1]
        _WoA1E0Ktl := m[2]
        _hxkjlRIkx := m.Pos + m.Len
    }
    _hxkjlRIkx := 1
    Loop {
        if !RegExMatch(_t17mTR6Pq, "im)(?:server|net|join).*?(\d{1,3}(?:\.\d{1,3}){3}):(\d{2,5})", &m, _hxkjlRIkx)
            break
        _qCiLA2Y := m[1]
        _WoA1E0Ktl := m[2]
        _hxkjlRIkx := m.Pos + m.Len
    }
    if (_qCiLA2Y != "" && _WoA1E0Ktl != "") {
        Cfg.ip := _qCiLA2Y
        Cfg.port := _WoA1E0Ktl
        return true
    }
    return false
}
_PgYvnMYTFg(val, minVal, maxVal) {
    try {
        n := Integer(val)
    } catch {
        n := minVal
    }
    if n < minVal
        n := minVal
    if n > maxVal
        n := maxVal
    return n
}
_qxGfnWOhZa() {
    try {
        j := Integer(_m9zLfVl.Value)
        c := Integer(_FWaa2urdEc.Value)
    } catch {
        MsgBox(T("msg_err_number"), T("msg_err_title"), "Icon!")
        return false
    }
    if (j < 5 || j > 600) {
        MsgBox(T("msg_err_jump"), T("msg_err_title"), "Icon!")
        return false
    }
    if (c < 5 || c > 300) {
        MsgBox(T("msg_err_check"), T("msg_err_title"), "Icon!")
        return false
    }
    return true
}
global _Jwltt1AS, _rmZXMht3dm, _AAhRZubbrR, _qxvgJ6G, _NM3vc2h0LNO, _pUTtFuaOGoS, SessionTimerLbl
global _q0V8p3zrV, _Fjn8RMclyX, _m9zLfVl, _FWaa2urdEc
global _tIgwrKH, _D5H0Nvk9X, _FnXFkIwiZld, _wcGlGJP, EditKeyToggle
global _HHaQbza, _XxqvuAp, _Tlsp5u6g, ChkAutoStop, ChkAutoMini
global DDFavorites
global UpdateBannerBg, UpdateBannerIcon, UpdateBannerText, UpdateBannerBtn, UpdateBannerClose
global MiniGui := ""
_lPNweAl() {
    global _Jwltt1AS, _rmZXMht3dm, _AAhRZubbrR, _qxvgJ6G, _NM3vc2h0LNO, _pUTtFuaOGoS, SessionTimerLbl
    global _q0V8p3zrV, _Fjn8RMclyX, _m9zLfVl, _FWaa2urdEc
    global _tIgwrKH, _D5H0Nvk9X, _FnXFkIwiZld, _wcGlGJP, EditKeyToggle
    global _HHaQbza, _XxqvuAp, _Tlsp5u6g, ChkAutoStop, ChkAutoMini
    global DDFavorites
    global UpdateBannerBg, UpdateBannerIcon, UpdateBannerText, UpdateBannerBtn, UpdateBannerClose
    global PendingUpdateVersion
    global _aDcQDL9J2KJ, _CIGyxZTzimo, _M5B3rs2mo, _q7BBJnDKc, _nBWPi9K5Vyz, _PWGzE3Haz, _rHsr7NOB9gi, _yPis3Fs0A, _mTDNcKU56j, _s5nAWVEcgU9
    W := 380
    _Jwltt1AS := Gui("+AlwaysOnTop +MinimizeBox", T("title"))
    _Jwltt1AS.BackColor := _aDcQDL9J2KJ
    _Jwltt1AS.SetFont("s10 c" _nBWPi9K5Vyz, "Segoe UI")
    _Jwltt1AS.OnEvent("Close", _SaLxO5yfUBF)
    _Jwltt1AS.OnEvent("Size", _j2Fptcaa)
    y := 0
    _Jwltt1AS.Add("Text", "x0 y0 w" W " h56 Background" _CIGyxZTzimo)
    _Jwltt1AS.SetFont("s14 w700 c" _nBWPi9K5Vyz)
    _Jwltt1AS.Add("Text", "x20 y10 w200 BackgroundTrans", "RUST ANTI-AFK")
    _Jwltt1AS.SetFont("s8 w400 c" _PWGzE3Haz)
    _Jwltt1AS.Add("Text", "x20 y34 BackgroundTrans", T("subtitle"))
    _Jwltt1AS.SetFont("s8 w400 c" _rHsr7NOB9gi)
    _Jwltt1AS.Add("Text", "x300 y10 w70 Right BackgroundTrans", "v" APP_VERSION)
    y := 56
    _Jwltt1AS.Add("Text", "x0 y" y " w" W " h36 Background" _aDcQDL9J2KJ)
    _Jwltt1AS.SetFont("s10 w700 c" _s5nAWVEcgU9)
    _AAhRZubbrR := _Jwltt1AS.Add("Text", "x20 y" (y+9) " w12 BackgroundTrans", Chr(0x25CF))
    _rmZXMht3dm := _Jwltt1AS.Add("Text", "x36 y" (y+8) " w100 BackgroundTrans", T("stopped"))
    _Jwltt1AS.SetFont("s9 w400 c" _PWGzE3Haz)
    SessionTimerLbl := _Jwltt1AS.Add("Text", "x140 y" (y+10) " w100 Center BackgroundTrans", "")
    _pUTtFuaOGoS := _Jwltt1AS.Add("Text", "x240 y" (y+10) " w120 Right BackgroundTrans", "")
    y += 36
    UpdateBannerBg := _Jwltt1AS.Add("Text", "x0 y" y " w" W " h40 Background1A3A1A vUpdateBannerBg Hidden")
    _Jwltt1AS.SetFont("s12 w700 c4ADE80")
    UpdateBannerIcon := _Jwltt1AS.Add("Text", "x12 y" (y+8) " w24 BackgroundTrans vUpdateBannerIcon Hidden", Chr(0x2B06))
    _Jwltt1AS.SetFont("s9 w600 cE8E8E8")
    bannerMsg := (PendingUpdateVersion != "") ? T("msg_update_found", PendingUpdateVersion) : ""
    UpdateBannerText := _Jwltt1AS.Add("Text", "x38 y" (y+11) " w190 BackgroundTrans vUpdateBannerText Hidden", bannerMsg)
    _Jwltt1AS.SetFont("s9 w700 c151515")
    UpdateBannerBtn := _Jwltt1AS.Add("Button", "x248 y" (y+6) " w80 h28 vUpdateBannerBtn Hidden", T("btn_download"))
    UpdateBannerBtn.OnEvent("Click", (*) => DoDownloadUpdate())
    _Jwltt1AS.SetFont("s9 w400 c777777")
    UpdateBannerClose := _Jwltt1AS.Add("Button", "x336 y" (y+6) " w28 h28 vUpdateBannerClose Hidden", Chr(0x2715))
    UpdateBannerClose.OnEvent("Click", (*) => HideUpdateBanner())
    if (PendingUpdateVersion != "") {
        UpdateBannerBg.Visible := true
        UpdateBannerIcon.Visible := true
        UpdateBannerText.Visible := true
        UpdateBannerBtn.Visible := true
        UpdateBannerClose.Visible := true
        y += 44
    }
    _Jwltt1AS.Add("Text", "x16 y" y " w" (W-32) " h1 0x10")
    y += 8
    _Jwltt1AS.SetFont("s8 w700 c" _rHsr7NOB9gi)
    _Jwltt1AS.Add("Text", "x20 y" y, T("language"))
    y += 18
    _Jwltt1AS.SetFont("s9 w400 c" _nBWPi9K5Vyz)
    _OkTkGmdh := (_AWngpYkrvg = "en") ? 1 : (_AWngpYkrvg = "ru") ? 2 : 3
    _GsHGqI7LqH := _Jwltt1AS.Add("DropDownList", "x20 y" y " w340 Background" _M5B3rs2mo " Choose" _OkTkGmdh, ["English", "Русский", "Українська"])
    _GsHGqI7LqH.OnEvent("Change", _Fh9ng9Pg0c4)
    y += 34
    _Jwltt1AS.Add("Text", "x16 y" y " w" (W-32) " h1 0x10")
    y += 8
    _Jwltt1AS.SetFont("s8 w700 c" _rHsr7NOB9gi)
    _Jwltt1AS.Add("Text", "x20 y" y, T("server"))
    y += 18
    _Jwltt1AS.SetFont("s8 w400 c" _PWGzE3Haz)
    _Jwltt1AS.Add("Text", "x20 y" y, T("ip"))
    _Jwltt1AS.Add("Text", "x238 y" y, T("port"))
    y += 16
    _Jwltt1AS.SetFont("s10 w400 c" _nBWPi9K5Vyz)
    _q0V8p3zrV   := _Jwltt1AS.Add("Edit", "x20 y" y " w210 h28 Background" _M5B3rs2mo, Cfg.ip)
    _Fjn8RMclyX := _Jwltt1AS.Add("Edit", "x238 y" y " w80 h28 Background" _M5B3rs2mo, Cfg.port)
    _GWGxtRFvqU := _Jwltt1AS.Add("Button", "x324 y" y " w36 h28", "...")
    _GWGxtRFvqU.OnEvent("Click", _QvpkykRAO)
    y += 38
    _Jwltt1AS.SetFont("s8 w700 c" _rHsr7NOB9gi)
    _Jwltt1AS.Add("Text", "x20 y" y, T("timers"))
    y += 18
    _Jwltt1AS.SetFont("s8 w400 c" _PWGzE3Haz)
    _Jwltt1AS.Add("Text", "x20 y" y, T("jump_interval"))
    _Jwltt1AS.Add("Text", "x200 y" y, T("kick_check"))
    y += 16
    _Jwltt1AS.SetFont("s10 w400 c" _nBWPi9K5Vyz)
    _m9zLfVl  := _Jwltt1AS.Add("Edit", "x20  y" y " w170 h28 Background" _M5B3rs2mo " Number", Cfg.jumpInterval)
    _FWaa2urdEc := _Jwltt1AS.Add("Edit", "x200 y" y " w160 h28 Background" _M5B3rs2mo " Number", Cfg.checkInterval)
    y += 38
    _Jwltt1AS.Add("Text", "x16 y" y " w" (W-32) " h1 0x10")
    y += 8
    _Jwltt1AS.SetFont("s8 w700 c" _rHsr7NOB9gi)
    _Jwltt1AS.Add("Text", "x20 y" y, T("hotkeys"))
    y += 22
    y := _SmhMk7Qwzfn(_Jwltt1AS, T("start_afk"),    &_tIgwrKH,   Cfg.keyEnable,  y)
    y := _SmhMk7Qwzfn(_Jwltt1AS, T("stop_afk"),     &_D5H0Nvk9X,  Cfg.keyDisable, y)
    y := _SmhMk7Qwzfn(_Jwltt1AS, T("jump_key"),     &_FnXFkIwiZld, Cfg.keyJump,    y)
    y := _SmhMk7Qwzfn(_Jwltt1AS, T("console_key"),  &_wcGlGJP,  Cfg.keyConsole, y)
    y := _SmhMk7Qwzfn(_Jwltt1AS, T("toggle_gui"),   &EditKeyToggle, Cfg.keyToggleGui, y)
    y += 4
    _Jwltt1AS.Add("Text", "x16 y" y " w" (W-32) " h1 0x10")
    y += 8
    _Jwltt1AS.SetFont("s8 w700 c" _rHsr7NOB9gi)
    _Jwltt1AS.Add("Text", "x20 y" y, T("options"))
    y += 22
    _Jwltt1AS.SetFont("s9 w400 c" _nBWPi9K5Vyz)
    _HHaQbza := _Jwltt1AS.Add("Checkbox", "x20 y" y " w340 " (Cfg.reconnect ? "Checked" : ""), T("opt_reconnect"))
    y += 24
    _XxqvuAp:= _Jwltt1AS.Add("Checkbox", "x20 y" y " w340 " (Cfg.activeOnly ? "Checked" : ""), T("opt_active_only"))
    y += 24
    _Tlsp5u6g    := _Jwltt1AS.Add("Checkbox", "x20 y" y " w340 " (Cfg.randomize  ? "Checked" : ""), T("opt_randomize"))
    y += 24
    ChkAutoStop  := _Jwltt1AS.Add("Checkbox", "x20 y" y " w340 " (Cfg.autoStop   ? "Checked" : ""), T("opt_autostop"))
    y += 24
    ChkAutoMini  := _Jwltt1AS.Add("Checkbox", "x20 y" y " w340 " (Cfg.autoMini   ? "Checked" : ""), T("opt_automini"))
    y += 32
    _Jwltt1AS.Add("Text", "x16 y" y " w" (W-32) " h1 0x10")
    y += 8
    _Jwltt1AS.SetFont("s8 w700 c" _rHsr7NOB9gi)
    _Jwltt1AS.Add("Text", "x20 y" y, T("favorites"))
    y += 18
    favList := []
    for fav in Cfg.favorites
        favList.Push(fav)
    if (favList.Length = 0)
        favList.Push(T("fav_empty"))
    _Jwltt1AS.SetFont("s9 w400 c" _nBWPi9K5Vyz)
    DDFavorites := _Jwltt1AS.Add("DropDownList", "x20 y" y " w260 Background" _M5B3rs2mo " Choose1", favList)
    DDFavorites.OnEvent("Change", OnFavoriteSelect)
    BtnFavAdd := _Jwltt1AS.Add("Button", "x286 y" y " w34 h26", T("fav_add"))
    BtnFavAdd.OnEvent("Click", (*) => AddFavorite())
    BtnFavDel := _Jwltt1AS.Add("Button", "x326 y" y " w34 h26", T("fav_del"))
    BtnFavDel.OnEvent("Click", (*) => RemoveFavorite())
    y += 36
    _Jwltt1AS.Add("Text", "x16 y" y " w" (W-32) " h1 0x10")
    y += 8
    _agQKj6IBdLJ := 80
    gap := 7
    _YIcSJLKBRI := 20
    _Jwltt1AS.SetFont("s10 w700 c" _nBWPi9K5Vyz)
    _qxvgJ6G := _Jwltt1AS.Add("Button", "x" _YIcSJLKBRI " y" y " w" _agQKj6IBdLJ " h36", Chr(0x25B6) " " T("btn_start"))
    _qxvgJ6G.OnEvent("Click", _brk5lXhs)
    _Jwltt1AS.SetFont("s9 w400 c" _nBWPi9K5Vyz)
    _pJdcd40k2M8 := _Jwltt1AS.Add("Button", "x" (_YIcSJLKBRI+_agQKj6IBdLJ+gap) " y" y " w" _agQKj6IBdLJ " h36", T("btn_save"))
    _pJdcd40k2M8.OnEvent("Click", (*) => _U2vYAzJ5Ccn())
    _owTcEku2td7 := _Jwltt1AS.Add("Button", "x" (_YIcSJLKBRI+2*(_agQKj6IBdLJ+gap)) " y" y " w" _agQKj6IBdLJ " h36", T("btn_reset"))
    _owTcEku2td7.OnEvent("Click", _teiAPGrMUHB)
    _Jwltt1AS.SetFont("s9 w400 c" _yPis3Fs0A)
    BtnUpdate := _Jwltt1AS.Add("Button", "x" (_YIcSJLKBRI+3*(_agQKj6IBdLJ+gap)) " y" y " w" _agQKj6IBdLJ " h36", Chr(0x21BB) " " T("btn_update"))
    BtnUpdate.OnEvent("Click", (*) => CheckForUpdates())
    y += 40
    _Jwltt1AS.SetFont("s9 w400 c" _yPis3Fs0A)
    BtnMini := _Jwltt1AS.Add("Button", "x" _YIcSJLKBRI " y" y " w" (4*_agQKj6IBdLJ+3*gap) " h28", Chr(0x25A3) " " T("mini_mode"))
    BtnMini.OnEvent("Click", (*) => ToggleMiniMode())
    y += 36
    _Jwltt1AS.Add("Text", "x16 y" y " w" (W-32) " h1 0x10")
    y += 6
    _Jwltt1AS.SetFont("s8 w700 c" _rHsr7NOB9gi)
    _Jwltt1AS.Add("Text", "x20 y" y, T("log"))
    y += 18
    _Jwltt1AS.SetFont("s8 w400 c" _PWGzE3Haz, "Consolas")
    _NM3vc2h0LNO := _Jwltt1AS.Add("Edit", "x20 y" y " w340 h90 Background" _M5B3rs2mo " ReadOnly Multi VScroll -E0x200")
    y += 98
    _Jwltt1AS.SetFont("s10 c" _nBWPi9K5Vyz, "Segoe UI")
    _Jwltt1AS.Show("w" W " h" y)
    _rk1byX5F()
}
_Fh9ng9Pg0c4(ctrl, *) {
    global _AWngpYkrvg
    _f8J5ByiGtF := Map(1, "en", 2, "ru", 3, "ua")
    _a8T3deG := _f8J5ByiGtF[ctrl.Value]
    if (_a8T3deG = _AWngpYkrvg)
        return
    _AWngpYkrvg := _a8T3deG
    _nFbs8cfZLzO()
    _Jwltt1AS.Destroy()
    _lPNweAl()
    IniWrite(_AWngpYkrvg, _k7VfPSK, "Settings", "language")
    _hvjCXsDHE(T("msg_saved"))
}
_SmhMk7Qwzfn(g, label, &_DoaUh3qFS, val, y) {
    global _PWGzE3Haz, _nBWPi9K5Vyz, _M5B3rs2mo
    g.SetFont("s9 w400 c" _PWGzE3Haz)
    g.Add("Text", "x20 y" (y+4) " w120", label)
    g.SetFont("s9 w400 c" _nBWPi9K5Vyz)
    _DoaUh3qFS := g.Add("Edit", "x148 y" y " w90 h26 Background" _M5B3rs2mo " Center ReadOnly", val)
    btn := g.Add("Button", "x244 y" y " w50 h26", "Set")
    btn.OnEvent("Click", _wWorCwUQqSC(_DoaUh3qFS))
    return y + 30
}
global TrayPopup := ""
global TrayStatusDot := ""
global TrayStatusText := ""
global TraySessionText := ""
global TrayCounterText := ""
global TrayTimerHandle := 0
_rk1byX5F() {
    A_TrayMenu.Delete()
    A_TrayMenu.Add(T("tray_show"), _rMNtS30O)
    A_TrayMenu.Default := T("tray_show")
    A_IconTip := "Rust Anti-AFK v" APP_VERSION
    OnMessage(0x404, OnTrayClick)
}
OnTrayClick(wParam, lParam, *) {
    if (lParam = 0x205) {
        ShowTrayPopup()
        return 1
    }
    if (lParam = 0x202) {
        _rMNtS30O()
        return 1
    }
}
ShowTrayPopup() {
    global TrayPopup, TrayStatusDot, TrayStatusText, TraySessionText, TrayCounterText
    global _aDcQDL9J2KJ, _CIGyxZTzimo, _M5B3rs2mo, _nBWPi9K5Vyz, _PWGzE3Haz, _rHsr7NOB9gi, _yPis3Fs0A, _mTDNcKU56j, _s5nAWVEcgU9
    global _vgFOs2uK, _isxc6mE, _TVULZGf, SessionStart, TrayTimerHandle
    if (TrayPopup != "") {
        try TrayPopup.Destroy()
        TrayPopup := ""
    }
    W := 240
    TrayPopup := Gui("-Caption +AlwaysOnTop +ToolWindow +Border", "TrayMenu")
    TrayPopup.BackColor := _CIGyxZTzimo
    TrayPopup.MarginX := 0
    TrayPopup.MarginY := 0
    y := 0
    TrayPopup.Add("Text", "x0 y0 w" W " h38 Background" _aDcQDL9J2KJ)
    TrayPopup.SetFont("s11 w700 c" _yPis3Fs0A)
    TrayPopup.Add("Text", "x14 y9 BackgroundTrans", Chr(0x25C6) "  RUST ANTI-AFK")
    TrayPopup.SetFont("s8 w400 c" _PWGzE3Haz)
    TrayPopup.Add("Text", "x" (W-58) " y12 w48 Right BackgroundTrans", "v" APP_VERSION)
    y := 38
    TrayPopup.Add("Text", "x0 y" y " w" W " h1 Background" _M5B3rs2mo)
    y += 1
    TrayPopup.Add("Text", "x0 y" y " w" W " h50 Background" _CIGyxZTzimo)
    statusClr := _vgFOs2uK ? _mTDNcKU56j : _s5nAWVEcgU9
    TrayPopup.SetFont("s10 w700 c" statusClr)
    TrayStatusDot := TrayPopup.Add("Text", "x14 y" (y+7) " w14 BackgroundTrans", Chr(0x25CF))
    TrayStatusText := TrayPopup.Add("Text", "x30 y" (y+6) " w200 BackgroundTrans", _vgFOs2uK ? T("active") : T("stopped"))
    TrayPopup.SetFont("s8 w400 c" _PWGzE3Haz)
    sessionStr := ""
    if _vgFOs2uK && (SessionStart > 0) {
        elapsed := (A_TickCount - SessionStart) // 1000
        h := elapsed // 3600
        m := Mod(elapsed // 60, 60)
        s := Mod(elapsed, 60)
        sessionStr := Format("{:02d}:{:02d}:{:02d}", h, m, s)
    }
    TraySessionText := TrayPopup.Add("Text", "x30 y" (y+28) " w100 BackgroundTrans", sessionStr)
    TrayCounterText := TrayPopup.Add("Text", "x130 y" (y+28) " w100 Right BackgroundTrans", _vgFOs2uK ? "J:" _isxc6mE "  R:" _TVULZGf : "")
    y += 50
    TrayPopup.Add("Text", "x10 y" y " w" (W-20) " h1 Background" _M5B3rs2mo)
    y += 1
    btnH := 36
    TrayPopup.SetFont("s10 w400 c" _nBWPi9K5Vyz)
    btnShow := TrayPopup.Add("Text", "x0 y" y " w" W " h" btnH " Background" _CIGyxZTzimo " 0x200")
    TrayPopup.Add("Text", "x14 y" (y+9) " w" W " BackgroundTrans", Chr(0x25B3) "   " T("tray_show"))
    btnShow.OnEvent("Click", TrayAction_Show)
    y += btnH
    toggleIcon := _vgFOs2uK ? Chr(0x25A0) : Chr(0x25B6)
    toggleClr := _vgFOs2uK ? _s5nAWVEcgU9 : _mTDNcKU56j
    TrayPopup.SetFont("s10 w400 c" _nBWPi9K5Vyz)
    btnToggle := TrayPopup.Add("Text", "x0 y" y " w" W " h" btnH " Background" _CIGyxZTzimo " 0x200")
    TrayPopup.SetFont("s10 w400 c" toggleClr)
    TrayPopup.Add("Text", "x14 y" (y+9) " w18 BackgroundTrans", toggleIcon)
    TrayPopup.SetFont("s10 w400 c" _nBWPi9K5Vyz)
    TrayPopup.Add("Text", "x36 y" (y+9) " w" (W-40) " BackgroundTrans", T("tray_toggle"))
    btnToggle.OnEvent("Click", TrayAction_Toggle)
    y += btnH
    TrayPopup.Add("Text", "x10 y" y " w" (W-20) " h1 Background" _M5B3rs2mo)
    y += 1
    TrayPopup.SetFont("s10 w400 c" _s5nAWVEcgU9)
    btnExit := TrayPopup.Add("Text", "x0 y" y " w" W " h" btnH " Background" _CIGyxZTzimo " 0x200")
    TrayPopup.Add("Text", "x14 y" (y+9) " w" W " BackgroundTrans", Chr(0x2715) "   " T("tray_exit"))
    btnExit.OnEvent("Click", (*) => ExitApp())
    y += btnH
    CoordMode("Mouse", "Screen")
    MouseGetPos(&mx, &my)
    sw := A_ScreenWidth
    sh := A_ScreenHeight
    px := (mx + W > sw) ? sw - W - 4 : mx
    py := (my - y < 0) ? 0 : my - y
    TrayPopup.Show("x" px " y" py " w" W " h" y " NoActivate")
    if (TrayTimerHandle != 0)
        SetTimer(TrayTimerHandle, 0)
    TrayTimerHandle := UpdateTrayPopupStatus
    SetTimer(TrayTimerHandle, 1000)
    SetTimer(CheckTrayPopupFocus, 200)
}
UpdateTrayPopupStatus() {
    global TrayPopup, TrayStatusDot, TrayStatusText, TraySessionText, TrayCounterText
    global _vgFOs2uK, _isxc6mE, _TVULZGf, SessionStart, _mTDNcKU56j, _s5nAWVEcgU9
    if (TrayPopup = "")
        return
    try {
        statusClr := _vgFOs2uK ? _mTDNcKU56j : _s5nAWVEcgU9
        TrayStatusDot.SetFont("c" statusClr)
        TrayStatusText.SetFont("c" statusClr)
        TrayStatusText.Value := _vgFOs2uK ? T("active") : T("stopped")
        if _vgFOs2uK && (SessionStart > 0) {
            elapsed := (A_TickCount - SessionStart) // 1000
            h := elapsed // 3600
            m := Mod(elapsed // 60, 60)
            s := Mod(elapsed, 60)
            TraySessionText.Value := Format("{:02d}:{:02d}:{:02d}", h, m, s)
        } else {
            TraySessionText.Value := ""
        }
        TrayCounterText.Value := _vgFOs2uK ? "J:" _isxc6mE "  R:" _TVULZGf : ""
    }
}
CheckTrayPopupFocus() {
    global TrayPopup, TrayTimerHandle
    if (TrayPopup = "")  {
        SetTimer(CheckTrayPopupFocus, 0)
        return
    }
    try {
        if !WinExist("ahk_id " TrayPopup.Hwnd) {
            CloseTrayPopup()
            return
        }
        CoordMode("Mouse", "Screen")
        MouseGetPos(&mx, &my)
        WinGetPos(&wx, &wy, &ww, &wh, "ahk_id " TrayPopup.Hwnd)
        if (mx < wx || mx > wx+ww || my < wy || my > wy+wh) {
            if GetKeyState("LButton", "P") || GetKeyState("RButton", "P")
                CloseTrayPopup()
        }
    }
}
CloseTrayPopup() {
    global TrayPopup, TrayTimerHandle
    if (TrayTimerHandle != 0) {
        SetTimer(TrayTimerHandle, 0)
        TrayTimerHandle := 0
    }
    SetTimer(CheckTrayPopupFocus, 0)
    if (TrayPopup != "") {
        try TrayPopup.Destroy()
        TrayPopup := ""
    }
}
TrayAction_Show(*) {
    CloseTrayPopup()
    _rMNtS30O()
}
TrayAction_Toggle(*) {
    CloseTrayPopup()
    _brk5lXhs()
}
_rMNtS30O(*) {
    _Jwltt1AS.Show()
    WinRestore("ahk_id " _Jwltt1AS.Hwnd)
}
_SaLxO5yfUBF(*) {
    _Jwltt1AS.Hide()
}
_j2Fptcaa(thisGui, minMax, *) {
    if (minMax = -1)
        thisGui.Hide()
}
_yPPhsrjyDY() {
    global _isxc6mE, _TVULZGf
    if IsSet(_pUTtFuaOGoS) && IsObject(_pUTtFuaOGoS)
        _pUTtFuaOGoS.Value := "J:" _isxc6mE "  R:" _TVULZGf
}
UpdateSessionTimer() {
    global SessionStart
    if !IsSet(SessionTimerLbl) || !IsObject(SessionTimerLbl)
        return
    elapsed := (A_TickCount - SessionStart) // 1000
    h := elapsed // 3600
    m := Mod(elapsed // 60, 60)
    s := Mod(elapsed, 60)
    SessionTimerLbl.Value := Format("{:02d}:{:02d}:{:02d}", h, m, s)
}
_wWorCwUQqSC(_I1706mG) {
    return (*) => _dYdRK4PrOxj(_I1706mG)
}
_dYdRK4PrOxj(_I1706mG) {
    ToolTip(T("msg_press_key"))
    ih := InputHook("L0 T5")
    ih.KeyOpt("{All}", "E")
    ih.KeyOpt("{Escape}", "-E")
    ih.Start()
    ih.Wait()
    if (ih.EndReason = "EndKey") {
        key := ih.EndKey
        _I1706mG.Value := key
    }
    ToolTip()
}
_nFbs8cfZLzO() {
    Cfg.ip            := _q0V8p3zrV.Value
    Cfg.port          := _Fjn8RMclyX.Value
    Cfg.jumpInterval  := _PgYvnMYTFg(_m9zLfVl.Value, 5, 600)
    Cfg.checkInterval := _PgYvnMYTFg(_FWaa2urdEc.Value, 5, 300)
    Cfg.keyEnable     := _tIgwrKH.Value
    Cfg.keyDisable    := _D5H0Nvk9X.Value
    Cfg.keyJump       := _FnXFkIwiZld.Value
    Cfg.keyConsole    := _wcGlGJP.Value
    Cfg.keyToggleGui  := EditKeyToggle.Value
    Cfg.reconnect     := _HHaQbza.Value
    Cfg.activeOnly    := _XxqvuAp.Value
    Cfg.randomize     := _Tlsp5u6g.Value
    Cfg.autoStop      := ChkAutoStop.Value
    Cfg.autoMini      := ChkAutoMini.Value
}
_DBvxhaPwlLs() {
    try Hotkey(Cfg.keyEnable,  _UQ2dWIHic, "On")
    try Hotkey(Cfg.keyDisable, _utm36B0t2,  "On")
    try Hotkey(Cfg.keyToggleGui, ToggleGuiVisible, "On")
}
_QqCyI8zfpXq() {
    try Hotkey(Cfg.keyEnable,  "Off")
    try Hotkey(Cfg.keyDisable, "Off")
    try Hotkey(Cfg.keyToggleGui, "Off")
}
ToggleGuiVisible(*) {
    if WinExist("ahk_id " _Jwltt1AS.Hwnd) && WinActive("ahk_id " _Jwltt1AS.Hwnd)
        _Jwltt1AS.Hide()
    else {
        _Jwltt1AS.Show()
        WinRestore("ahk_id " _Jwltt1AS.Hwnd)
    }
}
_brk5lXhs(*) {
    global _vgFOs2uK
    if _vgFOs2uK
        _utm36B0t2()
    else
        _UQ2dWIHic()
}
_UQ2dWIHic(*) {
    global _vgFOs2uK, _isxc6mE, _TVULZGf, _uwIgorPKmg, _uwOAnpmDx, _mTDNcKU56j, SessionStart
    if _vgFOs2uK
        return
    if !_qxGfnWOhZa()
        return
    _nFbs8cfZLzO()
    _vgFOs2uK := true
    _isxc6mE := 0
    _TVULZGf := 0
    ReconnectRetryCount := 0
    SessionStart := A_TickCount
    _PP29px5Nj3 := _l5BHXOLLP2()
    if (_PP29px5Nj3 != "") {
        try {
            f := FileOpen(_PP29px5Nj3, "r", "UTF-8")
            if IsObject(f) {
                _uwIgorPKmg := f.Length
                f.Close()
            }
        }
    }
    _uwOAnpmDx := true
    _PgbJkN5x := Cfg.jumpInterval * 1000
    SetTimer(_UEAwufMfmj, _PgbJkN5x)
    if Cfg.reconnect
        SetTimer(_IaHTT7A, Cfg.checkInterval * 1000)
    SetTimer(UpdateSessionTimer, 1000)
    if Cfg.autoStop
        SetTimer(CheckRustRunning, 5000)
    _AAhRZubbrR.SetFont("c" _mTDNcKU56j)
    _rmZXMht3dm.Value := T("active")
    _rmZXMht3dm.SetFont("c" _mTDNcKU56j)
    _qxvgJ6G.Text  := Chr(0x25A0) " " T("btn_stop")
    _yPPhsrjyDY()
    _QqCyI8zfpXq()
    _DBvxhaPwlLs()
    _hvjCXsDHE(T("msg_started", Cfg.jumpInterval, Cfg.checkInterval))
    if Cfg.autoMini
        ShowMiniMode()
}
_utm36B0t2(*) {
    global _vgFOs2uK, _s5nAWVEcgU9
    if !_vgFOs2uK
        return
    _vgFOs2uK := false
    SetTimer(_UEAwufMfmj, 0)
    SetTimer(_IaHTT7A, 0)
    SetTimer(UpdateSessionTimer, 0)
    SetTimer(CheckRustRunning, 0)
    SetTimer(RetryReconnect, 0)
    SessionTimerLbl.Value := ""
    _AAhRZubbrR.SetFont("c" _s5nAWVEcgU9)
    _rmZXMht3dm.Value := T("stopped")
    _rmZXMht3dm.SetFont("c" _s5nAWVEcgU9)
    _qxvgJ6G.Text  := Chr(0x25B6) " " T("btn_start")
    _hvjCXsDHE(T("msg_stopped", _isxc6mE, _TVULZGf))
}
_UEAwufMfmj() {
    global _isxc6mE
    if !WinExist("ahk_exe RustClient.exe")
        return
    if Cfg.activeOnly && !WinActive("ahk_exe RustClient.exe")
        return
    SendInput("{" Cfg.keyJump "}")
    _isxc6mE++
    _yPPhsrjyDY()
    if Cfg.randomize {
        _r30SxtvqW := Random(-5000, 5000)
        _Q4yInVtMWd := Cfg.jumpInterval * 1000
        _lk4JzmMBqDz := _Q4yInVtMWd + _r30SxtvqW
        if _lk4JzmMBqDz < 5000
            _lk4JzmMBqDz := 5000
        SetTimer(_UEAwufMfmj, _lk4JzmMBqDz)
    }
}
_G6MMueQ() {
    global _uwIgorPKmg
    _PP29px5Nj3 := _l5BHXOLLP2()
    if (_PP29px5Nj3 = "")
        return ""
    try {
        _QUuHaYJbb3t := FileOpen(_PP29px5Nj3, "r", "UTF-8")
    } catch {
        return ""
    }
    if !IsObject(_QUuHaYJbb3t)
        return ""
    _e446xNd := _QUuHaYJbb3t.Length
    if (_e446xNd < _uwIgorPKmg)
        _uwIgorPKmg := 0
    if (_e446xNd = _uwIgorPKmg) {
        _QUuHaYJbb3t.Close()
        return ""
    }
    _QUuHaYJbb3t.Seek(_uwIgorPKmg)
    _BGKnFH6b := _QUuHaYJbb3t.Read()
    _uwIgorPKmg := _e446xNd
    _QUuHaYJbb3t.Close()
    return _BGKnFH6b
}
_IaHTT7A() {
    global FallbackLogWarned
    if !WinExist("ahk_exe RustClient.exe")
        return
    _PP29px5Nj3 := _l5BHXOLLP2()
    if (_PP29px5Nj3 != "") {
        FallbackLogWarned := false
        _UzYNns7()
        return
    }
    if !IsSet(FallbackLogWarned) || !FallbackLogWarned {
        FallbackLogWarned := true
        _hvjCXsDHE(T("msg_no_log_fallback"))
    }
}
_UzYNns7() {
    global _uwOAnpmDx, ReconnectRetryCount
    _XNSQPfA := _G6MMueQ()
    if (_XNSQPfA = "")
        return
    if RegExMatch(_XNSQPfA, "im)Spawning World|Destroyed \d+ map networkables|already connecting or connected|DoClientConnected|Loading Terrain") {
        if !_uwOAnpmDx {
            _uwOAnpmDx := true
            ReconnectRetryCount := 0
            SetTimer(RetryReconnect, 0)
            _hvjCXsDHE(T("msg_connected"))
        }
        return
    }
    if RegExMatch(_XNSQPfA, "im)Banned|EAC Ban|Game Ban|VAC Ban") {
        _hvjCXsDHE(T("msg_banned"))
        _utm36B0t2()
        return
    }
    if RegExMatch(_XNSQPfA, "im)Disconnected \(|EAC Disconnect|Kicked:|Timed Out|ConnectionLost") {
        if _uwOAnpmDx {
            _uwOAnpmDx := false
            ReconnectRetryCount := 0
            _hvjCXsDHE(T("msg_disconnect"))
            _fj7aJDBKypu()
        }
    }
}
_fj7aJDBKypu() {
    global _TVULZGf, ReconnectRetryCount, MaxReconnectRetries, ReconnectRetryDelay
    global _uwOAnpmDx
    if !WinExist("ahk_exe RustClient.exe")
        return
    ReconnectRetryCount++
    if (ReconnectRetryCount > MaxReconnectRetries) {
        _hvjCXsDHE(T("msg_reconnect_give_up", MaxReconnectRetries))
        return
    }
    if !WinActive("ahk_exe RustClient.exe") {
        WinActivate("ahk_exe RustClient.exe")
        Sleep(800)
    }
    SendInput("{Escape}")
    Sleep(300)
    SendInput("{" Cfg.keyConsole "}")
    Sleep(800)
    SendInput("^a")
    Sleep(100)
    SendInput("connect " Cfg.ip ":" Cfg.port)
    Sleep(200)
    SendInput("{Enter}")
    Sleep(500)
    SendInput("{" Cfg.keyConsole "}")
    _TVULZGf++
    _yPPhsrjyDY()
    _hvjCXsDHE(T("msg_reconnect", ReconnectRetryCount "/" MaxReconnectRetries, Cfg.ip, Cfg.port))
    SetTimer(RetryReconnect, -ReconnectRetryDelay)
}
RetryReconnect() {
    global _uwOAnpmDx, ReconnectRetryCount, MaxReconnectRetries, _vgFOs2uK
    if _uwOAnpmDx || !_vgFOs2uK
        return
    if (ReconnectRetryCount < MaxReconnectRetries)
        _fj7aJDBKypu()
}
_hvjCXsDHE(msg) {
    _SyzDBanyi := FormatTime(, "HH:mm:ss")
    line := "[" _SyzDBanyi "] " msg "`r`n"
    if IsSet(_NM3vc2h0LNO) && IsObject(_NM3vc2h0LNO)
        _NM3vc2h0LNO.Value := line . _NM3vc2h0LNO.Value
}
_teiAPGrMUHB(*) {
    global Cfg
    if _vgFOs2uK
        _utm36B0t2()
    _QqCyI8zfpXq()
    Cfg := {
        ip: "185.1.2.3", port: "28015",
        jumpInterval: 55, checkInterval: 10,
        keyEnable: "F9", keyDisable: "F10",
        keyJump: "Space", keyConsole: "F1",
        keyToggleGui: "F8",
        reconnect: true, activeOnly: true, randomize: false,
        autoStop: true, favorites: []
    }
    _Jwltt1AS.Destroy()
    _lPNweAl()
    _DBvxhaPwlLs()
    _hvjCXsDHE(T("msg_reset"))
}
CheckRustRunning() {
    if !WinExist("ahk_exe RustClient.exe") {
        _hvjCXsDHE(T("msg_rust_closed"))
        _utm36B0t2()
    }
}
AddFavorite() {
    global Cfg, DDFavorites
    addr := _q0V8p3zrV.Value ":" _Fjn8RMclyX.Value
    for fav in Cfg.favorites {
        if (fav = addr)
            return
    }
    Cfg.favorites.Push(addr)
    RefreshFavoritesDropdown()
    _hvjCXsDHE(T("msg_fav_added"))
}
RemoveFavorite() {
    global Cfg, DDFavorites
    if (Cfg.favorites.Length = 0)
        return
    idx := DDFavorites.Value
    if (idx < 1 || idx > Cfg.favorites.Length)
        return
    Cfg.favorites.RemoveAt(idx)
    RefreshFavoritesDropdown()
    _hvjCXsDHE(T("msg_fav_removed"))
}
RefreshFavoritesDropdown() {
    global Cfg, DDFavorites
    favList := []
    for fav in Cfg.favorites
        favList.Push(fav)
    if (favList.Length = 0)
        favList.Push(T("fav_empty"))
    DDFavorites.Delete()
    DDFavorites.Add(favList)
    DDFavorites.Choose(1)
}
OnFavoriteSelect(ctrl, *) {
    global Cfg
    if (Cfg.favorites.Length = 0)
        return
    idx := ctrl.Value
    if (idx < 1 || idx > Cfg.favorites.Length)
        return
    addr := Cfg.favorites[idx]
    parts := StrSplit(addr, ":")
    if (parts.Length >= 2) {
        _q0V8p3zrV.Value := parts[1]
        _Fjn8RMclyX.Value := parts[2]
    }
}
global MiniStatusDot := ""
global MiniStatusText := ""
global MiniTimerText := ""
global MiniCounterText := ""
global MiniTimerHandle := 0
ToggleMiniMode() {
    global MiniGui
    if (MiniGui != "") {
        CloseMiniMode()
        return
    }
    ShowMiniMode()
}
ShowMiniMode() {
    global MiniGui, MiniStatusDot, MiniStatusText, MiniTimerText, MiniCounterText, MiniTimerHandle
    global _aDcQDL9J2KJ, _CIGyxZTzimo, _nBWPi9K5Vyz, _PWGzE3Haz, _yPis3Fs0A, _mTDNcKU56j, _s5nAWVEcgU9
    global _vgFOs2uK, _isxc6mE, _TVULZGf, SessionStart
    if (MiniGui != "")
        return
    W := 200
    MiniGui := Gui("+AlwaysOnTop -Caption +ToolWindow +Border", "MiniAFK")
    MiniGui.BackColor := _CIGyxZTzimo
    MiniGui.MarginX := 0
    MiniGui.MarginY := 0
    y := 0
    titleBg := MiniGui.Add("Text", "x0 y0 w" W " h24 Background" _aDcQDL9J2KJ " 0x200")
    MiniGui.SetFont("s8 w700 c" _yPis3Fs0A)
    MiniGui.Add("Text", "x8 y4 w120 BackgroundTrans", Chr(0x25C6) " ANTI-AFK")
    MiniGui.SetFont("s8 w400 c" _PWGzE3Haz)
    btnClose := MiniGui.Add("Text", "x" (W-24) " y4 w16 h16 BackgroundTrans Center", Chr(0x2715))
    btnClose.OnEvent("Click", (*) => CloseMiniMode())
    titleBg.OnEvent("Click", (*) => PostMessage(0xA1, 2, 0, , "ahk_id " MiniGui.Hwnd))
    y := 24
    statusClr := _vgFOs2uK ? _mTDNcKU56j : _s5nAWVEcgU9
    MiniGui.SetFont("s10 w700 c" statusClr)
    MiniStatusDot := MiniGui.Add("Text", "x8 y" (y+4) " w14 BackgroundTrans", Chr(0x25CF))
    MiniStatusText := MiniGui.Add("Text", "x24 y" (y+3) " w80 BackgroundTrans", _vgFOs2uK ? T("active") : T("stopped"))
    MiniGui.SetFont("s9 w400 c" _PWGzE3Haz)
    MiniCounterText := MiniGui.Add("Text", "x110 y" (y+5) " w80 Right BackgroundTrans", _vgFOs2uK ? "J:" _isxc6mE " R:" _TVULZGf : "")
    y += 24
    MiniGui.SetFont("s14 w700 c" _nBWPi9K5Vyz)
    sessionStr := "00:00:00"
    if _vgFOs2uK && (SessionStart > 0) {
        elapsed := (A_TickCount - SessionStart) // 1000
        h := elapsed // 3600
        m := Mod(elapsed // 60, 60)
        s := Mod(elapsed, 60)
        sessionStr := Format("{:02d}:{:02d}:{:02d}", h, m, s)
    }
    MiniTimerText := MiniGui.Add("Text", "x8 y" y " w" (W-16) " Center BackgroundTrans", sessionStr)
    y += 28
    px := A_ScreenWidth - W - 10
    py := 10
    MiniGui.Show("x" px " y" py " w" W " h" y " NoActivate")
    MiniTimerHandle := UpdateMiniMode
    SetTimer(MiniTimerHandle, 1000)
}
UpdateMiniMode() {
    global MiniGui, MiniStatusDot, MiniStatusText, MiniTimerText, MiniCounterText
    global _vgFOs2uK, _isxc6mE, _TVULZGf, SessionStart, _mTDNcKU56j, _s5nAWVEcgU9
    if (MiniGui = "")
        return
    try {
        statusClr := _vgFOs2uK ? _mTDNcKU56j : _s5nAWVEcgU9
        MiniStatusDot.SetFont("c" statusClr)
        MiniStatusText.SetFont("c" statusClr)
        MiniStatusText.Value := _vgFOs2uK ? T("active") : T("stopped")
        MiniCounterText.Value := _vgFOs2uK ? "J:" _isxc6mE " R:" _TVULZGf : ""
        if _vgFOs2uK && (SessionStart > 0) {
            elapsed := (A_TickCount - SessionStart) // 1000
            h := elapsed // 3600
            m := Mod(elapsed // 60, 60)
            s := Mod(elapsed, 60)
            MiniTimerText.Value := Format("{:02d}:{:02d}:{:02d}", h, m, s)
        } else {
            MiniTimerText.Value := "00:00:00"
        }
    }
}
CloseMiniMode() {
    global MiniGui, MiniTimerHandle
    if (MiniTimerHandle != 0) {
        SetTimer(MiniTimerHandle, 0)
        MiniTimerHandle := 0
    }
    if (MiniGui != "") {
        try MiniGui.Destroy()
        MiniGui := ""
    }
}
CompareVersions(v1, v2) {
    v1 := StrReplace(v1, "v", "")
    v2 := StrReplace(v2, "v", "")
    parts1 := StrSplit(v1, ".")
    parts2 := StrSplit(v2, ".")
    Loop 3 {
        a := (parts1.Length >= A_Index) ? Integer(parts1[A_Index]) : 0
        b := (parts2.Length >= A_Index) ? Integer(parts2[A_Index]) : 0
        if (a > b)
            return 1
        if (a < b)
            return -1
    }
    return 0
}
CheckForUpdates(silent := false) {
    global APP_VERSION, GITHUB_REPO, PendingUpdateVersion, PendingUpdateUrl
    _hvjCXsDHE(T("msg_checking_update"))
    tmpJson := A_Temp . "\antiafk_update.json"
    apiUrl := "https://api.github.com/repos/" GITHUB_REPO "/releases/latest"
    try {
        Download(apiUrl, tmpJson)
    } catch as err {
        if !silent
            _hvjCXsDHE(T("msg_update_fail", "No releases found"))
        return false
    }
    try {
        json := FileRead(tmpJson, "UTF-8")
        FileDelete(tmpJson)
    } catch {
        if !silent
            _hvjCXsDHE(T("msg_update_fail", "Cannot read API response"))
        return false
    }
    remoteVersion := ""
    if RegExMatch(json, '"tag_name"\s*:\s*"([^"]+)"', &m)
        remoteVersion := m[1]
    if (remoteVersion = "") {
        if !silent
            _hvjCXsDHE(T("msg_update_fail", "No release tag found"))
        return false
    }
    if (CompareVersions(remoteVersion, APP_VERSION) <= 0) {
        _hvjCXsDHE(T("msg_no_update", APP_VERSION))
        return false
    }
    PendingUpdateVersion := remoteVersion
    PendingUpdateUrl := "https://github.com/" GITHUB_REPO "/releases/download/" remoteVersion "/" GITHUB_FILE
    _hvjCXsDHE(T("msg_update_found", remoteVersion))
    ShowUpdateBanner()
    return true
}
ShowUpdateBanner() {
    global PendingUpdateVersion
    _nFbs8cfZLzO()
    _Jwltt1AS.Destroy()
    _lPNweAl()
}
HideUpdateBanner() {
    global PendingUpdateVersion
    PendingUpdateVersion := ""
    _nFbs8cfZLzO()
    _Jwltt1AS.Destroy()
    _lPNweAl()
}
DoDownloadUpdate() {
    global PendingUpdateUrl, PendingUpdateVersion, GITHUB_FILE
    tmpScript := A_Temp . "\antiafk_new.ahk"
    try {
        Download(PendingUpdateUrl, tmpScript)
    } catch as err {
        _hvjCXsDHE(T("msg_update_fail", err.Message))
        return
    }
    try {
        newContent := FileRead(tmpScript, "UTF-8")
    } catch {
        _hvjCXsDHE(T("msg_update_fail", "Download corrupted"))
        return
    }
    if !InStr(newContent, "#Requires AutoHotkey") {
        _hvjCXsDHE(T("msg_update_fail", "Invalid file content"))
        try FileDelete(tmpScript)
        return
    }
    try {
        FileCopy(tmpScript, A_ScriptFullPath, true)
        FileDelete(tmpScript)
    } catch as err {
        _hvjCXsDHE(T("msg_update_fail", err.Message))
        return
    }
    _hvjCXsDHE(T("msg_update_ok", PendingUpdateVersion))
    Sleep(1000)
    Reload()
}
