local wezterm = require("wezterm")
local launch = require("config.launch")
local key_bindings = require("config.key_bindings")

local config = wezterm.config_builder()

launch.apply(config)
key_bindings.apply(config)

config.color_scheme = "Tokyo Night"
config.enable_tab_bar = true
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = false

return config
