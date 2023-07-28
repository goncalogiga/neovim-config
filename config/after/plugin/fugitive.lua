vim.keymap.set('n', "<leader>gs", ":vertical Git<CR>")
vim.keymap.set('n', "<leader>gl", ":vertical Git log<CR>")
vim.keymap.set('n', "<leader>got", ":vertical Git log --oneline --decorate --graph<CR>")
vim.keymap.set('n', "<leader>gt", ":vertical Git log --decorate --graph<CR>")
vim.keymap.set('n', "<leader>grl", ":vertical Git reflog --date=local<CR>")
vim.keymap.set('n', "<leader>gcrl", ":vertical Git reflog --format='CommitDate: %cd | AuthorDate: %aD | %gs | %h | %gd'<CR>")
vim.keymap.set('n', "<leader>gb", ":vertical Git blame<CR>")
vim.keymap.set('n', "<leader>gd", ":vertical Gdiffsplit<CR>")
vim.keymap.set('n', "<leader>gc", ":vertical Gdiffsplit ")




-- GIT STATUS
-- gs

-- GIT LOG
-- gl

-- GIT 'ONLINE' LOG (Shows the *minimal* tree of commits of the repository)
-- got

-- GIT 'TREE' (Shows the *complete* tree of commits of the repository)
-- gt

-- GIT REFLOG 
-- grl

-- GIT 'COMPLETE' REFLOG (Reflog with extra informations)
-- gcrl

-- GIT BLAME
-- gb

-- GIT DIFF
-- gd

-- GIT 'COMPARE' (Git diff but you can give a specific branch to compare with)
-- gc
