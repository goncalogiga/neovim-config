-- My collection of remaps

-- Move blocks of code with J and K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Copy outside of vim with leader y
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- no more Q
vim.keymap.set("n", "Q", "<nop>")

-- Replace word
vim.keymap.set("n", "<leader>wr", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]])

--Nerd tree
vim.keymap.set("n", "<leader>cd", ":NERDTreeClose<CR>:NERDTree %:p:h<CR>")

-- Normal tabbing
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

-- Autocompletion with tab
vim.o.wildignorecase = true
vim.o.wildmode = "longest,list:longest,full"

-- Remaping windows navigation keys
vim.keymap.set('n', '<A-h>', ":wincmd h<CR>")
vim.keymap.set('n', '<A-j>', ":wincmd j<CR>")
vim.keymap.set('n', '<A-k>', ":wincmd k<CR>")
vim.keymap.set('n', '<A-l>', ":wincmd l<CR>")

-- Delete buffer
vim.keymap.set('n', '<leader>bd', ":BufferClose<CR>")

-- Adds a breakpoint
vim.keymap.set('n', '<leader>b', "obreakpoint()<Esc>")

-- Stringify a word
vim.keymap.set('n', '<leader>"', 'bi"<Esc>ea"<Esc>')
vim.keymap.set('n', "<leader>'", "bi'<Esc>ea'<Esc>")

-- Consequtive replaces
vim.keymap.set('v', '<C-r>', "hy:%s/<C-r>h//gc<left><left><left>")
