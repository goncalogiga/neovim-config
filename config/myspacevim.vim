function! myspacevim#before() abort

    " === Usefull remps and utils ===
    
    map O o<ESC>

    " Update currend directory
    nnoremap <Space>cd :NERDTreeClose<CR>:NERDTree %:p:h<CR>

    " =====================
  

    " === NERDTree preferences ===

    " ============================

    " === Quickly hide window ===
    
    nnoremap <Space>hi :hide<CR>

    " ===========================


    " === FZF Key Bindings ===
    
    let $FZF_DEFAULT_COMMAND = 'fdfind --type f --type d --follow --hidden --exclude anaconda3 --exclude .git --exclude Trash --exclude .emacs.d --exclude .mozilla --exclude *.fls --exclude python3.6 --exclude snap --exclude .vscode'

    " Find Files
    nnoremap <Space>ff :Files ~<CR>

    " Find Words
    nnoremap <Space>fw :Rg<CR>

    " Find Buffers
    nnoremap <Space>fb :Buffers<CR>

    " Find lines
    nnoremap <Space>fl :Lines<CR>

    " Find in current directory + previous directory
    nnoremap <Space>fd :Files ..<CR>

    " Find in current directory
    nnoremap <Space>fh :Files .<CR>

    " Find up two directories
    nnoremap <Space>f2d :Files ../..<CR>

    " ========================

    " === Setting up ALE ===
   
    let g:spacevim_lint_engine = 'ale'

    let g:ale_python_flake8_options = 'ignore=E501,W292,W293,W503,W291'

    let g:ale_python_pylint_options = 'ignore=E501,W292,W293,W503,W291'

    " ======================
    
    " === A widther goyo window for python ===
    
    let g:goyo_width = 150

    " ========================================
    
    " === Make COC stfu ===

    let g:coc_disable_startup_warning = 1

    " =====================
    
    " === Terminal open/close ===
    
    local function Term()
        local terminal_buffer_number = vim.fn.bufnr("term://")
        local terminal_window_number = vim.fn.bufwinnr("term://")
        local window_count = vim.fn.winnr("$")

        if terminal_window_number > 0 and window_count > 1 then
            vim.fn.execute(terminal_window_number .. "wincmd c")
        elseif terminal_buffer_number > 0 and terminal_buffer_number ~= vim.fn.bufnr("%") then
            vim.fn.execute("sb " .. terminal_buffer_number)  
        elseif terminal_buffer_number == vim.fn.bufnr("%") then
            vim.fn.execute("bprevious | sb " .. terminal_buffer_number .. " | wincmd p")
        else
            vim.fn.execute("sp term://zsh")
        end
    end

    vim.api.nvim_create_user_command("Term", Term, {
      desc = "Open terminal window",
    })

    vim.keymap.set("n", "<leader><space>", vim.cmd.Term, { noremap = true, silent = true })
    vim.keymap.set("t", "jj", "<C-\\><C-n>", { noremap = true, silent = true })

    " ===========================
    
endfunction

function! myspacevim#after () abort

    " === Usefull rempas ===
    
    vnoremap J :m '>+1<CR>gv=gv
    vnoremap K :m '<-2<CR>gv=gv

    tnoremap <Esc> <C-\><C-n>

    " =====================
 
endfunction
