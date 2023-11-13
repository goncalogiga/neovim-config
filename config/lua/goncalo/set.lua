vim.g.mapleader = " "

-- show line numbers
vim.opt.nu = true

-- tabs configuration and indenting settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- switch file history to undotree
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- disable highlight persistance after search
vim.opt.hlsearch = false

-- dynamic highlighting during search
vim.opt.incsearch = true

-- coloring
vim.opt.termguicolors = true

-- fast update time
vim.opt.updatetime = 250

-- Enable trimmming of trailing whitespace
vim.g.neoformat_basic_format_trim = 1

-- No wrapping of lines
vim.wo.wrap = false

-- Buffer zone at the end of file
vim.opt.scrolloff=999999

-- Use virtual edit with visual block mode
vim.opt.virtualedit = "block"

-- Locate changes when using %s/...
vim.opt.inccommand = "split"
