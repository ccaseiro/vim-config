" ====================================================================== 
" Default mappins inside telescope:
" ====================================================================== 
" <C-n>  <C-p> next | previous
" <Down> <Up>  next | previous
" j      k     next | previous (in normal mode)
" <CR>         go to file selection
"
" <C-x>        go to file selection as a split
" <C-v>        go to file selection as a vertical split
" <C-t>        go to a file in a new tab
"
" <C-u>        scroll up in preview window
" <C-d>        scroll down in preview window
"
" <C-c>        close telescope
" <Esc>        close telescope (in normal mode)
" ====================================================================== 

cmap <nowait> <c-r><c-r> <Plug>(TelescopeFuzzyCommandSearch)

nnoremap <space>gw <cmd>lua RELOAD('telescope'); require('telescope.builtin').grep_string { shorten_path = true, word_match = '-w' }<CR>

" Dotfiles
nnoremap <leader>en <cmd>lua RELOAD('cc.telescope'); R('cc.telescope').edit_neovim()<CR>

" Telescope
nnoremap <space>fB <cmd>lua R('cc.telescope').builtin()<CR>

" General fuzzy
nnoremap <space>ff <cmd>lua R('cc.telescope').git_files()<CR>
nnoremap <space>fg <cmd>lua R('cc.telescope').live_grep()<CR>
nnoremap <space>fo <cmd>lua R('cc.telescope').oldfiles()<CR>
nnoremap <space>fd <cmd>lua RELOAD('telescope'); require('telescope.builtin').fd()<CR>
nnoremap <space>bb <cmd>lua RELOAD('telescope'); require('telescope.builtin').buffers { shorten_path = false }<CR>
nnoremap <space>fp <cmd>lua R('cc.telescope').all_plugins()<CR>
nnoremap <space>fa <cmd>lua R('cc.telescope').installed_plugins()<CR>
nnoremap <space>ss <cmd>lua R('cc.telescope').curbuf()<CR>
nnoremap <space>pp <cmd>lua R('cc.telescope').project_search()<CR>
nnoremap <space>fh <cmd>lua R('telescope.builtin').help_tags { show_version = true }<CR>

" Lsp
nnoremap <space>fr <cmd>lua RELOAD('plenary'); RELOAD('telescope'); require('telescope.builtin').lsp_references()<CR>
nnoremap <space>fw <cmd>lua RELOAD('plenary'); RELOAD('telescope'); require('telescope.builtin').lsp_workspace_symbols { ignore_filename = true }<CR>

nnoremap <c-p> :lua require'telescope.builtin'.find_files{}<CR>
