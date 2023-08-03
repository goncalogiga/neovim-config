vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fw', ':Telescope live_grep<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fl', ':Telescope current_buffer_fuzzy_find<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<CR>', {noremap = true})