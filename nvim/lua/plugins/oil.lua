-- Oil is used as a replacement for netrw and provides a way of navigating and manipulating files as it were a default text buffer
return {
	"stevearc/oil.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			default_file_explorer = true,
		})
	end,
	keys = {
		{ "<leader>-", "<CMD>Oil<CR>", desc = "open parent directory" },
	},
	lazy = false,
	view_options = {
		show_hidden = true,
		is_always_hidden = function(name, bufnr)
			return false
		end,
	},
}
