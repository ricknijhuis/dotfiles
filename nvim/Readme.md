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
- mini-surround
- mini-pairs
- mini-comment
- which-key (suggestions)

# Keybindings
Here a list of keybindings for this setup

| Mode | Key | Action  |
|--|--|--|
| Normal | " " | Leader |
| Normal | Leader | Shows possible keys |
| Normal | Leader ca | LSP Code Action |
| Normal | Leader rn | LSP Rename |
| Normal | Leader ds | LSP Document Symbols |
| Normal | Leader D | LSP Definition |
| Normal | K | LSP Hover Documentation |
| Normal | gD | LSP Goto Declaration |
| Normal | gI | LSP Goto Implementation |
| Normal | gr | LSP Goto Reference |
| Normal | gd | LSP Goto definition |
| Normal | Leader - | Open parent dir |
| Normal | Leader / | Fuzzy find current buffer |
| Normal | Leader s/ | Grep in open files |
| Normal | Leader s. | Search recent files |
| Normal | Leader sn | Search neovim config files |
| Normal | Leader sr | Search resume |
| Normal | Leader sh | Search help |
| Normal | Leader sk | Search keymaps |
| Normal | Leader sf | Search files |
| Normal | Leader ss | Search select |
| Normal | Leader sw | Search current word |
| Normal | Leader sg | Search by grep |
| Normal | Leader sp | Search git repo(project) |
| Normal | Leader sd | Search diagnostics |
| Normal | Leader Leader | Search existing buffers |
| Normal | Leader u | Undo history |
| Normal | Leader a | Tag file |
| Normal | Leader k | Goto prev tagged file |
| Normal | Leader j | Goto next tagged file |
| Normal | Leader 1 | Goto tagged file 1 | 
| Normal | Leader 2 | Goto tagged file 2 |
| Normal | Leader 3 | Goto tagged file 3 | 
| Normal | Leader 4 | Goto tagged file 4 | 
| Normal | Leader 5 | Goto tagged file 5 |
| Normal | Leader t | Open tag menu |
| Normal | gcc | Toggle comment line |
| Visual | gc | Toggle comment selection |
| Normal | sa | Add surrounding |
| Visual | sa | Add surrounding to selection |
| Normal | sd | Delete surrounding |
| Normal | sr | Replace surrounding |
| Normal | sf | Find right surrounding |
| Normal | sF | Find left surrounding |
| Normal | sh | Highlight surrounding |
| Normal | sdl | Delete previous surrounding |
| Normal | srl | Replace previoud surrounding |
| Normal | sfl | Find previous right surrounding |
| Normal | sFl | Find previous left surrounding |
| Normal | shl | Highlight previous surrounding |
| Normal | sdn | Delete next surrounding |
| Normal | srn | Replace next surrounding |
| Normal | sfn | Find next right surrounding |
| Normal | sFn | Find next left surrounding |
| Normal | shn | Highlight next surrounding |
