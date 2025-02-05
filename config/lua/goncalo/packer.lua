vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer
    use 'wbthomason/packer.nvim'

    -- Colorscheme
    use { 
        "catppuccin/nvim", 
        as = "catppuccin",
        config = function()
            vim.cmd.colorscheme("catppuccin-macchiato")
        end
    }

    -- Telescope
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            { "nvim-telescope/telescope-live-grep-args.nvim" },
        }
    }

    -- FZF (fuzzy search engine)
    use('junegunn/fzf', {run = './install --bin'})
    use('junegunn/fzf.vim')

    -- Treesitter (syntax highlight)
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

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

    -- Nvim tree
    use('nvim-tree/nvim-tree.lua')

    -- Tabulations
    use 'romgrk/barbar.nvim'
    use('lewis6991/gitsigns.nvim') -- OPTIONAL: for git status

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
    use { 
        "iamcco/markdown-preview.nvim", 
        run = "cd app && npm install", 
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end, 
        ft = { "markdown" }
    }

    -- Tag bar
    use("preservim/tagbar")
    
    -- Goyo
    use("junegunn/goyo.vim")

    -- Neorg
    use {
        "nvim-neorg/neorg",
        -- This is pinned for now. v7.0.O throws an error on startup
        tag = "v6.2.0",
        -- !!! RUN THIS AFTER INSTALLATION !!!
        -- run = ":Neorg sync-parsers",
        requires = "nvim-lua/plenary.nvim"
    }

    -- notify
    use("rcarriga/nvim-notify")

    -- Better git conflict management
    use("akinsho/git-conflict.nvim")

    -- Multicursor
    -- Doc: https://github.com/mg979/vim-visual-multi/wiki/Mappings
    use {
        'mg979/vim-visual-multi',
        branch = 'master',
    }

    -- Avante (LLMs inside of neovim)
    use({
        "yetone/avante.nvim",
        run = "make BUILD_FROM_SOURCE=true",
        requires = {
            "nvim-treesitter/nvim-treesitter",
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            { "nvim-tree/nvim-web-devicons", opt = true },
            {
                -- Markdown rendering support
                'MeanderingProgrammer/render-markdown.nvim',
                ft = { 'markdown', 'Avante' }, -- Load on specific file types
                config = function()
                    require('render-markdown').setup({
                        file_types = { 'markdown', 'Avante' }
                    })
                end
            },
        },
    })

end)
