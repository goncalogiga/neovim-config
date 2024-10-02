vim.keymap.set("n", "<A-b>", ":Tagbar<CR>")

vim.g.tagbar_width = 40
vim.g.tagbar_position = "topleft vertical"

-- When opening a python file, toggle NERDTree off and launch tagbar
-- vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter", "FileType" }, {
--     pattern = { "python" },
--     callback = function()
--         vim.cmd.NERDTreeClose()
--         vim.cmd.Tagbar()
--     end
-- })

-- Prevent annoying auto jumping when scrolling with a mouse
vim.g.tagbar_no_status_line = 1
