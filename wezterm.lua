local wezterm = require("wezterm")
local mux = wezterm.mux

-- session manager config
local session_manager = require("wezterm-session-manager/session-manager")
wezterm.on("save_session", function(window) session_manager.save_state(window) end)
wezterm.on("load_session", function(window) session_manager.load_state(window) end)
wezterm.on("restore_session", function(window) session_manager.restore_state(window) end)

wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window{}
  window:gui_window():maximize()
end)
local config = {
	window_close_confirmation = "NeverPrompt",
	window_background_opacity = 0.1,
	win32_system_backdrop = "Disable",
	hide_tab_bar_if_only_one_tab = true,
	window_decorations = "RESIZE",
	audible_bell = "Disabled",
	-- cursor system
	cursor_blink_ease_in = "Linear",
	cursor_blink_ease_out = "Linear",
	cursor_blink_rate = 300,
	default_cursor_style = "BlinkingBar",
	check_for_updates = true,
	-- theme
	background = {
		{
			source = {
				File = "/home/italo/.config/wezterm/bg-monterey.png",
			},
			hsb = {
				hue = 1.0,
				saturation = 1.02,
				brightness = 0.25,
			},
		},
		{
			source = {
				Color = "#282c35",
			},
			width = "100%",
			height = "100%",
			opacity = 0.55,
		},
	},
	inactive_pane_hsb = {
		hue = 1.0,
		saturation = 1.0,
		brightness = 1.0,
	},
	color_scheme = "Catppuccin Frappe",
	-- this shit is STILL BROKEN pLEAse stop giving me syntax errors i dont KNOW WHAT TO DO
	default_prog = zsh,
  -- font
	-- font = wezterm.font{"JetBrainsMono Nerd Font"},
  
	harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
	font_size = 14,
	launch_menu = {},
	leader = { key = "a", mods = "CTRL" },
	disable_default_key_bindings = false,
	-- keys = {
		-- 	-- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
		-- 	   { key = "a", mods = "LEADER|CTRL",  action=wezterm.action{SendString="\x01"}},
		-- 	   { key = "-", mods = "LEADER",       action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
		-- 	   { key = "\\",mods = "LEADER",       action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
		-- 	   { key = "z", mods = "LEADER",       action="TogglePaneZoomState" },
		-- 	   { key = "c", mods = "LEADER",       action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
		-- 	   { key = "h", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Left"}},
		-- 	   { key = "j", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Down"}},
		-- 	   { key = "k", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Up"}},
		-- 	   { key = "l", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Right"}},
		-- 	   { key = "&", mods = "LEADER|SHIFT", action=wezterm.action{CloseCurrentTab={confirm=true}}},
		-- 	   { key = "x", mods = "LEADER",       action=wezterm.action{CloseCurrentPane={confirm=true}}},
		-- 	   { key = "n", mods="SHIFT|CTRL",     action="ToggleFullScreen" },
		-- -- 	   { key="v",   mods="CTRL",     action=wezterm.action.PasteFrom 'Clipboard'},
		-- -- 	   { key="c",   mods="CTRL",     action=wezterm.action.CopyTo 'Clipboard'},
		-- },
  keys = {
    { key = "h", mods = "ALT", action=wezterm.action{ActivateTabRelative=-1}},
    { key = "l", mods = "ALT", action=wezterm.action{ActivateTabRelative=1}},

		{ key = "t", mods = "ALT", action=wezterm.action{SpawnTab="CurrentPaneDomain"}},

    { key = "s", mods = "ALT", action=wezterm.action{EmitEvent="save_session"}},
    { key = "o", mods = "ALT", action=wezterm.action{EmitEvent="load_session"}},
    
    { key = "r", mods = "ALT", action=wezterm.action{EmitEvent="restore_session"}},

    { key = "1", mods = "ALT", action=wezterm.action{ActivateTab=0}},
    { key = "2", mods = "ALT", action=wezterm.action{ActivateTab=1}},
    { key = "3", mods = "ALT", action=wezterm.action{ActivateTab=2}},
    { key = "4", mods = "ALT", action=wezterm.action{ActivateTab=3}},
    { key = "5", mods = "ALT", action=wezterm.action{ActivateTab=4}},
    { key = "6", mods = "ALT", action=wezterm.action{ActivateTab=5}},
    { key = "7", mods = "ALT", action=wezterm.action{ActivateTab=6}},
    { key = "8", mods = "ALT", action=wezterm.action{ActivateTab=7}},
    { key = "9", mods = "ALT", action=wezterm.action{ActivateTab=8}},
    { key = "H", mods = "ALT", action=wezterm.action{AdjustPaneSize={"Left", 5}}},
    { key = "J", mods = "ALT", action=wezterm.action{AdjustPaneSize={"Down", 5}}},
    { key = "K", mods = "ALT", action=wezterm.action{AdjustPaneSize={"Up", 5}}},
    { key = "L", mods = "ALT", action=wezterm.action{AdjustPaneSize={"Right", 5}}},
  },
		set_environment_variables = {},
	}


	return config
