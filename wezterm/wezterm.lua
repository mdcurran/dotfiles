local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "Dracula (Official)"
-- These settings give a more "native" macOS feel to wezterm.
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE"
config.native_macos_fullscreen_mode = true

config.font = wezterm.font("JetBrains Mono")
config.font_size = 13

config.keys = {
	{
		key = "[",
		mods = "CMD",
		action = wezterm.action.ActivatePaneDirection "Left",
	},
	{
		key = "]",
		mods = "CMD",
		action = wezterm.action.ActivatePaneDirection "Right",
	},
}

-- Adds a battery indicator and clock to bottom-right status bar.
wezterm.on("update-right-status", function(window, _)
	local date = wezterm.strftime "%a %b %-d %H:%M "

	local bat = ""
	for _, b in ipairs(wezterm.battery_info()) do
		bat = '🔋' .. string.format("%.0f%%", b.state_of_charge * 100)
	end

	window:set_right_status(wezterm.format {
		{ Text = bat .. "   " .. date },
	})
end)

return config
