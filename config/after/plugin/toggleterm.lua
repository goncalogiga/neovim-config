local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

-- Toggle term general setup
toggleterm.setup({
    size = 110,
    open_mapping = [[<A-t>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "vertical",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
})

function _G.set_terminal_keymaps()
    local opts = {buffer = 0}
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<A-p>', [[<Cmd>wincmd h<CR>]], opts) -- Used to disable htop
    vim.keymap.set('t', '<A-h>', [[<Cmd>wincmd h<CR>]], {})
    vim.keymap.set('t', '<A-j>', [[<Cmd>wincmd j<CR>]], {})
    vim.keymap.set('t', '<A-k>', [[<Cmd>wincmd k<CR>]], {})
    vim.keymap.set('t', '<A-l>', [[<Cmd>wincmd l<CR>]], {})
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- Terminal instances --
-- local Terminal = require("toggleterm.terminal").Terminal

-- local python = Terminal:new({direction = "float", cmd = "python3", hidden = true})

-- function _python_toggle()
--   python:toggle()
-- end

-- This is quite usless
-- vim.api.nvim_set_keymap("n", "<A-p>", "<cmd>lua _python_toggle()<CR>", {silent = true})

-- local htop = Terminal:new({direction = "float", cmd="htop", hidden = true})

-- function _htop_toggle()
--   htop:toggle()
-- end

-- vim.api.nvim_set_keymap("n", "<A-h>", "<cmd>lua _htop_toggle()<CR>", {silent = true})

-- Add a way to list git commands
local git_help_cmd = "clear && tail -n 30 -f /home/goncalo/.config/nvim/after/plugin/fugitive.lua"
vim.keymap.set('n', "<leader>gh", ":2TermExec cmd='"..git_help_cmd.."' direction=float<CR>")

-- htop window
local htop_cmd = "htop"
vim.keymap.set('n', "<A-p>", ":2TermExec cmd='"..htop_cmd.."' direction=float<CR>")
