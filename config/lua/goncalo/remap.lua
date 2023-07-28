-- My collection of remaps

-- Move blocks of code with J and K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Copy outside of vim with leader "y"
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- no more Q
vim.keymap.set("n", "Q", "<nop>")

-- Replace word globaly (entire file)
vim.keymap.set("n", "<leader>gr", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]])

-- Replace word under context in the visual context [TODO]
-- vim.keymap.set("v", "<leader>r",  [[:s/\<<C-r><C-w>\>//gI<Left><Left><Left>]])

-- Replace current word - jump to the next occurence
vim.keymap.set("n", "<leader>r", '*Nciw')
vim.keymap.set("n", "<leader>n", 'cgn')
vim.keymap.set("i", "<leader>n", '<Esc>cgn')

--Nerd tree
vim.keymap.set("n", "<leader>cd", ":NERDTreeClose<CR>:NERDTree %:p:h<CR>")

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

-- Adds a breakpoint
vim.keymap.set('n', '<leader>b', "obreakpoint()<Esc>")

-- Stringify a word
vim.keymap.set('n', '<leader>"', 'bi"<Esc>ea"<Esc>')
vim.keymap.set('n', "<leader>'", "bi'<Esc>ea'<Esc>")

-- Chunk visual selection
vim.keymap.set('n', '<leader>vj', 'v15j')
vim.keymap.set('n', '<leader>vk', 'v15k')
