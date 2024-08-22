local wezterm = require("wezterm")
local config = {}

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 14

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.color_scheme = "mountnugget"

return config
