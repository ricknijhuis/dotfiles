return {
	"mrjones2014/smart-splits.nvim",
	lazy = false,
	config = function()
		vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
		vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
		vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
		vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)

		vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
		vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
		vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
		vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)
	end,
	--	keys = {
	--		-- movement
	--		{
	--			"<C-h>",
	--			function()
	--				require("smart-splits").move_cursor_left()
	--			end,
	--			desc = "move to split left",
	--		},
	--		{
	--			"<C-j>",
	--			function()
	--				require("smart-splits").move_cursor_down()
	--			end,
	--			desc = "move to split down",
	--		},
	--		{
	--			"<C-k>",
	--			function()
	--				require("smart-splits").move_cursor_up()
	--			end,
	--			desc = "move to split up",
	--		},
	--		{
	--			"<C-l>",
	--			function()
	--				require("smart-splits").move_cursor_right()
	--			end,
	--			desc = "move to split right",
	--		},
	--		-- resize
	--		{
	--			"<leader><leader>h",
	--			function()
	--				require("smart-splits").resize_left()
	--			end,
	--			desc = "resize split left",
	--		},
	--		{
	--			"<leader><leader>j",
	--			function()
	--				require("smart-splits").resize_down()
	--			end,
	--			desc = "resize split down",
	--		},
	--		{
	--			"<leader><leader>k",
	--			function()
	--				require("smart-splits").resize_up()
	--			end,
	--			desc = "resize split up",
	--		},
	--		{
	--			"<leader><leader>l",
	--			function()
	--				require("smart-splits").resize_right()
	--			end,
	--			desc = "resize split right",
	--		},
	--	},
}
