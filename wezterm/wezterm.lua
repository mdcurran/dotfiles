local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.automatically_reload_config = true

config.color_scheme = "Dracula (Official)"
-- These settings give a more "native" macOS feel to wezterm.
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE"
config.native_macos_fullscreen_mode = true
-- By default, Wezterm does not support Left-Option being used for composition
-- effects (i.e. OPT+3 = "#"). This is bound to Right-Option. Swap the
-- behaviour for both modifiers around.
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = false

config.colors = {
    selection_fg = "black",
    selection_bg = "#FFFACD",
}

config.font = wezterm.font("JetBrains Mono")
config.font_size = 13

config.keys = {
    {
        key = "[",
        mods = "CMD",
        action = wezterm.action.ActivatePaneDirection "Prev",
    },
    {
        key = "]",
        mods = "CMD",
        action = wezterm.action.ActivatePaneDirection "Next",
    },
    -- Cascading tab closures. If 2+ tabs are open, close the current tab. If
    -- there is only 1 tab then close the entire window.
    {
        key = "w",
        mods = "CMD",
        action = wezterm.action.CloseCurrentPane { confirm = false },
    },
    -- Clears scrollback and leaves a prompt line as the top, first line in a
    -- pane.
    {
        key = "k",
        mods = "CMD",
        action = wezterm.action.ClearScrollback "ScrollbackAndViewport",
    },
}

-- Adds a battery indicator and clock to bottom-right status bar.
wezterm.on("update-right-status", function(window, _)
    local date = wezterm.strftime "%a %b %-d %H:%M "

    local bat = ""
    for _, b in ipairs(wezterm.battery_info()) do
        bat = "🔋" .. string.format("%.0f%%", b.state_of_charge * 100)
    end

    window:set_right_status(wezterm.format {
        { Text = bat .. "   " .. date },
    })
end)

return config
