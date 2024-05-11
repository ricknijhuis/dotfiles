# NVIM setup
Welcome to my personal NVIM setup.

# Features
- fuzzy finder
    - within git respecting gitignore
    - within parent dir
    - by file contents/words
- file marking and switching
- filesystem exploring and editing as standard buffers
- syntax highlighting
- language server
    - goto definition
    - goto declaration
    - code actions
- rustic color theme(rosepine)

# Installation
1. Make sure you have [Neovim](https://neovim.io/) installed. This configuration was tested with Neovim 0.9+ but it may work on other versions as well.
2. Clone this repository into your neovim directory.
3. Start neovim in your terminal of choice

# Currently included packages
This configuration contains some packages to improve my workflow, it might not work for you, as far as I know this is a 
pretty minimal config so you might want to adjust to any personal needs.
- cmp-nvim-lsp
- Comment
- conform (linting)
- fidget
- gitsigns
- lazy(package manager)
- mason-lsp-config (bridge between mason and lspconfig)
- mason-tool-installer (bridge between mason and lspconfig)
- mason (lsp/linter/formatter package management)
- neodev
- nvim-lsp-config
- nvim-treesitter (syntax highlighting)
- nvim-web-devicons
- oil (file explorer)
- plenary.nvim (utils)
- smart splits (window management, wezterm)
- telescope (fuzzy finder)
- telescope-ui-select (lsp dropdown using telescope)
- telescope-undo (undo view through telescope)
- tokyo-night (theme)
- vim-fugitive (git)
- vim-sleuth (indenting)
- vim-surround (auto pairs)
- which-key (suggestions)
