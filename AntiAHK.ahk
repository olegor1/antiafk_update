#Requires AutoHotkey v2.0
#SingleInstance Force

_v5e603fe8  := "5.0.0"
_v7581a003  := "olegor1/antiafk_update"
_vb1bc9150  := "AntiAHK.ahk"
_v74e63086  := A_ScriptDir . "\antiafk_settings.ini"
_v6d964f3e := false
_v2ce5463b := 0
_vfc38dc65 := 0
_vdf7ad575 := 0
_vc754a9e9 := false
_vb7cf90f6 := "en"
_ve8f55cfc := 0
_vf0631eac := ""
_vdb551915 := ""
_v94651a2f := ""
_v82d9fbbb := 0
_vc1caac16 := 5
_vbde49810 := 30000
_v99473393   := false

_fcd7f9e5b(keyBytes, dataBytes) {
    result := ""
    kLen   := keyBytes.Length
    Loop dataBytes.Length
        result .= Chr(dataBytes[A_Index] ^ keyBytes[Mod(A_Index - 1, kLen) + 1])
    return result
}

_v0c2927d8 := _fcd7f9e5b([0x5B, 0x21, 0x8F, 0x75, 0x05, 0xBB, 0xF4, 0x49, 0x53, 0x70, 0x20, 0x4A, 0x00, 0x77, 0x8A, 0x86], [0x6A, 0x15, 0xB6, 0x46, 0x3C, 0x8C, 0xCD, 0x7D, 0x6A, 0x44, 0x17, 0x7E, 0x31, 0x47, 0xBE, 0xBF, 0x6E, 0x17, 0xB9])
_v0752e981 := _fcd7f9e5b([0x40, 0x44, 0x26, 0x15, 0xF3, 0x9E, 0x28, 0x4D, 0x31, 0xF9, 0xF8, 0x7E, 0xF6, 0xB0, 0xF3, 0x8B], [0x23, 0x01, 0x4B, 0x46, 0xB8, 0xAD, 0x49, 0x1C, 0x08, 0x8E, 0xBE, 0x0E, 0x9F, 0x83, 0x8A, 0xC5, 0x05, 0x74, 0x7E, 0x62, 0x97, 0xD0, 0x1D, 0x17, 0x57, 0xCE, 0x8C, 0x48, 0x8E, 0xDE, 0xB0, 0xF2])
_v4d5b6af4 := 8765

_ve49e135e := _fcd7f9e5b([0x63, 0x10, 0xAB, 0x20, 0xF7, 0xD3, 0x24, 0x1A, 0x0E, 0x28, 0x1A, 0xFD, 0xF9, 0xB4, 0x2C, 0x85], [0x0B, 0x64, 0xDF, 0x50, 0xCD, 0xFC, 0x0B, 0x2E, 0x3B, 0x06, 0x2E, 0xCE, 0xD7, 0x85, 0x1A, 0xB6, 0x4D, 0x21, 0x98, 0x16, 0xCD, 0xE1, 0x11, 0x23, 0x3F, 0x1E, 0x35, 0x9C, 0x89, 0xDD, 0x03, 0xE4, 0x16, 0x64, 0xC3, 0x7F, 0x9B, 0xBC, 0x43])

_va457b7d1 := _fcd7f9e5b([0xD4, 0x1B, 0xEF, 0x8C, 0x88, 0x6F, 0x04, 0x26, 0xCA, 0x6B, 0x9A, 0xA2, 0xFE, 0xA5, 0x7E, 0xB6], [0xB2, 0x2D, 0xDC, 0xEE, 0xED, 0x0A, 0x33, 0x13, 0xFF, 0x0A, 0xAA, 0xC1, 0x9B, 0x93, 0x4F, 0x81, 0xE0, 0x7F, 0xDA, 0xEF, 0xBC, 0x5A, 0x36, 0x40, 0xFB, 0x09, 0xAA, 0x92, 0xCC, 0x9C, 0x48, 0x87, 0xB7, 0x23, 0x8D, 0xBA, 0xE9, 0x0C, 0x34, 0x15, 0xFD, 0x5A, 0xAA, 0x95, 0xCC, 0x94, 0x1B, 0x81, 0xE2, 0x2E, 0xDE, 0xEF, 0xB0, 0x09, 0x61, 0x1E, 0xA8, 0x5C, 0xAB, 0x96, 0x9B, 0x93, 0x1B, 0x82])
_v73339dcb         := ""
_v2d67864c       := ""
_v938a2d53     := false

_v7572559c := Map()

_v7572559c["en"] := Map(
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
    "opt_auto_mini",      "Open mini panel on start",
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
    "btn_dismiss",        "x",
    "btn_whats_new",      Chr(0x2139),
    "changelog_title",    "What's new in {1}",
    "btn_install",        "Download && Install",
    "btn_skip",           "Skip",
    "msg_no_changelog",   "No changelog available."
)

_v7572559c["ru"] := Map(
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
    "opt_auto_mini",      "Открывать мини-панель при старте",
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
    "btn_dismiss",        "x",
    "btn_whats_new",      Chr(0x2139),
    "changelog_title",    "Что нового в {1}",
    "btn_install",        "Скачать и установить",
    "btn_skip",           "Пропустить",
    "msg_no_changelog",   "Список изменений недоступен."
)

_v7572559c["ua"] := Map(
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
    "opt_auto_mini",      "Відкривати міні-панель при старті",
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
    "btn_dismiss",        "x",
    "btn_whats_new",      Chr(0x2139),
    "changelog_title",    "Що нового у {1}",
    "btn_install",        "Завантажити та встановити",
    "btn_skip",           "Пропустити",
    "msg_no_changelog",   "Список змін недоступний."
)

_fe358efa4(key, params*) {
    global _vb7cf90f6, _v7572559c
    if _v7572559c.Has(_vb7cf90f6) && _v7572559c[_vb7cf90f6].Has(key)
        text := _v7572559c[_vb7cf90f6][key]
    else if _v7572559c["en"].Has(key)
        text := _v7572559c["en"][key]
    else
        return key
    for i, val in params
        text := StrReplace(text, "{" i "}", val)
    return text
}

_v01113498 := {
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

_v1a70102d       := "151515"
_vc9913b4a    := "1C1C1C"
_vc95c8aa5    := "252525"
_v79a12290   := "2A2A2A"
_v64ed489e     := "E8E8E8"
_v2e2f2f38      := "777777"
_v8d8e5026    := "999999"
_vdece737e   := "CD412B"
_v2d1c65e5    := "4ADE80"
_vfcdac137      := "F87171"

_f87546eaa()
_f32a7be19()

if (_v938a2d53)
    _f0fb001d7(_v73339dcb, _v2d67864c)
_v2d7c179c := _f9ecf37d0()
_f5d13ad36()
_f9401ac2c()
if (_v2d7c179c.found)
    _f69818158(_fe358efa4("msg_server") _v01113498.ip ":" _v01113498.port)
else
    _f69818158(_fe358efa4("msg_no_server"))

SetTimer(_f6b5b9564, 300000)

SetTimer(_fe93ee81b, -2000)

_f87546eaa() {
    global _vb7cf90f6, _v73339dcb, _v2d67864c, _v938a2d53
    if !FileExist(_v74e63086)
        return
    try {
        _v01113498.ip           := IniRead(_v74e63086, "Settings", "ip",           _v01113498.ip)
        _v01113498.port         := IniRead(_v74e63086, "Settings", "port",         _v01113498.port)
        _v01113498.jumpInterval := _f99b5b2df(IniRead(_v74e63086, "Settings", "jumpInterval", _v01113498.jumpInterval), 5, 600)
        _v01113498.checkInterval:= _f99b5b2df(IniRead(_v74e63086, "Settings", "checkInterval",_v01113498.checkInterval), 5, 300)
        _v01113498.keyEnable    := IniRead(_v74e63086, "Settings", "keyEnable",    _v01113498.keyEnable)
        _v01113498.keyDisable   := IniRead(_v74e63086, "Settings", "keyDisable",   _v01113498.keyDisable)
        _v01113498.keyJump      := IniRead(_v74e63086, "Settings", "keyJump",      _v01113498.keyJump)
        _v01113498.keyConsole   := IniRead(_v74e63086, "Settings", "keyConsole",   _v01113498.keyConsole)
        _v01113498.reconnect    := IniRead(_v74e63086, "Settings", "reconnect",    _v01113498.reconnect) = "1"
        _v01113498.activeOnly   := IniRead(_v74e63086, "Settings", "activeOnly",   _v01113498.activeOnly) = "1"
        _v01113498.randomize    := IniRead(_v74e63086, "Settings", "randomize",    _v01113498.randomize) = "1"
        _v01113498.autoStop     := IniRead(_v74e63086, "Settings", "autoStop",     _v01113498.autoStop) = "1"
        _v01113498.autoMini     := IniRead(_v74e63086, "Settings", "autoMini",     _v01113498.autoMini) = "1"
        _v01113498.keyToggleGui := IniRead(_v74e63086, "Settings", "keyToggleGui", _v01113498.keyToggleGui)
        savedLang := IniRead(_v74e63086, "Settings", "language", "en")
        if (savedLang = "ru" || savedLang = "ua" || savedLang = "en")
            _vb7cf90f6 := savedLang

        _v73339dcb    := IniRead(_v74e63086, "Discord", "userId",    "")
        _v2d67864c  := IniRead(_v74e63086, "Discord", "username",  "")
        _v938a2d53 := IniRead(_v74e63086, "Discord", "authorized", "0") = "1"

        _v01113498.favorites := []
        favCount := IniRead(_v74e63086, "Favorites", "count", 0)
        try favCount := Integer(favCount)
        catch
            favCount := 0
        Loop favCount {
            favEntry := IniRead(_v74e63086, "Favorites", "server" A_Index, "")
            if (favEntry != "")
                _v01113498.favorites.Push(favEntry)
        }
    }
}

_f9f88f659() {
    if !_f0a615cb0()
        return
    _f4cabc19c()
    IniWrite(_v01113498.ip,           _v74e63086, "Settings", "ip")
    IniWrite(_v01113498.port,         _v74e63086, "Settings", "port")
    IniWrite(_v01113498.jumpInterval, _v74e63086, "Settings", "jumpInterval")
    IniWrite(_v01113498.checkInterval,_v74e63086, "Settings", "checkInterval")
    IniWrite(_v01113498.keyEnable,    _v74e63086, "Settings", "keyEnable")
    IniWrite(_v01113498.keyDisable,   _v74e63086, "Settings", "keyDisable")
    IniWrite(_v01113498.keyJump,      _v74e63086, "Settings", "keyJump")
    IniWrite(_v01113498.keyConsole,   _v74e63086, "Settings", "keyConsole")
    IniWrite(_v01113498.reconnect  ? "1":"0", _v74e63086, "Settings", "reconnect")
    IniWrite(_v01113498.activeOnly ? "1":"0", _v74e63086, "Settings", "activeOnly")
    IniWrite(_v01113498.randomize  ? "1":"0", _v74e63086, "Settings", "randomize")
    IniWrite(_v01113498.autoStop   ? "1":"0", _v74e63086, "Settings", "autoStop")
    IniWrite(_v01113498.autoMini   ? "1":"0", _v74e63086, "Settings", "autoMini")
    IniWrite(_v01113498.keyToggleGui, _v74e63086, "Settings", "keyToggleGui")
    IniWrite(_vb7cf90f6, _v74e63086, "Settings", "language")

    IniWrite(_v01113498.favorites.Length, _v74e63086, "Favorites", "count")
    Loop _v01113498.favorites.Length
        IniWrite(_v01113498.favorites[A_Index], _v74e63086, "Favorites", "server" A_Index)
    _f69818158(_fe358efa4("msg_saved"))
    ToolTip(_fe358efa4("msg_saved_tip"))
    SetTimer(() => ToolTip(), -1500)
}

_vb8acf12e := ""

_f6f0183c3() {
    paths := []
    profile := EnvGet("USERPROFILE")
    appdata := EnvGet("APPDATA")

    if FileExist(_v74e63086) {
        try {
            saved := IniRead(_v74e63086, "Settings", "logPath", "")
            if (saved != "")
                paths.Push(saved)
        }
    }

    dir1 := profile . "\AppData\LocalLow\Facepunch Studios\Rust"
    paths.Push(dir1 . "\Player.log")
    paths.Push(dir1 . "\output_log.txt")
    paths.Push(dir1 . "\Player-prev.log")

    dir2 := appdata . "\..\LocalLow\Facepunch Studios\Rust"
    paths.Push(dir2 . "\Player.log")
    paths.Push(dir2 . "\output_log.txt")

    try {
        steamPath := RegRead("HKEY_CURRENT_USER\Software\Valve\Steam", "SteamPath")
        if (steamPath != "") {
            steamPath := StrReplace(steamPath, "/", "\")

            rustRoot := steamPath . "\steamapps\common\Rust"
            paths.Push(rustRoot . "\output_log.txt")
            paths.Push(rustRoot . "\Player.log")
            paths.Push(rustRoot . "\RustClient_Data\output_log.txt")
            paths.Push(rustRoot . "\Logs\output_log.txt")

            vdfPath := steamPath . "\steamapps\libraryfolders.vdf"
            if FileExist(vdfPath) {
                try {
                    vdfText := FileRead(vdfPath, "UTF-8")
                    startPos := 1
                    Loop {
                        if !RegExMatch(vdfText, '"path"\s+"([^"]+)"', &mv, startPos)
                            break
                        libPath := StrReplace(mv[1], "\\", "\")
                        libRust := libPath . "\steamapps\common\Rust"
                        paths.Push(libRust . "\output_log.txt")
                        paths.Push(libRust . "\Player.log")
                        paths.Push(libRust . "\RustClient_Data\output_log.txt")
                        paths.Push(libRust . "\Logs\output_log.txt")
                        startPos := mv.Pos + mv.Len
                    }
                }
            }
        }
    }

    hardcoded := [
        "C:\Program Files (x86)\Steam\steamapps\common\Rust",
        "D:\Steam\steamapps\common\Rust",
        "D:\SteamLibrary\steamapps\common\Rust",
        "E:\SteamLibrary\steamapps\common\Rust",
        "C:\Games\Steam\steamapps\common\Rust"
    ]
    for hp in hardcoded {
        paths.Push(hp . "\output_log.txt")
        paths.Push(hp . "\Player.log")
        paths.Push(hp . "\RustClient_Data\output_log.txt")
        paths.Push(hp . "\Logs\output_log.txt")
    }

    return paths
}

_f493d7dde() {
    global _vb8acf12e
    if (_vb8acf12e != "" && FileExist(_vb8acf12e))
        return _vb8acf12e
    for path in _f6f0183c3() {
        if FileExist(path) {
            _vb8acf12e := path
            return path
        }
    }
    return ""
}

_fd887aa7e() {
    tmpFile := A_Temp . "\rust_log_search.tmp"

    profile := EnvGet("USERPROFILE")
    try {
        RunWait('cmd.exe /c dir /s /b "' profile '\AppData\LocalLow\*Player.log" > "' tmpFile '" 2>nul', , "Hide")
        if FileExist(tmpFile) {
            result := Trim(FileRead(tmpFile), "`r`n `t")
            FileDelete(tmpFile)
            if (result != "") {

                if RegExMatch(result, "^(.+)$", &m)
                    return m[1]
            }
        }
    }

    try {
        RunWait('cmd.exe /c dir /s /b "' profile '\AppData\LocalLow\*output_log.txt" > "' tmpFile '" 2>nul', , "Hide")
        if FileExist(tmpFile) {
            result := Trim(FileRead(tmpFile), "`r`n `t")
            FileDelete(tmpFile)
            if (result != "") {
                if RegExMatch(result, "^(.+)$", &m)
                    return m[1]
            }
        }
    }
    return ""
}

_fbda8ee5c(*) {
    global _vb8acf12e
    selected := FileSelect(1, , _fe358efa4("msg_browse_title"), _fe358efa4("msg_browse_filter"))
    if (selected = "")
        return
    _vb8acf12e := selected

    IniWrite(selected, _v74e63086, "Settings", "logPath")
    _f69818158(_fe358efa4("msg_log_set") selected)

    logText := _f0185453b(selected)
    if (logText != "") && _fcc753837(logText) {
        _v183c14e3.Value := _v01113498.ip
        _v99ebc9e2.Value := _v01113498.port
        _f69818158(_fe358efa4("msg_server") _v01113498.ip ":" _v01113498.port)
    } else {
        _f69818158(_fe358efa4("msg_ip_not_found"))
    }
}

_f78b782f4(*) {

    logPath := _f493d7dde()
    if (logPath != "") {
        logText := _f0185453b(logPath)
        if (logText != "") && _fcc753837(logText) {
            _v183c14e3.Value   := _v01113498.ip
            _v99ebc9e2.Value := _v01113498.port
            _f69818158(_fe358efa4("msg_server") _v01113498.ip ":" _v01113498.port)
            return
        }
    }

    result := _f9ecf37d0()
    if (result.found) {
        _v183c14e3.Value   := _v01113498.ip
        _v99ebc9e2.Value := _v01113498.port
        _f69818158(_fe358efa4("msg_server") _v01113498.ip ":" _v01113498.port)
    } else {
        _f69818158(_fe358efa4("msg_ip_not_found"))
    }
}

_f9ecf37d0() {
    global _vb8acf12e
    result := {found: false, source: "", tried: ""}
    triedList := ""

    for path in _f6f0183c3() {
        if FileExist(path) {
            triedList .= "  + " path "`r`n"
            logText := _f0185453b(path)
            if (logText != "") {
                if _fcc753837(logText) {
                    result.found := true
                    result.source := path
                    _vb8acf12e := path
                    return result
                } else {
                    triedList .= "    (IP не найден в файле)`r`n"
                }
            } else {
                triedList .= "    (пуст/не читается)`r`n"
            }
        }
    }

    triedList .= "  Поиск по диску...`r`n"
    searchResult := _fd887aa7e()
    if (searchResult != "") {
        triedList .= "  + Найден: " searchResult "`r`n"
        _vb8acf12e := searchResult
        logText := _f0185453b(searchResult)
        if (logText != "") && _fcc753837(logText) {
            result.found := true
            result.source := searchResult

            IniWrite(searchResult, _v74e63086, "Settings", "logPath")
            return result
        } else {
            triedList .= "    (IP не найден)`r`n"
        }
    } else {
        triedList .= "  Лог не найден. Нажмите 'Обзор' для ручного выбора.`r`n"
    }

    result.tried := triedList
    return result
}

_f0185453b(path) {

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
        tmpFile := A_Temp . "\rust_log_copy.tmp"
        RunWait('cmd.exe /c copy "' path '" "' tmpFile '" /Y', , "Hide")
        if FileExist(tmpFile) {
            text := FileRead(tmpFile, "UTF-8")
            FileDelete(tmpFile)
            return text
        }
    }
    return ""
}

_fcc753837(logText) {
    if (logText = "")
        return false

    foundIP := ""
    foundPort := ""

    startPos := 1
    Loop {
        if !RegExMatch(logText, "i)Connecting:\s+(\d{1,3}(?:\.\d{1,3}){3}):(\d{2,5})", &m, startPos)
            break
        foundIP := m[1]
        foundPort := m[2]
        startPos := m.Pos + m.Len
    }

    if (foundIP = "") {
        startPos := 1
        Loop {
            if !RegExMatch(logText, "i)client\.connect\s+(\d{1,3}(?:\.\d{1,3}){3}):(\d{2,5})", &m, startPos)
                break
            foundIP := m[1]
            foundPort := m[2]
            startPos := m.Pos + m.Len
        }
    }

    if (foundIP = "") {
        startPos := 1
        Loop {
            if !RegExMatch(logText, "i)connect(?:ing|ed)?[\s:]+(?:to\s+)?(\d{1,3}(?:\.\d{1,3}){3}):(\d{2,5})", &m, startPos)
                break
            foundIP := m[1]
            foundPort := m[2]
            startPos := m.Pos + m.Len
        }
    }

    if (foundIP = "") {
        startPos := 1
        Loop {
            if !RegExMatch(logText, "i)ip[=:\s]+(\d{1,3}(?:\.\d{1,3}){3})[\s,;]+port[=:\s]+(\d{2,5})", &m, startPos)
                break
            foundIP := m[1]
            foundPort := m[2]
            startPos := m.Pos + m.Len
        }
    }

    if (foundIP != "" && foundPort != "") {
        _v01113498.ip := foundIP
        _v01113498.port := foundPort
        return true
    }
    return false
}

_f99b5b2df(val, minVal, maxVal) {
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

_f0a615cb0() {
    try {
        j := Integer(_v7e713469.Value)
        c := Integer(_v9d045d0b.Value)
    } catch {
        MsgBox(_fe358efa4("msg_err_number"), _fe358efa4("msg_err_title"), "Icon!")
        return false
    }
    if (j < 5 || j > 600) {
        MsgBox(_fe358efa4("msg_err_jump"), _fe358efa4("msg_err_title"), "Icon!")
        return false
    }
    if (c < 5 || c > 300) {
        MsgBox(_fe358efa4("msg_err_check"), _fe358efa4("msg_err_title"), "Icon!")
        return false
    }
    return true
}

global _v91fe58d7, _va505e1a3, _v796f78d7, _v60faa67f, _vb900e671, _v33a1f8bc, _vfe845dd0
global _v183c14e3, _v99ebc9e2, _v7e713469, _v9d045d0b
global _v20d59c23, _v317da294, _v93bda80f, _v07f4d48a, _v9effb64d
global _v253d3292, _v86236a40, _vced80396, _vd7465424, _vd6436d26
global _v33621e0b
global _v6265d6b9, _vc6c2f754, _v468b3194, _vfd43c753, _vab6e7757
global _v5453c6b4 := ""

_f5d13ad36() {
    global _v91fe58d7, _va505e1a3, _v796f78d7, _v60faa67f, _vb900e671, _v33a1f8bc, _vfe845dd0
    global _v183c14e3, _v99ebc9e2, _v7e713469, _v9d045d0b
    global _v20d59c23, _v317da294, _v93bda80f, _v07f4d48a, _v9effb64d
    global _v253d3292, _v86236a40, _vced80396, _vd7465424, _vd6436d26
    global _v33621e0b
    global _v6265d6b9, _vc6c2f754, _v468b3194, _vfd43c753, _vab6e7757
    global _vf0631eac, _v94651a2f
    global _v1a70102d, _vc9913b4a, _vc95c8aa5, _v79a12290, _v64ed489e, _v2e2f2f38, _v8d8e5026, _vdece737e, _v2d1c65e5, _vfcdac137

    W := 380

    _v91fe58d7 := Gui("-Caption +AlwaysOnTop +Border", _fe358efa4("title"))
    _v91fe58d7.BackColor := _v1a70102d
    _v91fe58d7.SetFont("s10 c" _v64ed489e, "Segoe UI")
    _v91fe58d7.OnEvent("Close", _f25a5c065)
    _v91fe58d7.OnEvent("Size", _f5e0f8ca6)

    y := 0

    _v91fe58d7.Add("Text", "x0 y0 w" W " h56 Background" _vc9913b4a)
    _v91fe58d7.SetFont("s14 w700 c" _v64ed489e)
    _v91fe58d7.Add("Text", "x20 y10 w200 BackgroundTrans", "RUST ANTI-AFK")
    _v91fe58d7.SetFont("s8 w400 c" _v2e2f2f38)
    _v91fe58d7.Add("Text", "x20 y34 BackgroundTrans", _fe358efa4("subtitle"))
    _v91fe58d7.SetFont("s8 w400 c" _v8d8e5026)
    _v91fe58d7.Add("Text", "x230 y10 w80 Right BackgroundTrans", "v" _v5e603fe8)

    hdrDrag := _v91fe58d7.Add("Text", "x0 y0 w" (W-58) " h56 BackgroundTrans 0x200")
    hdrDrag.OnEvent("Click", (*) => PostMessage(0xA1, 2, 0, , "ahk_id " _v91fe58d7.Hwnd))

    _v91fe58d7.SetFont("s9 w400 c" _v2e2f2f38)
    btnWinMin := _v91fe58d7.Add("Text", "x" (W-54) " y0 w26 h28 Background" _vc9913b4a " Center 0x200", Chr(0x2013))
    btnWinMin.OnEvent("Click", (*) => WinMinimize("ahk_id " _v91fe58d7.Hwnd))
    btnWinClose := _v91fe58d7.Add("Text", "x" (W-28) " y0 w28 h28 Background" _vc9913b4a " Center 0x200", Chr(0x2715))
    btnWinClose.OnEvent("Click", (*) => _v91fe58d7.Hide())
    y := 56

    _v91fe58d7.Add("Text", "x0 y" y " w" W " h36 Background" _v1a70102d)
    _v91fe58d7.SetFont("s10 w700 c" _vfcdac137)
    _v796f78d7 := _v91fe58d7.Add("Text", "x20 y" (y+9) " w12 BackgroundTrans", Chr(0x25CF))
    _va505e1a3 := _v91fe58d7.Add("Text", "x36 y" (y+8) " w100 BackgroundTrans", _fe358efa4("stopped"))
    _v91fe58d7.SetFont("s9 w400 c" _v2e2f2f38)
    _vfe845dd0 := _v91fe58d7.Add("Text", "x140 y" (y+10) " w100 Center BackgroundTrans", "")
    _v33a1f8bc := _v91fe58d7.Add("Text", "x240 y" (y+10) " w120 Right BackgroundTrans", "")
    y += 36

    _v6265d6b9 := _v91fe58d7.Add("Text", "x0 y" y " w" W " h40 Background1A3A1A vUpdateBannerBg Hidden")

    _v91fe58d7.SetFont("s12 w700 c4ADE80")
    _vc6c2f754 := _v91fe58d7.Add("Text", "x12 y" (y+10) " w18 BackgroundTrans vUpdateBannerIcon Hidden", Chr(0x2B06))

    _v91fe58d7.SetFont("s9 w600 cE8E8E8")
    bannerMsg := (_vf0631eac != "") ? _fe358efa4("msg_update_found", _vf0631eac) : ""
    _v468b3194 := _v91fe58d7.Add("Text", "x34 y" (y+12) " w188 BackgroundTrans vUpdateBannerText Hidden", bannerMsg)

    bannerSep1 := _v91fe58d7.Add("Text", "x224 y" (y+8) " w1 h24 Background2A4A2A vbannerSep1 Hidden")

    _v91fe58d7.SetFont("s10 w700 c4ADE80")
    UpdateBannerInfo := _v91fe58d7.Add("Text", "x225 y" y " w32 h40 BackgroundTrans Center vUpdateBannerInfo Hidden 0x200", _fe358efa4("btn_whats_new"))
    UpdateBannerInfo.OnEvent("Click", (*) => _ff5a3f03a())

    bannerSep2 := _v91fe58d7.Add("Text", "x257 y" (y+8) " w1 h24 Background2A4A2A vbannerSep2 Hidden")

    _v91fe58d7.SetFont("s9 w700 cE8E8E8")
    _vfd43c753 := _v91fe58d7.Add("Text", "x258 y" y " w80 h40 BackgroundTrans Center vUpdateBannerBtn Hidden 0x200", _fe358efa4("btn_download"))
    _vfd43c753.OnEvent("Click", (*) => _fcc5c89af())

    bannerSep3 := _v91fe58d7.Add("Text", "x338 y" (y+8) " w1 h24 Background2A4A2A vbannerSep3 Hidden")

    _v91fe58d7.SetFont("s9 w400 c4ADE80")
    _vab6e7757 := _v91fe58d7.Add("Text", "x339 y" y " w39 h40 BackgroundTrans Center vUpdateBannerClose Hidden 0x200", Chr(0x2715))
    _vab6e7757.OnEvent("Click", (*) => _f39015080())
    if (_vf0631eac != "") {
        _v6265d6b9.Visible    := true
        _vc6c2f754.Visible  := true
        _v468b3194.Visible  := true
        bannerSep1.Visible        := true
        UpdateBannerInfo.Visible  := true
        bannerSep2.Visible        := true
        _vfd43c753.Visible   := true
        bannerSep3.Visible        := true
        _vab6e7757.Visible := true
        y += 44
    }

    _v91fe58d7.Add("Text", "x16 y" y " w" (W-32) " h1 0x10")
    y += 8

    _v91fe58d7.SetFont("s8 w700 c" _v8d8e5026)
    _v91fe58d7.Add("Text", "x20 y" y, _fe358efa4("language"))
    y += 18

    _v91fe58d7.SetFont("s9 w400 c" _v64ed489e)
    langIdx := (_vb7cf90f6 = "en") ? 1 : (_vb7cf90f6 = "ru") ? 2 : 3
    DDLang := _v91fe58d7.Add("DropDownList", "x20 y" y " w340 Background" _vc95c8aa5 " Choose" langIdx, ["English", "Русский", "Українська"])
    DDLang.OnEvent("Change", _ffed7a20b)
    y += 34

    _v91fe58d7.Add("Text", "x16 y" y " w" (W-32) " h1 0x10")
    y += 8

    _v91fe58d7.SetFont("s8 w700 c" _v8d8e5026)
    _v91fe58d7.Add("Text", "x20 y" y, _fe358efa4("server"))
    y += 18

    _v91fe58d7.SetFont("s8 w400 c" _v2e2f2f38)
    _v91fe58d7.Add("Text", "x20 y" y, _fe358efa4("ip"))
    _v91fe58d7.Add("Text", "x212 y" y, _fe358efa4("port"))
    y += 16

    _v91fe58d7.SetFont("s10 w400 c" _v64ed489e)
    _v183c14e3   := _v91fe58d7.Add("Edit", "x20 y" y " w188 h28 Background" _vc95c8aa5, _v01113498.ip)
    _v99ebc9e2 := _v91fe58d7.Add("Edit", "x212 y" y " w72 h28 Background" _vc95c8aa5, _v01113498.port)
    _v91fe58d7.SetFont("s11 w700 c" _vdece737e)
    BtnRefresh := _v91fe58d7.Add("Text", "x288 y" y " w30 h28 Background" _vc95c8aa5 " Center 0x200", Chr(0x21BB))
    BtnRefresh.OnEvent("Click", _f78b782f4)
    _v91fe58d7.SetFont("s10 w400 c" _v64ed489e)
    BtnBrowse := _v91fe58d7.Add("Text", "x322 y" y " w38 h28 Background" _vc95c8aa5 " Center 0x200", "...")
    BtnBrowse.OnEvent("Click", _fbda8ee5c)
    y += 38

    _v91fe58d7.SetFont("s8 w700 c" _v8d8e5026)
    _v91fe58d7.Add("Text", "x20 y" y, _fe358efa4("timers"))
    y += 18

    _v91fe58d7.SetFont("s8 w400 c" _v2e2f2f38)
    _v91fe58d7.Add("Text", "x20 y" y, _fe358efa4("jump_interval"))
    _v91fe58d7.Add("Text", "x200 y" y, _fe358efa4("kick_check"))
    y += 16

    _v91fe58d7.SetFont("s10 w400 c" _v64ed489e)
    _v7e713469  := _v91fe58d7.Add("Edit", "x20  y" y " w170 h28 Background" _vc95c8aa5 " Number", _v01113498.jumpInterval)
    _v9d045d0b := _v91fe58d7.Add("Edit", "x200 y" y " w160 h28 Background" _vc95c8aa5 " Number", _v01113498.checkInterval)
    y += 38

    _v91fe58d7.Add("Text", "x16 y" y " w" (W-32) " h1 0x10")
    y += 8

    _v91fe58d7.SetFont("s8 w700 c" _v8d8e5026)
    _v91fe58d7.Add("Text", "x20 y" y, _fe358efa4("hotkeys"))
    y += 22

    y := _f26eefb64(_v91fe58d7, _fe358efa4("start_afk"),    &_v20d59c23,   _v01113498.keyEnable,  y)
    y := _f26eefb64(_v91fe58d7, _fe358efa4("stop_afk"),     &_v317da294,  _v01113498.keyDisable, y)
    y := _f26eefb64(_v91fe58d7, _fe358efa4("jump_key"),     &_v93bda80f, _v01113498.keyJump,    y)
    y := _f26eefb64(_v91fe58d7, _fe358efa4("console_key"),  &_v07f4d48a,  _v01113498.keyConsole, y)
    y := _f26eefb64(_v91fe58d7, _fe358efa4("toggle_gui"),   &_v9effb64d, _v01113498.keyToggleGui, y)
    y += 4

    _v91fe58d7.Add("Text", "x16 y" y " w" (W-32) " h1 0x10")
    y += 8

    _v91fe58d7.SetFont("s8 w700 c" _v8d8e5026)
    _v91fe58d7.Add("Text", "x20 y" y, _fe358efa4("options"))
    y += 22

    _v91fe58d7.SetFont("s9 w400 c" _v64ed489e)
    _v253d3292 := _v91fe58d7.Add("Checkbox", "x20 y" y " w340 " (_v01113498.reconnect ? "Checked" : ""), _fe358efa4("opt_reconnect"))
    y += 24
    _v86236a40:= _v91fe58d7.Add("Checkbox", "x20 y" y " w340 " (_v01113498.activeOnly ? "Checked" : ""), _fe358efa4("opt_active_only"))
    y += 24
    _vced80396    := _v91fe58d7.Add("Checkbox", "x20 y" y " w340 " (_v01113498.randomize  ? "Checked" : ""), _fe358efa4("opt_randomize"))
    y += 24
    _vd7465424  := _v91fe58d7.Add("Checkbox", "x20 y" y " w340 " (_v01113498.autoStop   ? "Checked" : ""), _fe358efa4("opt_autostop"))
    y += 24
    _vd6436d26  := _v91fe58d7.Add("Checkbox", "x20 y" y " w340 " (_v01113498.autoMini   ? "Checked" : ""), _fe358efa4("opt_auto_mini"))
    y += 32

    _v91fe58d7.Add("Text", "x16 y" y " w" (W-32) " h1 0x10")
    y += 8

    _v91fe58d7.SetFont("s8 w700 c" _v8d8e5026)
    _v91fe58d7.Add("Text", "x20 y" y, _fe358efa4("favorites"))
    y += 18

    favList := []
    for fav in _v01113498.favorites
        favList.Push(fav)
    if (favList.Length = 0)
        favList.Push(_fe358efa4("fav_empty"))

    _v91fe58d7.SetFont("s9 w400 c" _v64ed489e)
    _v33621e0b := _v91fe58d7.Add("DropDownList", "x20 y" y " w260 Background" _vc95c8aa5 " Choose1", favList)
    _v33621e0b.OnEvent("Change", _fc5b941cb)

    BtnFavAdd := _v91fe58d7.Add("Text", "x286 y" y " w34 h26 Background" _vc95c8aa5 " Center 0x200", _fe358efa4("fav_add"))
    BtnFavAdd.OnEvent("Click", (*) => _f402eb6d4())
    BtnFavDel := _v91fe58d7.Add("Text", "x326 y" y " w34 h26 Background" _vc95c8aa5 " Center 0x200", _fe358efa4("fav_del"))
    BtnFavDel.OnEvent("Click", (*) => _ff671642a())
    y += 36

    _v91fe58d7.Add("Text", "x16 y" y " w" (W-32) " h1 0x10")
    y += 8

    bW4 := W // 4
    _v91fe58d7.Add("Text", "x0 y" y " w" W " h38 Background" _vc9913b4a)

    _v91fe58d7.SetFont("s10 w700 c" _v2d1c65e5)
    _v60faa67f := _v91fe58d7.Add("Text", "x0 y" y " w" bW4 " h38 BackgroundTrans Center 0x200", Chr(0x25B6) " " _fe358efa4("btn_start"))
    _v60faa67f.OnEvent("Click", _f0f124e47)
    _v91fe58d7.Add("Text", "x" bW4 " y" (y+6) " w1 h26 Background" _v79a12290)

    _v91fe58d7.SetFont("s9 w400 c" _v64ed489e)
    BtnSave := _v91fe58d7.Add("Text", "x" bW4 " y" y " w" bW4 " h38 BackgroundTrans Center 0x200", _fe358efa4("btn_save"))
    BtnSave.OnEvent("Click", (*) => _f9f88f659())
    _v91fe58d7.Add("Text", "x" (2*bW4) " y" (y+6) " w1 h26 Background" _v79a12290)

    BtnReset := _v91fe58d7.Add("Text", "x" (2*bW4) " y" y " w" bW4 " h38 BackgroundTrans Center 0x200", _fe358efa4("btn_reset"))
    BtnReset.OnEvent("Click", _f12fc42dd)
    _v91fe58d7.Add("Text", "x" (3*bW4) " y" (y+6) " w1 h26 Background" _v79a12290)

    _v91fe58d7.SetFont("s9 w400 c" _vdece737e)
    BtnUpdate := _v91fe58d7.Add("Text", "x" (3*bW4) " y" y " w" bW4 " h38 BackgroundTrans Center 0x200", Chr(0x21BB) " " _fe358efa4("btn_update"))
    BtnUpdate.OnEvent("Click", (*) => _f5d08bc02())
    y += 38

    _v91fe58d7.Add("Text", "x0 y" y " w" W " h1 Background" _v79a12290)
    y += 1
    BtnMini := _v91fe58d7.Add("Text", "x0 y" y " w" W " h30 Background" _vc9913b4a " Center 0x200", Chr(0x25A3) " " _fe358efa4("mini_mode"))
    BtnMini.OnEvent("Click", (*) => _fd0d11710())
    y += 30

    _v91fe58d7.Add("Text", "x16 y" y " w" (W-32) " h1 0x10")
    y += 6

    _v91fe58d7.SetFont("s8 w700 c" _v8d8e5026)
    _v91fe58d7.Add("Text", "x20 y" y, _fe358efa4("log"))
    y += 18

    _v91fe58d7.SetFont("s8 w400 c" _v2e2f2f38, "Consolas")
    _vb900e671 := _v91fe58d7.Add("Edit", "x20 y" y " w340 h90 Background" _vc95c8aa5 " ReadOnly Multi VScroll -E0x200")
    y += 98

    _v91fe58d7.SetFont("s10 c" _v64ed489e, "Segoe UI")

    _v91fe58d7.Show("w" W " h" y)
    _fd36b5c29()
}

_ffed7a20b(ctrl, *) {
    global _vb7cf90f6
    langMap := Map(1, "en", 2, "ru", 3, "ua")
    newLang := langMap[ctrl.Value]
    if (newLang = _vb7cf90f6)
        return
    _vb7cf90f6 := newLang
    _f4cabc19c()

    SetTimer(_f3db36acd, 0)
    SetTimer(_f38f8fd9f, 0)
    _fa0155b4f()
    _f609bf9b7()
    _v91fe58d7.Destroy()
    _f5d13ad36()
    IniWrite(_vb7cf90f6, _v74e63086, "Settings", "language")
    _f69818158(_fe358efa4("msg_saved"))

    if _v6d964f3e {
        SetTimer(_f3db36acd, 1000)
    }
}

_f26eefb64(g, label, &editRef, val, y) {
    global _v2e2f2f38, _v64ed489e, _vc95c8aa5, _v8d8e5026
    g.SetFont("s9 w400 c" _v2e2f2f38)
    g.Add("Text", "x20 y" (y+4) " w120", label)
    g.SetFont("s9 w400 c" _v64ed489e)
    editRef := g.Add("Edit", "x148 y" y " w90 h26 Background" _vc95c8aa5 " Center ReadOnly", val)
    g.SetFont("s8 w700 c" _v8d8e5026)
    btn := g.Add("Text", "x244 y" y " w50 h26 Background" _vc95c8aa5 " Center 0x200", "SET")
    btn.OnEvent("Click", _f2fb80233(editRef))
    return y + 30
}

global _v74eb094e := ""
global _v9271d90c := ""
global _v9b13277c := ""
global _v74d83e08 := ""
global _veb597e2b := ""
global _vdfe319f3 := 0

_fd36b5c29() {

    A_TrayMenu.Delete()
    A_TrayMenu.Add(_fe358efa4("tray_show"), _f32e668fa)
    A_TrayMenu.Default := _fe358efa4("tray_show")
    A_IconTip := "Rust Anti-AFK v" _v5e603fe8
    OnMessage(0x404, _fd5c4d7d6)
}

_fd5c4d7d6(wParam, lParam, *) {
    if (lParam = 0x205) {
        _f87c099a0()
        return 1
    }
    if (lParam = 0x202) {
        _f32e668fa()
        return 1
    }
}

_f87c099a0() {
    global _v74eb094e, _v9271d90c, _v9b13277c, _v74d83e08, _veb597e2b
    global _v1a70102d, _vc9913b4a, _vc95c8aa5, _v79a12290, _v64ed489e, _v2e2f2f38, _v8d8e5026, _vdece737e, _v2d1c65e5, _vfcdac137
    global _v6d964f3e, _v2ce5463b, _vfc38dc65, _ve8f55cfc, _vdfe319f3

    if (_v74eb094e != "") {
        try _v74eb094e.Destroy()
        _v74eb094e := ""
    }

    W := 250
    _v74eb094e := Gui("-Caption +AlwaysOnTop +ToolWindow +Border", "TrayMenu")
    _v74eb094e.BackColor := _vc9913b4a
    _v74eb094e.MarginX := 0
    _v74eb094e.MarginY := 0

    y := 0

    _v74eb094e.Add("Text", "x0 y0 w" W " h42 Background" _v1a70102d)
    _v74eb094e.SetFont("s11 w700 c" _vdece737e, "Bahnschrift")
    _v74eb094e.Add("Text", "x14 y11 BackgroundTrans", Chr(0x25C6) "  RUST ANTI-AFK")
    _v74eb094e.SetFont("s8 w400 c" _v2e2f2f38, "Bahnschrift")
    _v74eb094e.Add("Text", "x" (W-58) " y15 w48 Right BackgroundTrans", "v" _v5e603fe8)
    y := 42

    _v74eb094e.Add("Text", "x0 y" y " w" W " h1 Background" _v79a12290)
    y += 1

    _v74eb094e.Add("Text", "x0 y" y " w" W " h64 Background" _vc9913b4a)
    statusClr := _v6d964f3e ? _v2d1c65e5 : _vfcdac137
    _v74eb094e.SetFont("s10 w700 c" statusClr, "Bahnschrift")
    _v9271d90c := _v74eb094e.Add("Text", "x14 y" (y+9) " w14 BackgroundTrans", Chr(0x25CF))
    _v9b13277c := _v74eb094e.Add("Text", "x30 y" (y+8) " w200 BackgroundTrans", _v6d964f3e ? _fe358efa4("active") : _fe358efa4("stopped"))

    _v74eb094e.SetFont("s9 w400 c" _v2e2f2f38, "Consolas")
    sessionStr := ""
    if _v6d964f3e && (_ve8f55cfc > 0) {
        elapsed := (A_TickCount - _ve8f55cfc) // 1000
        h := elapsed // 3600
        m := Mod(elapsed // 60, 60)
        s := Mod(elapsed, 60)
        sessionStr := Format("{:02d}:{:02d}:{:02d}", h, m, s)
    }
    _v74d83e08 := _v74eb094e.Add("Text", "x30 y" (y+31) " w110 BackgroundTrans", sessionStr)

    _v74eb094e.SetFont("s8 w400 c" _v8d8e5026, "Bahnschrift")
    _veb597e2b := _v74eb094e.Add("Text", "x" (W-90) " y" (y+33) " w80 Right BackgroundTrans",
        _v6d964f3e ? "J:" _v2ce5463b "  R:" _vfc38dc65 : "")
    y += 64

    _v74eb094e.Add("Text", "x10 y" y " w" (W-20) " h1 Background" _v79a12290)
    y += 1

    btnH := 38

    btnShow := _v74eb094e.Add("Text", "x0 y" y " w" W " h" btnH " Background" _vc9913b4a " 0x200")
    _v74eb094e.SetFont("s10 w400 c" _vdece737e, "Bahnschrift")
    _v74eb094e.Add("Text", "x14 y" (y+10) " w18 BackgroundTrans", Chr(0x25B3))
    _v74eb094e.SetFont("s10 w400 c" _v64ed489e, "Bahnschrift")
    _v74eb094e.Add("Text", "x36 y" (y+10) " w" (W-40) " BackgroundTrans", _fe358efa4("tray_show"))
    btnShow.OnEvent("Click", _f5a93554e)
    y += btnH

    toggleIcon := _v6d964f3e ? Chr(0x25A0) : Chr(0x25B6)
    toggleClr := _v6d964f3e ? _vfcdac137 : _v2d1c65e5
    _v60faa67f := _v74eb094e.Add("Text", "x0 y" y " w" W " h" btnH " Background" _vc9913b4a " 0x200")
    _v74eb094e.SetFont("s10 w400 c" toggleClr, "Bahnschrift")
    _v74eb094e.Add("Text", "x14 y" (y+10) " w18 BackgroundTrans", toggleIcon)
    _v74eb094e.SetFont("s10 w400 c" _v64ed489e, "Bahnschrift")
    _v74eb094e.Add("Text", "x36 y" (y+10) " w" (W-40) " BackgroundTrans", _fe358efa4("tray_toggle"))
    _v60faa67f.OnEvent("Click", _ffde7c6b0)
    y += btnH

    _v74eb094e.Add("Text", "x0 y" y " w" W " h1 Background" _v79a12290)
    y += 1

    btnExit := _v74eb094e.Add("Text", "x0 y" y " w" W " h" btnH " Background" _vc9913b4a " 0x200")
    _v74eb094e.SetFont("s10 w400 c" _vfcdac137, "Bahnschrift")
    _v74eb094e.Add("Text", "x14 y" (y+10) " w" W " BackgroundTrans", Chr(0x2715) "   " _fe358efa4("tray_exit"))
    btnExit.OnEvent("Click", (*) => ExitApp())
    y += btnH

    CoordMode("Mouse", "Screen")
    MouseGetPos(&mx, &my)
    sw := A_ScreenWidth
    sh := A_ScreenHeight
    px := (mx + W > sw) ? sw - W - 4 : mx
    py := (my - y < 0) ? 0 : my - y
    _v74eb094e.Show("x" px " y" py " w" W " h" y " NoActivate")

    if (_vdfe319f3 != 0)
        SetTimer(_vdfe319f3, 0)
    _vdfe319f3 := _f5b756b09
    SetTimer(_vdfe319f3, 1000)

    SetTimer(_fdcb57deb, 200)
}

_f5b756b09() {
    global _v74eb094e, _v9271d90c, _v9b13277c, _v74d83e08, _veb597e2b
    global _v6d964f3e, _v2ce5463b, _vfc38dc65, _ve8f55cfc, _v2d1c65e5, _vfcdac137
    if (_v74eb094e = "")
        return

    try {
        statusClr := _v6d964f3e ? _v2d1c65e5 : _vfcdac137
        _v9271d90c.SetFont("c" statusClr)
        _v9b13277c.SetFont("c" statusClr)
        _v9b13277c.Value := _v6d964f3e ? _fe358efa4("active") : _fe358efa4("stopped")

        if _v6d964f3e && (_ve8f55cfc > 0) {
            elapsed := (A_TickCount - _ve8f55cfc) // 1000
            h := elapsed // 3600
            m := Mod(elapsed // 60, 60)
            s := Mod(elapsed, 60)
            _v74d83e08.Value := Format("{:02d}:{:02d}:{:02d}", h, m, s)
            _veb597e2b.Value := "J:" _v2ce5463b "  R:" _vfc38dc65
        } else {
            _v74d83e08.Value := ""
            _veb597e2b.Value := ""
        }
    }
}

_fdcb57deb() {
    global _v74eb094e, _vdfe319f3
    if (_v74eb094e = "") {
        SetTimer(_fdcb57deb, 0)
        return
    }
    try {
        hwnd := _v74eb094e.Hwnd
        if !hwnd || !WinExist("ahk_id " hwnd) {
            _fa0155b4f()
            return
        }

        CoordMode("Mouse", "Screen")
        MouseGetPos(&mx, &my)
        WinGetPos(&wx, &wy, &ww, &wh, "ahk_id " _v74eb094e.Hwnd)
        if (mx < wx || mx > wx+ww || my < wy || my > wy+wh) {
            if GetKeyState("LButton", "P") || GetKeyState("RButton", "P")
                _fa0155b4f()
        }
    }
}

_fa0155b4f() {
    global _v74eb094e, _vdfe319f3
    if (_vdfe319f3 != 0) {
        SetTimer(_vdfe319f3, 0)
        _vdfe319f3 := 0
    }
    SetTimer(_fdcb57deb, 0)
    if (_v74eb094e != "") {
        try _v74eb094e.Destroy()
        _v74eb094e := ""
    }
}

_f5a93554e(*) {
    _fa0155b4f()
    _f32e668fa()
}

_ffde7c6b0(*) {
    _fa0155b4f()
    _f0f124e47()
}

_f32e668fa(*) {
    _v91fe58d7.Show()
    WinRestore("ahk_id " _v91fe58d7.Hwnd)
}

_f25a5c065(*) {
    _v91fe58d7.Hide()
}

_f5e0f8ca6(thisGui, minMax, *) {
    if (minMax = -1)
        thisGui.Hide()
}

_f38f8fd9f() {
    global _v2ce5463b, _vfc38dc65
    if IsSet(_v33a1f8bc) && IsObject(_v33a1f8bc)
        try _v33a1f8bc.Value := "J:" _v2ce5463b "  R:" _vfc38dc65
}

_f3db36acd() {
    global _ve8f55cfc
    if !IsSet(_vfe845dd0) || !IsObject(_vfe845dd0)
        return
    elapsed := (A_TickCount - _ve8f55cfc) // 1000
    h := elapsed // 3600
    m := Mod(elapsed // 60, 60)
    s := Mod(elapsed, 60)
    try _vfe845dd0.Value := Format("{:02d}:{:02d}:{:02d}", h, m, s)
}

_f2fb80233(editCtrl) {
    return (*) => _f8287dfac(editCtrl)
}

_f8287dfac(editCtrl) {
    ToolTip(_fe358efa4("msg_press_key"))
    ih := InputHook("L0 T5")
    ih.KeyOpt("{All}", "E")
    ih.KeyOpt("{Escape}", "-E")
    ih.Start()
    ih.Wait()
    if (ih.EndReason = "EndKey") {
        key := ih.EndKey
        editCtrl.Value := key
    }
    ToolTip()
}

_f4cabc19c() {
    _v01113498.ip            := _v183c14e3.Value
    _v01113498.port          := _v99ebc9e2.Value
    _v01113498.jumpInterval  := _f99b5b2df(_v7e713469.Value, 5, 600)
    _v01113498.checkInterval := _f99b5b2df(_v9d045d0b.Value, 5, 300)
    _v01113498.keyEnable     := _v20d59c23.Value
    _v01113498.keyDisable    := _v317da294.Value
    _v01113498.keyJump       := _v93bda80f.Value
    _v01113498.keyConsole    := _v07f4d48a.Value
    _v01113498.keyToggleGui  := _v9effb64d.Value
    _v01113498.reconnect     := _v253d3292.Value
    _v01113498.activeOnly    := _v86236a40.Value
    _v01113498.randomize     := _vced80396.Value
    _v01113498.autoStop      := _vd7465424.Value
    _v01113498.autoMini      := _vd6436d26.Value
}

_f9401ac2c() {
    try Hotkey(_v01113498.keyEnable,  _f13912936, "On")
    try Hotkey(_v01113498.keyDisable, _f614e02ed,  "On")
    try Hotkey(_v01113498.keyToggleGui, _f37c38a02, "On")
}

_fb68f745c() {
    try Hotkey(_v01113498.keyEnable,  "Off")
    try Hotkey(_v01113498.keyDisable, "Off")
    try Hotkey(_v01113498.keyToggleGui, "Off")
}

_f37c38a02(*) {
    if WinExist("ahk_id " _v91fe58d7.Hwnd) && WinActive("ahk_id " _v91fe58d7.Hwnd)
        _v91fe58d7.Hide()
    else {
        _v91fe58d7.Show()
        WinRestore("ahk_id " _v91fe58d7.Hwnd)
    }
}

_f0f124e47(*) {
    global _v6d964f3e
    if _v6d964f3e
        _f614e02ed()
    else
        _f13912936()
}

_f13912936(*) {
    global _v6d964f3e, _v2ce5463b, _vfc38dc65, _vdf7ad575, _vc754a9e9, _v2d1c65e5, _vfcdac137, _ve8f55cfc, _v938a2d53
    if _v6d964f3e
        return
    if !_v938a2d53 {
        MsgBox("Discord authorization required.`nPlease restart the script.", "Rust Anti-AFK", 0x10)
        ExitApp()
    }
    if !_f0a615cb0()
        return
    _f4cabc19c()
    _v6d964f3e := true
    _v2ce5463b := 0
    _vfc38dc65 := 0
    _v82d9fbbb := 0
    _ve8f55cfc := A_TickCount

    logPath := _f493d7dde()
    if (logPath != "") {
        try {
            f := FileOpen(logPath, "r", "UTF-8")
            if IsObject(f) {
                _vdf7ad575 := f.Length
                f.Close()
            }
        }
    }
    _vc754a9e9 := true

    jumpMs := _v01113498.jumpInterval * 1000

    SetTimer(_fb809432b, jumpMs)
    if _v01113498.reconnect
        SetTimer(_f4e8f5a18, _v01113498.checkInterval * 1000)
    SetTimer(_f3db36acd, 1000)
    if _v01113498.autoStop
        SetTimer(_f61a1a829, 5000)

    _v796f78d7.SetFont("c" _v2d1c65e5)
    _va505e1a3.Value := _fe358efa4("active")
    _va505e1a3.SetFont("c" _v2d1c65e5)
    _v60faa67f.Value := Chr(0x25A0) " " _fe358efa4("btn_stop")
    _v60faa67f.SetFont("c" _vfcdac137)
    _f38f8fd9f()

    try WinSetExStyle("+0x8000000", "ahk_id " _v91fe58d7.Hwnd)

    _fb68f745c()
    _f9401ac2c()

    if _v01113498.autoMini
        _f39f37009()

    _f69818158(_fe358efa4("msg_started", _v01113498.jumpInterval, _v01113498.checkInterval))
}

_f614e02ed(*) {
    global _v6d964f3e, _vfcdac137, _v2d1c65e5, _v99473393
    if !_v6d964f3e
        return
    _v6d964f3e := false
    _v99473393 := false
    SetTimer(_fb809432b, 0)
    SetTimer(_f4e8f5a18, 0)
    SetTimer(_f3db36acd, 0)
    SetTimer(_f61a1a829, 0)
    SetTimer(_f25b2059a, 0)
    try _vfe845dd0.Value := ""
    try _v796f78d7.SetFont("c" _vfcdac137)
    try _va505e1a3.Value := _fe358efa4("stopped")
    try _va505e1a3.SetFont("c" _vfcdac137)
    try _v60faa67f.Value := Chr(0x25B6) " " _fe358efa4("btn_start")
    try _v60faa67f.SetFont("c" _v2d1c65e5)

    try WinSetExStyle("-0x8000000", "ahk_id " _v91fe58d7.Hwnd)
    _f69818158(_fe358efa4("msg_stopped", _v2ce5463b, _vfc38dc65))
}

_fb809432b() {
    global _v2ce5463b, _v938a2d53
    if !_v938a2d53
        return
    if !WinExist("ahk_exe RustClient.exe")
        return
    if _v01113498.activeOnly && !WinActive("ahk_exe RustClient.exe")
        return
    SendInput("{" _v01113498.keyJump "}")
    _v2ce5463b++
    _f38f8fd9f()

    if _v01113498.randomize {
        rnd := Random(-5000, 5000)
        baseMs := _v01113498.jumpInterval * 1000
        newInterval := baseMs + rnd
        if newInterval < 5000
            newInterval := 5000
        SetTimer(_fb809432b, newInterval)
    }
}

_f6a944d65() {
    global _vdf7ad575
    logPath := _f493d7dde()
    if (logPath = "")
        return ""

    try {
        fileObj := FileOpen(logPath, "r", "UTF-8")
    } catch {
        return ""
    }
    if !IsObject(fileObj)
        return ""

    currentSize := fileObj.Length
    if (currentSize < _vdf7ad575)
        _vdf7ad575 := 0
    if (currentSize = _vdf7ad575) {
        fileObj.Close()
        return ""
    }

    fileObj.Seek(_vdf7ad575)
    newText := fileObj.Read()
    _vdf7ad575 := currentSize
    fileObj.Close()
    return newText
}

_f4e8f5a18() {
    global _v99473393
    if !WinExist("ahk_exe RustClient.exe")
        return

    logPath := _f493d7dde()

    if (logPath != "") {
        _v99473393 := false
        _fa5ec337a()
        return
    }

    if !_v99473393 {
        _v99473393 := true
        _f69818158(_fe358efa4("msg_no_log_fallback"))
    }
}

_fa5ec337a() {
    global _vc754a9e9, _v82d9fbbb
    newLines := _f6a944d65()
    if (newLines = "")
        return

    if RegExMatch(newLines, "im)Spawning World|Destroyed \d+ map networkables|already connecting or connected|DoClientConnected|Loading Terrain") {
        if !_vc754a9e9 {
            _vc754a9e9 := true
            _v82d9fbbb := 0
            SetTimer(_f25b2059a, 0)
            _f69818158(_fe358efa4("msg_connected"))
        }
        return
    }

    if RegExMatch(newLines, "im)Disconnected \(|EAC Disconnect|Kicked:|Timed Out|ConnectionLost") {
        if _vc754a9e9 {
            _vc754a9e9 := false
            _v82d9fbbb := 0
            _f69818158(_fe358efa4("msg_disconnect"))
            _f87acf9ad()
        }
    }
}

_f87acf9ad() {
    global _vfc38dc65, _v82d9fbbb, _vc1caac16, _vbde49810
    global _vc754a9e9
    if !WinExist("ahk_exe RustClient.exe")
        return

    _v82d9fbbb++
    if (_v82d9fbbb > _vc1caac16) {
        _f69818158(_fe358efa4("msg_reconnect_give_up", _vc1caac16))
        return
    }

    if !WinActive("ahk_exe RustClient.exe") {
        WinActivate("ahk_exe RustClient.exe")
        Sleep(800)
    }

    SendInput("{Escape}")
    Sleep(300)

    SendInput("{" _v01113498.keyConsole "}")
    Sleep(800)

    SendInput("^a")
    Sleep(100)
    SendInput("connect " _v01113498.ip ":" _v01113498.port)
    Sleep(200)
    SendInput("{Enter}")
    Sleep(500)

    SendInput("{" _v01113498.keyConsole "}")

    _vfc38dc65++
    _f38f8fd9f()
    _f69818158(_fe358efa4("msg_reconnect", _v82d9fbbb "/" _vc1caac16, _v01113498.ip, _v01113498.port))

    SetTimer(_f25b2059a, -_vbde49810)
}

_f25b2059a() {
    global _vc754a9e9, _v82d9fbbb, _vc1caac16, _v6d964f3e
    if _vc754a9e9 || !_v6d964f3e
        return
    if (_v82d9fbbb < _vc1caac16)
        _f87acf9ad()
}

_f69818158(msg) {
    timestamp := FormatTime(, "HH:mm:ss")
    line := "[" timestamp "] " msg "`r`n"
    if IsSet(_vb900e671) && IsObject(_vb900e671)
        try _vb900e671.Value := line . _vb900e671.Value
}

_f12fc42dd(*) {
    global _v01113498
    if _v6d964f3e
        _f614e02ed()
    _fb68f745c()
    _v01113498 := {
        ip: "185.1.2.3", port: "28015",
        jumpInterval: 55, checkInterval: 10,
        keyEnable: "F9", keyDisable: "F10",
        keyJump: "Space", keyConsole: "F1",
        keyToggleGui: "F8",
        reconnect: true, activeOnly: true, randomize: false,
        autoStop: true, autoMini: false, favorites: []
    }
    _v91fe58d7.Destroy()
    _f5d13ad36()
    _f9401ac2c()
    _f69818158(_fe358efa4("msg_reset"))
}

_f61a1a829() {
    if !WinExist("ahk_exe RustClient.exe") {
        _f69818158(_fe358efa4("msg_rust_closed"))
        _f614e02ed()
    }
}

_f402eb6d4() {
    global _v01113498, _v33621e0b
    addr := _v183c14e3.Value ":" _v99ebc9e2.Value

    for fav in _v01113498.favorites {
        if (fav = addr)
            return
    }
    _v01113498.favorites.Push(addr)
    _fa64085f8()
    _f69818158(_fe358efa4("msg_fav_added"))
}

_ff671642a() {
    global _v01113498, _v33621e0b
    if (_v01113498.favorites.Length = 0)
        return
    idx := _v33621e0b.Value
    if (idx < 1 || idx > _v01113498.favorites.Length)
        return
    _v01113498.favorites.RemoveAt(idx)
    _fa64085f8()
    _f69818158(_fe358efa4("msg_fav_removed"))
}

_fa64085f8() {
    global _v01113498, _v33621e0b
    favList := []
    for fav in _v01113498.favorites
        favList.Push(fav)
    if (favList.Length = 0)
        favList.Push(_fe358efa4("fav_empty"))
    _v33621e0b.Delete()
    _v33621e0b.Add(favList)
    _v33621e0b.Choose(1)
}

_fc5b941cb(ctrl, *) {
    global _v01113498
    if (_v01113498.favorites.Length = 0)
        return
    idx := ctrl.Value

    if (idx < 1 || idx > _v01113498.favorites.Length)
        return
    addr := _v01113498.favorites[idx]
    if !InStr(addr, ":")
        return
    parts := StrSplit(addr, ":")
    if (parts.Length >= 2) {
        _v183c14e3.Value := parts[1]
        _v99ebc9e2.Value := parts[2]
    }
}

global _vbf8ef957 := ""
global _vd8216243 := ""
global _vbc66c657 := ""
global _v8b8da0d9 := ""
global _vae970ccb := 0

_fd0d11710() {
    global _v5453c6b4
    if (_v5453c6b4 != "") {
        _f609bf9b7()
        return
    }
    _f39f37009()
}

_f39f37009() {
    global _v5453c6b4, _vbf8ef957, _vd8216243, _vbc66c657, _v8b8da0d9, _vae970ccb
    global _v1a70102d, _vc9913b4a, _v79a12290, _v64ed489e, _v2e2f2f38, _v8d8e5026, _vdece737e, _v2d1c65e5, _vfcdac137
    global _v6d964f3e, _v2ce5463b, _vfc38dc65, _ve8f55cfc

    if (_v5453c6b4 != "")
        return

    W := 220
    _v5453c6b4 := Gui("+AlwaysOnTop -Caption +ToolWindow +Border", "MiniAFK")
    _v5453c6b4.BackColor := _vc9913b4a
    _v5453c6b4.MarginX := 0
    _v5453c6b4.MarginY := 0

    y := 0

    titleBg := _v5453c6b4.Add("Text", "x0 y0 w" W " h26 Background" _v1a70102d)
    _v5453c6b4.SetFont("s8 w700 c" _vdece737e, "Bahnschrift")
    _v5453c6b4.Add("Text", "x10 y6 w140 BackgroundTrans", Chr(0x25C6) " ANTI-AFK")
    _v5453c6b4.SetFont("s9 w400 c" _v2e2f2f38, "Bahnschrift")
    btnClose := _v5453c6b4.Add("Text", "x" (W-26) " y5 w18 h18 BackgroundTrans Center", Chr(0x2715))
    btnClose.OnEvent("Click", (*) => _f609bf9b7())
    titleBg.OnEvent("Click", (*) => PostMessage(0xA1, 2, 0, , "ahk_id " _v5453c6b4.Hwnd))
    y := 26

    _v5453c6b4.Add("Text", "x0 y" y " w" W " h1 Background" _v79a12290)
    y += 1

    statusClr := _v6d964f3e ? _v2d1c65e5 : _vfcdac137
    _v5453c6b4.SetFont("s10 w700 c" statusClr, "Bahnschrift")
    _vbf8ef957 := _v5453c6b4.Add("Text", "x10 y" (y+8) " w14 BackgroundTrans", Chr(0x25CF))
    _vd8216243 := _v5453c6b4.Add("Text", "x26 y" (y+7) " w" (W-36) " BackgroundTrans", _v6d964f3e ? _fe358efa4("active") : _fe358efa4("stopped"))
    y += 32

    _v5453c6b4.Add("Text", "x10 y" y " w" (W-20) " h1 Background" _v79a12290)
    y += 1

    _v5453c6b4.SetFont("s18 w700 c" _v64ed489e, "Consolas")
    sessionStr := "00:00:00"
    if _v6d964f3e && (_ve8f55cfc > 0) {
        elapsed := (A_TickCount - _ve8f55cfc) // 1000
        h := elapsed // 3600
        m := Mod(elapsed // 60, 60)
        s := Mod(elapsed, 60)
        sessionStr := Format("{:02d}:{:02d}:{:02d}", h, m, s)
    }
    _vbc66c657 := _v5453c6b4.Add("Text", "x8 y" (y+6) " w" (W-16) " Center BackgroundTrans", sessionStr)
    y += 40

    _v5453c6b4.SetFont("s7 w400 c" _v8d8e5026, "Bahnschrift")
    _v5453c6b4.Add("Text", "x8 y" y " w" (W-16) " Center BackgroundTrans", "S E S S I O N   T I M E")
    y += 18

    _v5453c6b4.Add("Text", "x10 y" y " w" (W-20) " h1 Background" _v79a12290)
    y += 1

    _v5453c6b4.SetFont("s8 w400 c" _v2e2f2f38, "Bahnschrift")
    _v8b8da0d9 := _v5453c6b4.Add("Text", "x8 y" (y+5) " w" (W-16) " Center BackgroundTrans",
        _v6d964f3e ? "J: " _v2ce5463b "     R: " _vfc38dc65 : "J: —     R: —")
    y += 26

    px := A_ScreenWidth - W - 10
    py := 10
    _v5453c6b4.Show("x" px " y" py " w" W " h" y " NoActivate")

    _vae970ccb := _f7c471130
    SetTimer(_vae970ccb, 1000)
}

_f7c471130() {
    global _v5453c6b4, _vbf8ef957, _vd8216243, _vbc66c657, _v8b8da0d9
    global _v6d964f3e, _v2ce5463b, _vfc38dc65, _ve8f55cfc, _v2d1c65e5, _vfcdac137
    if (_v5453c6b4 = "")
        return

    try {
        statusClr := _v6d964f3e ? _v2d1c65e5 : _vfcdac137
        _vbf8ef957.SetFont("c" statusClr)
        _vd8216243.SetFont("c" statusClr)
        _vd8216243.Value := _v6d964f3e ? _fe358efa4("active") : _fe358efa4("stopped")
        _v8b8da0d9.Value := _v6d964f3e ? "J: " _v2ce5463b "     R: " _vfc38dc65 : "J: —     R: —"

        if _v6d964f3e && (_ve8f55cfc > 0) {
            elapsed := (A_TickCount - _ve8f55cfc) // 1000
            h := elapsed // 3600
            m := Mod(elapsed // 60, 60)
            s := Mod(elapsed, 60)
            _vbc66c657.Value := Format("{:02d}:{:02d}:{:02d}", h, m, s)
        } else {
            _vbc66c657.Value := "00:00:00"
        }
    }
}

_f609bf9b7() {
    global _v5453c6b4, _vae970ccb
    if (_vae970ccb != 0) {
        SetTimer(_vae970ccb, 0)
        _vae970ccb := 0
    }
    if (_v5453c6b4 != "") {
        try _v5453c6b4.Destroy()
        _v5453c6b4 := ""
    }
}

_fe4580bac(raw) {
    bs := Chr(92)
    s  := StrReplace(raw,  bs bs,       Chr(1))
    s  := StrReplace(s,    bs "n",      "`n")
    s  := StrReplace(s,    bs "r",      "")
    s  := StrReplace(s,    bs Chr(34),  Chr(34))
    s  := StrReplace(s,    bs "t",      "`t")
    s  := StrReplace(s,    Chr(1),      bs)
    return s
}

_ff5a3f03a() {
    global _vf0631eac, _v94651a2f
    global _v1a70102d, _vc9913b4a, _vc95c8aa5, _v79a12290, _v64ed489e, _v2e2f2f38, _v8d8e5026, _v2d1c65e5

    W    := 400
    hdrH := 46
    btnH := 44

    cw := Gui("-Caption +AlwaysOnTop +ToolWindow", "")
    cw.BackColor := _v1a70102d
    cw.MarginX   := 0
    cw.MarginY   := 0

    cw.Add("Text", "x0 y0 w" W " h" hdrH " Background" _vc9913b4a)
    cw.SetFont("s10 w700 c" _v2d1c65e5)
    cw.Add("Text", "x14 y" ((hdrH-18)//2) " w" (W-52) " BackgroundTrans",
        Chr(0x2B06) "  " _fe358efa4("changelog_title", _vf0631eac))
    cw.SetFont("s10 w400 c" _v2e2f2f38)
    clsBtn := cw.Add("Text", "x" (W-34) " y" ((hdrH-18)//2) " w20 h20 BackgroundTrans Center 0x200", Chr(0x2715))
    clsBtn.OnEvent("Click", (*) => cw.Destroy())

    dragZone := cw.Add("Text", "x0 y0 w" (W-38) " h" hdrH " BackgroundTrans 0x200")
    dragZone.OnEvent("Click", (*) => PostMessage(0xA1, 2, 0, , "ahk_id " cw.Hwnd))
    y := hdrH

    cw.Add("Text", "x0 y" y " w" W " h1 Background" _v79a12290)
    y += 1

    cw.SetFont("s7 w700 c" _v8d8e5026)
    cw.Add("Text", "x14 y" (y+7) " BackgroundTrans", "CHANGELOG")
    y += 24

    text := (_v94651a2f != "") ? _v94651a2f : _fe358efa4("msg_no_changelog")
    cw.SetFont("s9 c" _v64ed489e, "Segoe UI")
    cw.Add("Edit", "x0 y" y " w" W " h200 Background" _vc95c8aa5 " ReadOnly Multi VScroll -E0x200", text)
    y += 200

    cw.Add("Text", "x0 y" y " w" W " h1 Background" _v79a12290)
    y += 1

    bW := W // 2

    installBg := cw.Add("Text", "x0 y" y " w" bW " h" btnH " Background" _vc9913b4a " 0x200")
    cw.SetFont("s9 w700 c" _v2d1c65e5)
    cw.Add("Text", "x0 y" (y + (btnH-16)//2) " w" bW " Center BackgroundTrans",
        Chr(0x2B07) "  " _fe358efa4("btn_install"))
    installBg.OnEvent("Click", (*) => (cw.Destroy(), _fcc5c89af()))

    cw.Add("Text", "x" bW " y" (y+10) " w1 h" (btnH-20) " Background" _v79a12290)

    skipBg := cw.Add("Text", "x" bW " y" y " w" bW " h" btnH " Background" _vc9913b4a " 0x200")
    cw.SetFont("s9 w400 c" _v2e2f2f38)
    cw.Add("Text", "x" bW " y" (y + (btnH-16)//2) " w" bW " Center BackgroundTrans",
        Chr(0x2715) "  " _fe358efa4("btn_skip"))
    skipBg.OnEvent("Click", (*) => cw.Destroy())
    y += btnH

    cw.Show("w" W " h" y " Center")
}

_f804f91b7(v1, v2) {

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

_f5d08bc02(silent := false) {
    global _v5e603fe8, _v7581a003, _vf0631eac, _vdb551915, _v94651a2f
    _f69818158(_fe358efa4("msg_checking_update"))

    tmpJson := A_Temp . "\antiafk_update.json"

    apiUrl := "https://api.github.com/repos/" _v7581a003 "/releases/latest"
    try {
        Download(apiUrl, tmpJson)
    } catch as err {
        if !silent
            _f69818158(_fe358efa4("msg_update_fail", "No releases found"))
        return false
    }

    try {
        json := FileRead(tmpJson, "UTF-8")
        FileDelete(tmpJson)
    } catch {
        if !silent
            _f69818158(_fe358efa4("msg_update_fail", "Cannot read API response"))
        return false
    }

    remoteVersion := ""
    if RegExMatch(json, '"tag_name"\s*:\s*"([^"]+)"', &m)
        remoteVersion := m[1]

    if (remoteVersion = "") {
        if !silent
            _f69818158(_fe358efa4("msg_update_fail", "No release tag found"))
        return false
    }

    if (_f804f91b7(remoteVersion, _v5e603fe8) <= 0) {
        _f69818158(_fe358efa4("msg_no_update", _v5e603fe8))
        return false
    }

    _vf0631eac := remoteVersion
    _vdb551915 := "https://github.com/" _v7581a003 "/releases/download/" remoteVersion "/" _vb1bc9150
    _v94651a2f := ""
    if RegExMatch(json, '"body"\s*:\s*"((?:[^"\\]|\\.)*)"', &bm)
        _v94651a2f := _fe4580bac(bm[1])
    _f69818158(_fe358efa4("msg_update_found", remoteVersion))
    _fc77b5114()
    return true
}

_fc77b5114() {
    global _vf0631eac

    _f4cabc19c()
    _v91fe58d7.Destroy()
    _f5d13ad36()
}

_f39015080() {
    global _vf0631eac, _v94651a2f
    _vf0631eac := ""
    _v94651a2f := ""
    _f4cabc19c()
    _v91fe58d7.Destroy()
    _f5d13ad36()
}

_fe93ee81b() {
    global _v5e603fe8, _v7581a003, _vf0631eac, _vdb551915, _v94651a2f, _vb1bc9150

    _f69818158(_fe358efa4("msg_checking_update"))

    tmpJson := A_Temp . "\antiafk_update.json"
    try FileDelete(tmpJson)

    apiUrl := "https://api.github.com/repos/" _v7581a003 "/releases/latest"
    try {
        Download(apiUrl, tmpJson)
    } catch as err {
        _f69818158(_fe358efa4("msg_update_fail", err.Message))
        return
    }

    json := ""
    try {
        json := FileRead(tmpJson, "UTF-8")
        FileDelete(tmpJson)
    } catch as err {
        _f69818158(_fe358efa4("msg_update_fail", err.Message))
        return
    }

    if (json = "") {
        _f69818158(_fe358efa4("msg_update_fail", "Empty response"))
        return
    }

    remoteVersion := ""
    if RegExMatch(json, '"tag_name"\s*:\s*"([^"]+)"', &m)
        remoteVersion := m[1]

    if (remoteVersion = "") {
        _f69818158(_fe358efa4("msg_update_fail", "No release tag found"))
        return
    }

    if (_f804f91b7(remoteVersion, _v5e603fe8) <= 0) {
        _f69818158(_fe358efa4("msg_no_update", _v5e603fe8))
        return
    }

    _vf0631eac := remoteVersion
    _vdb551915 := "https://github.com/" _v7581a003 "/releases/download/" remoteVersion "/" _vb1bc9150
    _v94651a2f := ""
    if RegExMatch(json, '"body"\s*:\s*"((?:[^"\\]|\\.)*)"', &bm)
        _v94651a2f := _fe4580bac(bm[1])

    _f69818158(_fe358efa4("msg_update_found", remoteVersion))
    _fc77b5114()
}

_fcc5c89af() {
    global _vdb551915, _vf0631eac, _vb1bc9150

    tmpScript := A_Temp . "\antiafk_new.ahk"

    try {
        Download(_vdb551915, tmpScript)
    } catch as err {
        _f69818158(_fe358efa4("msg_update_fail", err.Message))
        return
    }

    try {
        newContent := FileRead(tmpScript, "UTF-8")
    } catch {
        _f69818158(_fe358efa4("msg_update_fail", "Download corrupted"))
        return
    }

    if !InStr(newContent, "#Requires AutoHotkey") {
        _f69818158(_fe358efa4("msg_update_fail", "Invalid file content"))
        try FileDelete(tmpScript)
        return
    }

    try {
        FileCopy(tmpScript, A_ScriptFullPath, true)
        FileDelete(tmpScript)
    } catch as err {
        _f69818158(_fe358efa4("msg_update_fail", err.Message))
        return
    }

    _f69818158(_fe358efa4("msg_update_ok", _vf0631eac))
    Sleep(1000)
    Reload()
}

_f32a7be19() {
    global _v938a2d53
    if (!_v938a2d53)
        _f7f574bcb()
}

_f7f574bcb() {
    global _v0c2927d8, _v0752e981, _v4d5b6af4
    global _v73339dcb, _v2d67864c, _v938a2d53, _v74e63086
    global _v1a70102d, _vc9913b4a, _vc95c8aa5, _v79a12290, _v64ed489e, _v2e2f2f38, _v8d8e5026, _vdece737e, _v2d1c65e5, _vfcdac137

    CLR_DISCORD := "5865F2"
    CLR_DISCORD_DARK := "4752C4"

    W  := 460
    PAD := 28
    INNER := W - PAD * 2

    aG := Gui("-Caption +AlwaysOnTop +Border", "Discord Auth")
    aG.BackColor := _v1a70102d
    aG.SetFont("s10 c" _v64ed489e, "Segoe UI")
    aG.OnEvent("Close", (*) => ExitApp())

    aG.Add("Text", "x0 y0 w" W " h60 Background" CLR_DISCORD)
    aG.SetFont("s15 w700 cFFFFFF")
    aG.Add("Text", "x" PAD " y12 w300 BackgroundTrans", Chr(0x25C9) "  Discord Authorization")
    aG.SetFont("s8 w400 cC8CDF2")
    aG.Add("Text", "x" PAD " y38 BackgroundTrans", "Rust Anti-AFK  " Chr(0x2022) "  Sign in to continue")
    aG.SetFont("s10 w400 cC8CDF2")
    btnExit := aG.Add("Text", "x" (W-36) " y0 w36 h32 Background" CLR_DISCORD " Center 0x200", Chr(0x2715))
    btnExit.OnEvent("Click", (*) => ExitApp())

    y := 76

    aG.SetFont("s9 w400 c" _v2e2f2f38)
    aG.Add("Text", "x" PAD " y" y " w" INNER " Center BackgroundTrans",
        "To use this app you need to verify your Discord account.")
    y += 32

    cardH1 := 100
    aG.Add("Text", "x" PAD " y" y " w" INNER " h" cardH1 " Background" _vc9913b4a)
    aG.Add("Text", "x" PAD " y" y " w" INNER " h1 Background" CLR_DISCORD)

    stepY := y + 14
    aG.SetFont("s18 w700 c" CLR_DISCORD)
    aG.Add("Text", "x" (PAD+16) " y" stepY " BackgroundTrans", "1")
    aG.SetFont("s10 w600 c" _v64ed489e)
    aG.Add("Text", "x" (PAD+44) " y" (stepY+2) " BackgroundTrans", "Open Discord")
    aG.SetFont("s8 w400 c" _v2e2f2f38)
    aG.Add("Text", "x" (PAD+44) " y" (stepY+22) " w" (INNER-76) " BackgroundTrans",
        "Click below to open the authorization page in your browser.")

    btnY := stepY + 50
    aG.SetFont("s10 w700 cFFFFFF")
    btnAuth := aG.Add("Text",
        "x" (PAD+16) " y" btnY " w" (INNER-32) " h36 Background" CLR_DISCORD " Center 0x200",
        Chr(0x2192) "   Authorize via Discord")
    y += cardH1 + 12

    cardH2 := 102
    aG.Add("Text", "x" PAD " y" y " w" INNER " h" cardH2 " Background" _vc9913b4a)
    aG.Add("Text", "x" PAD " y" y " w" INNER " h1 Background" _v79a12290)

    stepY := y + 14
    aG.SetFont("s18 w700 c" _v2e2f2f38)
    aG.Add("Text", "x" (PAD+16) " y" stepY " BackgroundTrans", "2")
    aG.SetFont("s10 w600 c" _v64ed489e)
    aG.Add("Text", "x" (PAD+44) " y" (stepY+2) " BackgroundTrans", "Paste the code")
    aG.SetFont("s8 w400 c" _v2e2f2f38)
    aG.Add("Text", "x" (PAD+44) " y" (stepY+22) " w" (INNER-76) " BackgroundTrans",
        "Usually this happens automatically. If not — paste the code or URL below.")

    inputY := stepY + 50
    inputW := INNER - 32 - 60
    aG.SetFont("s10 w400 c" _v64ed489e)
    editCode := aG.Add("Edit",
        "x" (PAD+16) " y" inputY " w" inputW " h32 Background" _vc95c8aa5 " c" _v64ed489e " +0x200",
        "")
    aG.SetFont("s9 w700 cFFFFFF")
    btnOK := aG.Add("Text",
        "x" (PAD+16+inputW+8) " y" inputY " w52 h32 Background" _v2d1c65e5 " Center 0x200", Chr(0x2713) " OK")
    y += cardH2 + 16

    aG.SetFont("s9 w600 c" _v2e2f2f38)
    _va505e1a3 := aG.Add("Text", "x" PAD " y" y " w" INNER " h20 Center BackgroundTrans",
        Chr(0x25CB) "  Waiting for authorization...")
    y += 28

    aG.SetFont("s7 w400 c444444")
    aG.Add("Text", "x" PAD " y" y " w" INNER " Center BackgroundTrans",
        "The redirect page may show an error — that's normal. Just copy the URL.")
    y += 24

    aG.Show("w" W " h" y " Center")

    redirectUri := "http://localhost:" _v4d5b6af4 "/callback"
    oauthUrl    := "https://discord.com/oauth2/authorize"
                 . "?client_id="    _v0c2927d8
                 . "&redirect_uri=" _faa2c7032(redirectUri)
                 . "&response_type=code"
                 . "&scope=identify"

    callbackFile := A_Temp . "\discord_auth_code.txt"
    try FileDelete(callbackFile)
    serverPid := 0

    btnAuth.OnEvent("Click", DoOpenAuth)
    btnOK.OnEvent("Click",   DoVerifyCode)
    editCode.OnEvent("Change", (*) => "")

    DoOpenAuth(*) {

        psFile := A_Temp . "\discord_listener.ps1"

        psContent := "
(
try {
    $l = [System.Net.HttpListener]::new()
    $l.Prefixes.Add('http://localhost:__PORT__/')
    $l.Start()
    $ctx = $l.GetContext()
    $q   = $ctx.Request.Url.Query
    $html = '<html><body style=''color:#E8E8E8;background:#151515;font-family:Segoe UI;text-align:center;padding:60px''><h2 style=''color:#5865F2''>Authorization successful</h2><p>You can close this tab and return to Rust Anti-AFK.</p></body></html>'
    $b   = [System.Text.Encoding]::UTF8.GetBytes($html)
    $ctx.Response.ContentType = 'text/html; charset=utf-8'
    $ctx.Response.OutputStream.Write($b, 0, $b.Length)
    $ctx.Response.OutputStream.Close()
    $l.Stop()
    [System.IO.File]::WriteAllText('__CBFILE__', $q, [System.Text.Encoding]::UTF8)
} catch {}
)"
        psContent := StrReplace(psContent, "__PORT__",   _v4d5b6af4)
        psContent := StrReplace(psContent, "__CBFILE__", StrReplace(callbackFile, "\", "\\"))

        try FileDelete(psFile)
        FileAppend(psContent, psFile, "UTF-8")

        Run("powershell.exe -WindowStyle Hidden -ExecutionPolicy Bypass -File `"" psFile "`"",, "Hide", &serverPid)
        Sleep(600)

        Run(oauthUrl)

        _va505e1a3.Value := Chr(0x21BB) "  Browser opened. Waiting for callback..."
        _va505e1a3.SetFont("c" CLR_DISCORD)

        SetTimer(PollCallback, 500)
    }

    DoVerifyCode(*) {
        raw := Trim(editCode.Value)
        if (raw = "") {
            SetStatus(Chr(0x2717) "  Please paste the code or redirect URL.", _vfcdac137)
            return
        }

        code := raw
        if InStr(raw, "code=") && RegExMatch(raw, "[?&]code=([^&#\s]+)", &m)
            code := m[1]
        ProcessDiscordCode(code)
    }

    PollCallback() {
        if !FileExist(callbackFile)
            return
        try {
            query := FileRead(callbackFile, "UTF-8")
            FileDelete(callbackFile)
        } catch {
            return
        }
        SetTimer(PollCallback, 0)
        code := ""
        if RegExMatch(query, "[?&]code=([^&#\s]+)", &m)
            code := m[1]
        if (code = "") {
            SetStatus(Chr(0x2717) "  No code in callback URL. Try manual paste.", _vfcdac137)
            return
        }
        editCode.Value := code
        ProcessDiscordCode(code)
    }

    ProcessDiscordCode(code) {
        SetStatus(Chr(0x21BB) "  Exchanging code for token...", _v2e2f2f38)
        token := _fc7d1c405(code, redirectUri)
        if (!token) {
            SetStatus(Chr(0x2717) "  Token exchange failed. Check Client ID / Secret.", _vfcdac137)
            return
        }
        SetStatus(Chr(0x21BB) "  Getting user info...", _v2e2f2f38)
        user := _f759eec90(token)
        if (!user) {
            SetStatus(Chr(0x2717) "  Failed to get user info.", _vfcdac137)
            return
        }
        _v73339dcb    := user.id
        _v2d67864c  := user.username
        _v938a2d53 := true
        IniWrite("1",             _v74e63086, "Discord", "authorized")
        IniWrite(_v73339dcb,   _v74e63086, "Discord", "userId")
        IniWrite(_v2d67864c, _v74e63086, "Discord", "username")

        _fca8541d6(user.id, user.username)

        SetStatus(Chr(0x2714) "  Welcome, " user.username "!", _v2d1c65e5)
        Sleep(1200)
        aG.Destroy()
    }

    SetStatus(msg, clr) {
        _va505e1a3.Value := msg
        _va505e1a3.SetFont("c" clr)
    }

    WinWaitClose("ahk_id " aG.Hwnd)

    if (!_v938a2d53)
        ExitApp()
}

_fc7d1c405(code, redirectUri) {
    global _v0c2927d8, _v0752e981
    try {
        http := ComObject("WinHttp.WinHttpRequest.5.1")
        http.Open("POST", "https://discord.com/api/oauth2/token", false)
        http.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")
        body := "client_id="     _v0c2927d8
              . "&client_secret=" _v0752e981
              . "&grant_type=authorization_code"
              . "&code="          code
              . "&redirect_uri="  _faa2c7032(redirectUri)
        http.Send(body)
        if (http.Status != 200)
            return false
        json := http.ResponseText
        if !RegExMatch(json, '"access_token"\s*:\s*"([^"]+)"', &m)
            return false
        return m[1]
    } catch {
        return false
    }
}

_f759eec90(accessToken) {
    try {
        http := ComObject("WinHttp.WinHttpRequest.5.1")
        http.Open("GET", "https://discord.com/api/users/@me", false)
        http.SetRequestHeader("Authorization", "Bearer " accessToken)
        http.Send()
        if (http.Status != 200)
            return false
        json := http.ResponseText
        if !RegExMatch(json, '"id"\s*:\s*"([^"]+)"', &mid)
            return false
        if !RegExMatch(json, '"username"\s*:\s*"([^"]+)"', &mname)
            return false
        return {id: mid[1], username: mname[1]}
    } catch {
        return false
    }
}

_f0fb001d7(userId, username) {
    global _v5e603fe8
    _fc7666a05(userId, username, _v5e603fe8)
}

_f6b5b9564() {
    global _v938a2d53, _v73339dcb, _v2d67864c, _ve49e135e, _v5e603fe8
    if (_ve49e135e = "")
        return
    if (!_v938a2d53 || _v73339dcb = "") {
        ExitApp()
    }
    _fc7666a05(_v73339dcb, _v2d67864c, _v5e603fe8)
}

_fca8541d6(userId, username) {
    global _ve49e135e, _v5e603fe8
    if (_ve49e135e = "")
        return
    _fc7666a05(userId, username, _v5e603fe8)
}

_fc7666a05(userId, username, version) {
    global _ve49e135e, _va457b7d1
    logFile := A_ScriptDir . "\antiafk_api.log"

    _L(msg) {
        try FileAppend(FormatTime(, "dd.MM.yyyy HH:mm:ss") " | " msg "`n", logFile, "UTF-8")
    }

    hwid        := _f9d1dc953()
    scriptHash  := _f95cec1aa()
    safeUser    := StrReplace(StrReplace(username, "\", "\\"), '"', '\"')
    body        := '{"discord_id":"' userId '","username":"' safeUser '","version":"' version '","hwid":"' hwid '","script_hash":"' scriptHash '"}'

    _L("Sending to: " _ve49e135e)
    _L("Body: discord_id=" userId " username=" username " hwid=" hwid)

    try {
        http := ComObject("WinHttp.WinHttpRequest.5.1")
        http.Open("POST", _ve49e135e, false)
        http.SetRequestHeader("Content-Type", "application/json")
        if (_va457b7d1 != "")
            http.SetRequestHeader("X-Token", _va457b7d1)
        http.Send(body)
        _L("HTTP " http.Status " | Response: " http.ResponseText)

        if (http.Status = 200) {
            resp := http.ResponseText
            if RegExMatch(resp, '"status"\s*:\s*"banned"') {
                reason := "You have been banned."
                if RegExMatch(resp, '"reason"\s*:\s*"([^"]+)"', &m)
                    reason := m[1]

                reason := StrReplace(StrReplace(reason, "\r\n", "`n"), "\n", "`n")
                reason := Trim(reason)
                MsgBox(reason, "Rust Anti-AFK — Banned", 0x10)
                ExitApp()
            }
        }
    } catch as e {
        _L("ERROR: " e.Message)
    }
}

_f95cec1aa() {
    try {
        raw := FileRead(A_ScriptFullPath, "RAW")
        return _f7da9ebd1(raw)
    }
    return ""
}

_f1bc29b36(str) {
    CALG_MD5 := 0x8003, PROV_RSA_FULL := 1, HP_HASHVAL := 2
    hProv := 0, hHash := 0
    DllCall("Advapi32\CryptAcquireContext",  "Ptr*", &hProv, "Ptr", 0, "Ptr", 0, "UInt", PROV_RSA_FULL, "UInt", 0xF0000000)
    DllCall("Advapi32\CryptCreateHash",     "Ptr", hProv, "UInt", CALG_MD5, "Ptr", 0, "UInt", 0, "Ptr*", &hHash)
    buf := Buffer(StrPut(str, "UTF-8") - 1)
    StrPut(str, buf, "UTF-8")
    DllCall("Advapi32\CryptHashData",       "Ptr", hHash, "Ptr", buf, "UInt", buf.Size, "UInt", 0)
    sz := 16
    hBuf := Buffer(sz)
    DllCall("Advapi32\CryptGetHashParam",   "Ptr", hHash, "UInt", HP_HASHVAL, "Ptr", hBuf, "UInt*", &sz, "UInt", 0)
    DllCall("Advapi32\CryptDestroyHash",    "Ptr", hHash)
    DllCall("Advapi32\CryptReleaseContext", "Ptr", hProv, "UInt", 0)
    result := ""
    Loop sz
        result .= Format("{:02x}", NumGet(hBuf, A_Index - 1, "UChar"))
    return result
}

_f7da9ebd1(buf) {
    CALG_MD5 := 0x8003, PROV_RSA_FULL := 1, HP_HASHVAL := 2
    hProv := 0, hHash := 0
    DllCall("Advapi32\CryptAcquireContext",  "Ptr*", &hProv, "Ptr", 0, "Ptr", 0, "UInt", PROV_RSA_FULL, "UInt", 0xF0000000)
    DllCall("Advapi32\CryptCreateHash",     "Ptr", hProv, "UInt", CALG_MD5, "Ptr", 0, "UInt", 0, "Ptr*", &hHash)
    DllCall("Advapi32\CryptHashData",       "Ptr", hHash, "Ptr", buf, "UInt", buf.Size, "UInt", 0)
    sz := 16
    hBuf := Buffer(sz)
    DllCall("Advapi32\CryptGetHashParam",   "Ptr", hHash, "UInt", HP_HASHVAL, "Ptr", hBuf, "UInt*", &sz, "UInt", 0)
    DllCall("Advapi32\CryptDestroyHash",    "Ptr", hHash)
    DllCall("Advapi32\CryptReleaseContext", "Ptr", hProv, "UInt", 0)
    result := ""
    Loop sz
        result .= Format("{:02x}", NumGet(hBuf, A_Index - 1, "UChar"))
    return result
}

_f9d1dc953() {
    raw := ""

    try raw .= RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Cryptography", "MachineGuid")

    try {
        wmi := ComObject("WbemScripting.SWbemLocator").ConnectServer()
        for cpu in wmi.ExecQuery("SELECT ProcessorId FROM Win32_Processor")
            raw .= cpu.ProcessorId
    }
    return (raw != "") ? _f1bc29b36(raw) : ""
}

_faa2c7032(str) {
    result := ""
    Loop Parse, str {
        c := A_LoopField
        if RegExMatch(c, "[A-Za-z0-9\-_.~]")
            result .= c
        else
            result .= Format("%{:02X}", Ord(c))
    }
    return result
}
