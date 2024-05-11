return { -- Fuzzy Finder (files, lsp, etc)
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ -- If encountering errors, see telescope-fzf-native README for installation instructions
			"nvim-telescope/telescope-fzf-native.nvim",

			-- `build` is used to run some command when the plugin is installed/updated.
			-- This is only run then, not every time Neovim starts up.
			build = "make",

			-- `cond` is a condition used to determine whether this plugin should be
			-- installed and loaded.
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{
			"nvim-tree/nvim-web-devicons",
			enabled = vim.g.have_nerd_font,
		},
	},
	config = function()
		require("telescope").setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})
		-- Enable Telescope extensions if they are installed
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")
	end,
	keys = function()
		local builtin = require("telescope.builtin")

		return {
			{ "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" } },
			{ "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" } },
			{ "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" } },
			{ "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" } },
			{ "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" } },
			{ "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" } },
			{ "<leader>sp", builtin.git_files, { desc = "[S]earch in [P]roject respects .gitignore" } },
			{ "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" } },
			{ "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" } },
			{ "<leader>s.", builtin.oldfiles, { desc = "[S]earch Recent Files ('.' for repeat)" } },
			{ "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" } },
			{
				"<leader>/",
				function()
					-- You can pass additional configuration to Telescope to change the theme, layout, etc.
					builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
						winblend = 10,
						previewer = false,
					}))
				end,
				{ desc = "[/] Fuzzily search in current buffer" },
			},
			{
				"<leader>s/",
				function()
					builtin.live_grep({
						grep_open_files = true,
						prompt_title = "Live Grep in Open Files",
					})
				end,
				{ desc = "[S]earch [/] in Open Files" },
			},
			-- Shortcut for searching your Neovim configuration files
			{
				"<leader>sn",
				function()
					builtin.find_files({ cwd = vim.fn.stdpath("config") })
				end,
				{ desc = "[S]earch [N]eovim files" },
			},
		}
	end,
}
