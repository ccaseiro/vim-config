" Set kj to be escape in insert mode
inoremap kj <esc>

" Clears hlsearch after doing a search, otherwise just does normal <CR> stuff
nnoremap <expr> <CR> {-> v:hlsearch ? ":nohl\<CR>" : "\<CR>"}()

" " For long, wrapped lines
" nnoremap k gk
" " For long, wrapped lines
" nnoremap j gj
"
" " For moving quickly up and down,
" " Goes to the first line above/below that isn't whitespace
" " Thanks to: http://vi.stackexchange.com/a/213
" nnoremap gj :let _=&lazyredraw<CR>:set lazyredraw<CR>/\%<C-R>=virtcol(".")<CR>v\S<CR>:nohl<CR>:let &lazyredraw=_<CR>
" nnoremap gk :let _=&lazyredraw<CR>:set lazyredraw<CR>?\%<C-R>=virtcol(".")<CR>v\S<CR>:nohl<CR>:let &lazyredraw=_<CR>
