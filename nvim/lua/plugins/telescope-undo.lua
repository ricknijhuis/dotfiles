return {
    'debugloop/telescope-undo.nvim',
    dependencies = { -- note how they're inverted to above example
        {
            'nvim-telescope/telescope.nvim',
            dependencies = { 'nvim-lua/plenary.nvim' },
        },
    },
    config = function(_, opts)
        -- Calling telescope's setup from multiple specs does not hurt, it will happily merge the
        -- configs for us. We won't use data, as everything is in it's own namespace (telescope
        -- defaults, as well as each extension).
        require('telescope').setup(opts)
        require('telescope').load_extension('undo')
    end,
    keys = {
        {
            '<leader>u',
            function()
                local telescope = require('telescope')
                telescope.extensions.undo.undo()
             end,
            desc = 'undo history'
        }
    },
    opts ={},
}
