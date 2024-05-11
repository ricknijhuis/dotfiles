local wezterm = require("wezterm")
local platform = require("utils.platform")
local mux = wezterm.mux
local module = {}

function module.apply(config)
	wezterm.on("gui-startup", function(cmd)
		local tab, pane, window = mux.spawn_window(cmd or {})
		window:gui_window():maximize()
	end)
	if platform.is_win then
		config.default_prog = { "C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe", "-NoLogo" }
		config.launch_menu = {
			{ label = "Command Prompt", args = { "cmd" } },
		}
	end
end

return module
