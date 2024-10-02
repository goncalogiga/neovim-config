vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fw', ':Telescope live_grep<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fl', ':Telescope current_buffer_fuzzy_find<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fr', ':Telescope oldfiles<CR>', {noremap = true})

-- CUSTOM ENVIRONNEMENT SETTER

local setup_new_branch_environnement = function()
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    opts = opts or {}
    opts.attach_mappings = function()
        actions.select_default:replace(
            function(prompt_bufnr, _)
                local selected_entry = action_state.get_selected_entry()
                local current_line = action_state.get_current_line()

                actions.close(prompt_bufnr)

                local branch = selected_entry ~= nil and
                    selected_entry.value or current_line

                if branch == nil then
                    return
                end

                -- Find out which 'main' branch to use
                local main_branch_to_switch = nil
                for _, main_branch in ipairs({"develop", "master", "main"}) do
                    vim.fn.system("git branch --list | grep -q " .. main_branch)
                    if vim.v.shell_error == 0 then
                        main_branch_to_switch = string.gsub(main_branch, "origin/", "")
                        break
                    end
                end

                -- Switch to local branch to update local repo with remote
                -- changes
                local out_switch_main = vim.fn.system("git switch " .. main_branch_to_switch)
                if vim.v.shell_error ~= 0 then
                    error("Failed to switch to main branch: " .. out_switch_main)
                end
                print(out_switch_main)

                -- Update with git pull (from main)
                local out_pull = vim.fn.system("git pull")
                if vim.v.shell_error ~= 0 then
                    error("Failed to pull from main branch: " .. out_pull)
                end
                print(out_pull)

                -- Switch to the updated branch
                local out_switch_branch = vim.fn.system("git switch " .. string.gsub(branch, "origin/", ""))
                if vim.v.shell_error ~= 0 then
                    error("Failed to switch to tarhet branch: " .. out_switch_branch)
                end
                print(out_switch_branch)

                -- Find out if origin/branch is up to date with remote branch
                local current_branch_name = string.gsub(vim.fn.system("git branch --show-current"), "%s+", "")
                local out_merge_base = vim.fn.system("git merge-base --is-ancestor origin/" .. current_branch_name .. " " .. current_branch_name)
                if vim.v.shell_error ~= 0 then
                    print(out_merge_base)
                    require("notify")("Local and remote branches have diverged.", "error")
                else
                    -- Build the environnement now that we are in the correct branch
                    vim.api.nvim_command("2TermExec cmd='automake " .. vim.fn.getcwd() .. "'")
                end
            end)
        return true
    end
    require("telescope.builtin").git_branches(opts)
end

vim.keymap.set("n", "<leader>gw", setup_new_branch_environnement, silent)
