local w = require("wezterm")

local M = {}

local function is_vim(pane)
	-- this is set by the plugin, and unset on ExitPre in Neovim
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

local function move(key)
	return {
		key = key,
		mods = "CTRL",
		action = w.action_callback(function(win, pane)
			if is_vim(pane) then
				win.perform_action({
					SendKey = { key = key, mods = "CTRL" },
				}, pane)
			else
				win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
			end
		end),
	}
end

local function resize(key)
	return {
		key = key,
		mods = "META",
		action = w.action_callback(function(win, pane)
			if is_vim(pane) then
				win.perform_action({
					SendKey = { key = key, mods = "META" },
				}, pane)
			else
					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
			end
		end),
	}
end

function M.apply(config)
	config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

	config.keys = {
		-- move between split panes
		move("h"),
		move("j"),
		move("k"),
		move("l"),

		-- resize panes
		resize("h"),
		resize("j"),
		resize("k"),
		resize("l"),
		{
			mods = "LEADER",
			key = "-",
			action = w.action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			mods = "LEADER",
			key = "=",
			action = w.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			mods = "LEADER",
			key = "q",
			action = w.action.CloseCurrentPane({ confirm = true }),
		},
	}
end

return M
