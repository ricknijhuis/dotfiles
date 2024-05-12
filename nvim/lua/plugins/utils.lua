return {
    { "tpope/vim-sleuth", lazy = false },
	{ "tpope/vim-fugitive", lazy = false },
    { "echasnovski/mini.pairs", version = false, lazy = false, config = function() require("mini.pairs").setup() end  },
	{ "echasnovski/mini.surround", version = false, lazy = false, config = function() require("mini.surround").setup() end },
	{ "echasnovski/mini.comment", version = false, lazy = false, config = function() require("mini.comment").setup() end },
}