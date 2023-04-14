function! myspacevim#before() abort

    " === Usefull remps ===
    map O o<ESC>
    " =====================
  

    " === NERDTree preferences ===

    " Disable NERDTree on startup 
    autocmd VimEnter * NERDTreeToggle

    map <Space>ft :NERDTreeToggle %<CR>

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
 
endfunction

function! myspacevim#after () abort

    " === Usefull remps ===
    "
    vnoremap J :m '>+1<CR>gv=gv
    vnoremap K :m '<-2<CR>gv=gv

    " =====================
 
endfunction
