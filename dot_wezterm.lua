-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Solarized Dark Higher Contrast'
config.leader = { key = "b", mods = "CTRL" }
config.window_background_opacity = 0.93
require("wez-tmux.plugin").apply_to_config(config, {})
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
tabline.setup()
tabline.apply_to_config(config)
config.window_padding = {
  left = 3,
  right = 3,
  top = 3,
  bottom = 3,
}
config.window_decorations = "TITLE | RESIZE"

-- and finally, return the configuration to wezterm
return config

