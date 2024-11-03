-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux
local projects = require 'projects'

-- This will hold the configuration.
local config = wezterm.config_builder()


local function move_pane(key, direction)
  return {
    key = key,
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection(direction),
  }
end

-- This is where you actually apply your config choices
config.set_environment_variables = {
  PATH = '/opt/homebrew/bin:' .. os.getenv('PATH')
}
config.color_scheme = 'Solarized Dark Higher Contrast'
config.leader = { key = "b", mods = "CTRL" }
config.window_background_opacity = 0.85
config.macos_window_background_blur = 30


-- require("wez-tmux.plugin").apply_to_config(config, {})

config.keys = {
  -- ... add these new entries to your config.keys table
  {
    key = ',',
    mods = 'SUPER',
    action = wezterm.action.SpawnCommandInNewTab {
      cwd = wezterm.home_dir,
      args = { 'vim', wezterm.config_file },
    },
  },
  {
    key = 'b',
    mods = 'LEADER|CTRL',
    action = wezterm.action.SendKey { key = 'b', mods = 'CTRL' },
  },
  {
    key = 'p',
    mods = 'LEADER',
    action = projects.choose_project(), 
  },
  {
    key = 'f',
    mods = 'LEADER',
    action = wezterm.action.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES' },
  },
  {
    key = '"',
    mods = 'LEADER',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '%',
    mods = 'LEADER',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  move_pane('DownArrow', 'Down'),
  move_pane('UpArrow', 'Up'),
  move_pane('LeftArrow', 'Left'),
  move_pane('RightArrow', 'Right'),
}

local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
tabline.setup()
tabline.apply_to_config(config)
config.window_decorations = "RESIZE | INTEGRATED_BUTTONS"

-- and finally, return the configuration to wezterm
return config

