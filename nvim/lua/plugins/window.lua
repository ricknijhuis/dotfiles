return {
	"mrjones2014/smart-splits.nvim",
	lazy = false,
	keys = {
		-- movement
		{ "<C-h>", function() require("smart-splits").move_cursor_left() end, desc = "move to split left" },
		{ "<C-j>", function() require("smart-splits").move_cursor_down() end, desc = "move to split down" },
		{ "<C-k>", function() require("smart-splits").move_cursor_up() end, desc = "move to split up" },
		{ "<C-l>", function() require("smart-splits").move_cursor_right() end, desc = "move to split right" },
		-- resize
		{ "<A-h>", function() require("smart-splits").resize_left() end, desc = "resize split left" },
		{ "<A-j>", function() require("smart-splits").resize_down() end, desc = "resize split down" },
		{ "<A-k>", function() require("smart-splits").resize_up() end, desc = "resize split up" },
		{ "<A-l>", function() require("smart-splits").resize_right() end, desc = "resize split right" },
		-- move buf to split
		{ "<leader><leader>h", function() require("smart-splits").resize_left() end, desc = "resize split left" },
		{ "<leader><leader>j", function() require("smart-splits").resize_down() end, desc = "resize split down" },
		{ "<leader><leader>k", function() require("smart-splits").resize_up() end, desc = "resize split up" },
		{ "<leader><leader>l", function() require("smart-splits").resize_right() end, desc = "resize split right" },
	},
}
