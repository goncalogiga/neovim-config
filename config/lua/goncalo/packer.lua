vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer
    use 'wbthomason/packer.nvim'

    -- Colorscheme
    use { 
        "catppuccin/nvim", 
        as = "catppuccin",
        config = function()
            vim.cmd.colorscheme("catppuccin-latte")
        end
    }

    -- FZF (fuzzy search engine)
    use('junegunn/fzf', {run = './install --bin'})
    use('junegunn/fzf.vim')

    -- Treesitter (syntax highlight)
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    -- Undotree
    use('mbbill/undotree')

    -- Git Fugitive
    use('tpope/vim-fugitive')

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
            'williamboman/mason.nvim',
            run = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
        }

    }

    -- Formatter
    use { 'mhartington/formatter.nvim' }

    -- Floating terminal
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end}

    -- Nerd tree
    use('preservim/nerdtree')

    -- Tabulations
    use 'romgrk/barbar.nvim'
    use('lewis6991/gitsigns.nvim') -- OPTIONAL: for git status

    -- Auto-paor
    -- use('jiangmiao/auto-pairs')

    -- Quickly comment
    use('tpope/vim-commentary')

    -- A plugin to manage formatting
    use('sbdchd/neoformat')

    -- A plugin to have icons (buggy)
    use('nvim-tree/nvim-web-devicons')

    -- A nice status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    
    -- A nice init screen
    use {
        "startup-nvim/startup.nvim",
        requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
        config = function()
            require("startup").setup()
        end
    }

    -- Open CSVs in neovim
    use("mechatroner/rainbow_csv")

    -- More LSP/Autocompletion plugins
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("saadparwaiz1/cmp_luasnip")
    use("rafamadriz/friendly-snippets")

    -- A better git log
    use("kablamo/vim-git-log")

    -- Render markdowns (warning: this needs npm)
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

    -- Allow for ssh connection
    use {
        'chipsenkbeil/distant.nvim',
        branch = 'v0.2',
        config = function()
            require('distant').setup {
                -- Applies Chip's personal settings to every machine you connect to
                --
                -- 1. Ensures that distant servers terminate with no connections
                -- 2. Provides navigation bindings for remote directories
                -- 3. Provides keybinding to jump into a remote file's parent directory
                ['*'] = require('distant.settings').chip_default()
            }
        end
    }

    -- Tag bar
    use("preservim/tagbar")
    
    -- Goyo
    use("junegunn/goyo.vim")

    -- Neorg
    use {
        "nvim-neorg/neorg",
        config = function()
            require('neorg').setup {
                load = {
                    ["core.defaults"] = {}, -- Loads default behaviour
                    ["core.concealer"] = {}, -- Adds pretty icons to your documents
                    ["core.dirman"] = { -- Manages Neorg workspaces
                        config = {
                            workspaces = {
                                notes = "~/notes",
                            },
                        },
                    },
                },
            }
        end,
        -- run = ":Neorg sync-parsers",
        requires = "nvim-lua/plenary.nvim",
    }

    -- Yanky (neovim killring)
    use("gbprod/yanky.nvim")

    -- notify
    use("rcarriga/nvim-notify")

end)
