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
config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 2000 }
config.window_background_opacity = 0.85
config.macos_window_background_blur = 30

-- require("wez-tmux.plugin").apply_to_config(config, {})
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

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
    mods = 'CTRL',
    action = wezterm.action_callback(function (win, pane) tabline.refresh(win, pane) end)
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
  {
    key = 't',
    mods = 'LEADER',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  },
  move_pane('DownArrow', 'Down'),
  move_pane('UpArrow', 'Up'),
  move_pane('LeftArrow', 'Left'),
  move_pane('RightArrow', 'Right'),
}

local function showLeader (window)
  local leader = '    '
  if window:leader_is_active() then
    leader = ' 🚀 '
  end
  return leader
end

tabline.setup({
  sections = {
    tabline_a = { showLeader }, 
    tabline_b = { 'mode' },
    tabline_c = { 'workspace' },
    tabline_d = { ' ' },
  },
  options = {
    color_overrides = {
      copy_mode = {
        a =  {
            bg =  "#313244",
            fg =  "#f9e2af",
        },
        b =  {
            bg =  "#f9e2af",
            fg =  "#181825",
        },
        c =  {
            bg =  "#313244",
            fg =  "#f9e2af",
        },
        d =  {
            bg =  "#181825",
            fg =  "#cdd6f4",
        },
    },
    normal_mode =  {
        a =  {
            bg =  "#313244",
            fg =  "#89b4fa",
        },
        b =  {
            bg =  "#89b4fa",
            fg =  "#181825",
        },
        c =  {
            bg =  "#313244",
            fg =  "#89b4fa",
        },
        d =  {
            bg =  "#181825",
            fg =  "#cdd6f4",
        },
    },
    }
  }
})
tabline.apply_to_config(config)
config.window_decorations = "RESIZE | INTEGRATED_BUTTONS"
config.visual_bell = {
  fade_in_function = 'EaseIn',
  fade_in_duration_ms = 75,
  fade_out_function = 'EaseOut',
  fade_out_duration_ms = 75,
}
config.colors = {
  visual_bell = '#301010',
}
config.audible_bell = 'Disabled'

-- and finally, return the configuration to wezterm
return config

