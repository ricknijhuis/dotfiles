local wezterm = require("wezterm")
local platform = require("utils.platform")
local mux = wezterm.mux
local module = {}

function module.apply(config)
	wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
		local active_pane = tab.active_pane

		-- cwd is a URL object with file:// as beginning.
		local cwd = active_pane.current_working_dir
		if cwd == nil then
			return
		end

		-- get cwd in string format, https://wezfurlong.org/wezterm/config/lua/wezterm.url/Url.html
		local cwd_str = cwd.file_path

		-- shorten the path by using ~ as $HOME.
		local home_dir = os.getenv("HOME")
		return string.gsub(cwd_str, home_dir, "~")
	end)

	wezterm.on("gui-startup", function(cmd)
		-- allow `wezterm start -- something` to affect what we spawn
		-- in our initial window
		local args = {}
		local cwd = config.default_cwd

		if cmd then
			args = cmd.args
			if cmd.cwd then
				cwd = cmd.cwd
			end
		end

		local editor_args = { "nvim", cwd }

		-- Set a workspace for coding on a current project
		-- Top pane is for the editor, bottom pane is for the build tool
		local tab, cli_pane, window = mux.spawn_window({
			workspace = "coding",
			args = args,
			cwd = cwd,
		})
		local editor_pane = cli_pane:split({
			direction = "Top",
			size = 0.6,
			args = editor_args,
			cwd = cwd,
		})

		window:gui_window():maximize()
		-- We want to startup in the coding workspace
		mux.set_active_workspace("coding")

		editor_pane:send_text("nvim .\n")
	end)

	if platform.is_win then
		config.default_prog = { "C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe", "-NoLogo" }
		config.launch_menu = {
			{ label = "Command Prompt", args = { "cmd" } },
		}
	end
end

return module
