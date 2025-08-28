local wezterm = require("wezterm")
local config = {}

-- config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font = wezterm.font("CommitMono Nerd Font")
config.font_size = 16

config.window_decorations = "RESIZE"

-- config.color_scheme = "mountnugget"
config.color_scheme = "rose-pine"
-- config.window_background_opacity = 0.85
config.macos_window_background_blur = 90
config.inactive_pane_hsb = {
	saturation = 1,
	brightness = 0.6,
}

config.window_padding = {
	left = 5,
	right = 5,
	bottom = 0,
	top = 5,
}

-- multiplexer
config.leader = { key = "s", mods = "CTRL", timeout_milliseconds = 1000 }

-- Smart splits
local function is_vim(pane)
	return pane:get_user_vars().IS_NVIM == "true"
end

local direction_keys = {
	Left = "h",
	Down = "j",
	Up = "k",
	Right = "l",
	-- reverse lookup
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}

local function split_nav(resize_or_move, key)
	local mods = resize_or_move == "resize" and "META" or "CTRL"
	print(mods)
	return {
		key = key,
		mods = mods,
		action = wezterm.action_callback(function(win, pane)
			if is_vim(pane) then
				win:perform_action({
					SendKey = { key = key, mods = mods },
				}, pane)
			else
				if resize_or_move == "resize" then
					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
				else
					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
				end
			end
		end),
	}
end

config.keys = {
	-- splitting
	{
		key = "|",
		mods = "LEADER",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "q",
		mods = "LEADER",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "v",
		mods = "LEADER",
		action = wezterm.action.ActivateCopyMode,
	},
	{
		key = "m",
		mods = "LEADER",
		action = wezterm.action.TogglePaneZoomState,
	},
	split_nav("move", "h"),
	split_nav("move", "j"),
	split_nav("move", "k"),
	split_nav("move", "l"),
	split_nav("resize", "h"),
	split_nav("resize", "j"),
	split_nav("resize", "k"),
	split_nav("resize", "l"),
	-- tab
	{
		key = "+",
		mods = "LEADER",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "p",
		mods = "LEADER",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		key = "n",
		mods = "LEADER",
		action = wezterm.action.ActivateTabRelative(1),
	},
	-- {
	-- 	key = "l",
	-- 	mods = "LEADER",
	-- 	action = wezterm.action.ShowTabNavigator,
	-- },
	{
		key = "H",
		mods = "LEADER",
		action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "J",
		mods = "LEADER",
		action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
	},
	{
		key = "K",
		mods = "LEADER",
		action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "L",
		mods = "LEADER",
		action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
	},
	{
		key = "w",
		mods = "LEADER",
		action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }),
	},
	{
		key = "s",
		mods = "LEADER",
		action = wezterm.action.ShowLauncherArgs({ flags = "TABS|WORKSPACES" }),
	},
	{
		key = ":",
		mods = "LEADER",
		action = wezterm.action.ActivateCommandPalette,
	},
	{
		key = ",",
		mods = "LEADER",
		action = wezterm.action.PromptInputLine({
			description = "Enter a new name for tab: ",
			action = wezterm.action_callback(function(win, pane, line)
				if line then
					win:active_tab():set_title(line)
				end
			end),
		}),
	},
	{
		key = "N",
		mods = "LEADER",
		action = wezterm.action.PromptInputLine({
			description = "Enter a new name for workspace: ",
			action = wezterm.action_callback(function(win, pane, line)
				if line then
					win:perform_action(
						wezterm.action.SwitchToWorkspace({
							name = line,
						}),
						pane
					)
				end
			end),
		}),
	},
	{
		key = "R",
		mods = "LEADER",
		action = wezterm.action.PromptInputLine({
			description = "Enter a new name for workspace: ",
			action = wezterm.action_callback(function(win, pane, line)
				if line then
					win:perform_action(wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), line), pane)
				end
			end),
		}),
	},
}

-- enable index tab navigation
for i = 0, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = wezterm.action.ActivateTab(i),
	})
end

-- tab bar
config.tab_bar_at_bottom = true
config.tab_max_width = 32
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.status_update_interval = 1000

local function tab_title(tab_info)
	local title = tab_info.tab_title
	if title and #title > 0 then
		return title
	end
	return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local title = tab_title(tab)
	local index = tab.tab_index
	return {
		{ Text = "| " .. index .. " : " .. title .. " " },
	}
end)

wezterm.on("update-status", function(win, pane)
	local stat = win:active_workspace()
	if win:active_key_table() then
		stat = win:active_key_table()
	end
	if win:leader_is_active() then
		stat = stat .. " LDR"
	end

	local basename = function(s)
		return string.gsub(s, "(.*[/\\])(.*)", "%2")
	end
	local cwd = pane:get_current_working_dir()
	if cwd then
		if type(cwd) == "userdata" then
			cwd = basename(cwd.file_path)
		else
			cwd = basename(cwd)
		end
	else
		cwd = ""
	end

	local time = wezterm.strftime("%H:%M")

	win:set_left_status(wezterm.format({
		{ Text = " " },
		{ Text = wezterm.nerdfonts.oct_table .. " " .. stat },
		{ Text = " |" },
	}))

	win:set_right_status(wezterm.format({
		{ Text = wezterm.nerdfonts.md_folder .. " " .. cwd },
		{ Text = " | " },
		{ Text = wezterm.nerdfonts.md_clock .. " " .. time },
		{ Text = " " },
	}))
end)

-- Support for font size increase via ZEN_MODE
wezterm.on("user-var-changed", function(window, pane, name, value)
	print("hello")
	local overrides = window:get_config_overrides() or {}
	if name == "ZEN_MODE" then
		local incremental = value:find("+")
		local number_value = tonumber(value)
		if incremental ~= nil then
			while number_value > 0 do
				window:perform_action(wezterm.action.IncreaseFontSize, pane)
				number_value = number_value - 1
			end
			overrides.enable_tab_bar = false
		elseif number_value < 0 then
			window:perform_action(wezterm.action.ResetFontSize, pane)
			overrides.font_size = nil
			overrides.enable_tab_bar = true
		else
			overrides.font_size = number_value
			overrides.enable_tab_bar = false
		end
	end
	window:set_config_overrides(overrides)
end)

return config
