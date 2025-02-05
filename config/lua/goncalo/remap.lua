-- My collection of remaps

-- Move blocks of code with J and K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Copy outside of vim with leader "y"
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- no more Q
vim.keymap.set("n", "Q", "<nop>")

--Nerd tree (also close tagbar if it's on)
vim.keymap.set("n", "<leader>cd", ":TagbarClose<CR>:NvimTreeClose<CR>:NvimTreeOpen %:p:h<CR>")

-- Normal tabbing
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

-- Autocompletion with tab
vim.o.wildignorecase = true
vim.o.wildmode = "longest,list:longest,full"

-- Remaping windows navigation keys
vim.keymap.set('n', '<A-j>', ":wincmd j<CR>")
vim.keymap.set('n', '<A-h>', ":wincmd h<CR>")
vim.keymap.set('n', '<A-k>', ":wincmd k<CR>")
vim.keymap.set('n', '<A-l>', ":wincmd l<CR>")

-- Delete buffer
vim.keymap.set('n', '<leader>bd', ":BufferClose<CR>")

-- Stringify a word
vim.keymap.set('n', '<leader>"', 'bi"<Esc>ea"<Esc>')
vim.keymap.set('n', "<leader>'", "bi'<Esc>ea'<Esc>")

-- Chunk {visual selection
vim.keymap.set('n', '<leader>vj', 'v15j')
vim.keymap.set('n', '<leader>vk', 'v15k')

-- F-string
vim.keymap.set('n', '<leader>fs', 'F"if<Esc>')

--  Auto bracket
vim.keymap.set('n', '{', 'F a{<Esc>f i}<Esc>') 
vim.keymap.set('n', '}', 'ea}<Esc>') 

-- Neorg: rapid access
vim.keymap.set('n', '<leader>nn', ':Neorg index<CR>')
vim.keymap.set('n', '<leader>nr', ':Neorg return<CR>')

---- REGEX REMAPS ---- 

-- Simple Replace of the pattern
vim.keymap.set('v', '<leader>rr', ":s/")
-- Keep only the pattern
vim.keymap.set('v', '<leader>rk', ":g!//d<Left><Left>")
-- Delete the pattern
vim.keymap.set('v', '<leader>rd', ":g//d<Left><Left>")

---------------------- 
