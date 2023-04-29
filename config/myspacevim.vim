function! myspacevim#before() abort

    " === Usefull remps and utils ===
    
    map O o<ESC>

    " Update currend directory
    nnoremap <Space>cd :NERDTreeClose<CR>:NERDTree %:p:h<CR>

    " =====================
  

    " === NERDTree preferences ===

    " ============================


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
 
endfunction

function! myspacevim#after () abort

    " === Usefull rempas ===
    "
    vnoremap J :m '>+1<CR>gv=gv
    vnoremap K :m '<-2<CR>gv=gv

    " =====================
 
endfunction
