" =========================================================
" Plugins
" =========================================================
call plug#begin()

" highlight yanked text
Plug 'machakann/vim-highlightedyank'

" An ack/ag/pt/rg powered code search and view tool
Plug 'dyng/ctrlsf.vim'

" Multiple cursors
Plug 'terryma/vim-multiple-cursors'

call plug#end()


" =========================================================
" General config
" =========================================================
let mapleader=' '


" =========================================================
" CtrlSF config
" =========================================================
nmap     <leader>ff <Plug>CtrlSFPrompt
vmap     <leader>ff <Plug>CtrlSFVwordPath
vmap     <leader>fF <Plug>CtrlSFVwordExec
nmap     <leader>fn <Plug>CtrlSFCwordPath
nmap     <leader>fp <Plug>CtrlSFPwordPath
nnoremap <leader>fo :CtrlSFOpen<CR>
nnoremap <leader>ft :CtrlSFToggle<CR>
inoremap <leader>ft <Esc>:CtrlSFToggle<CR>


" =========================================================
" Emacs keybindings while inserting. 
" =========================================================
" map! <c-a> <c-o>^
" map! <c-e> <c-o>$
noremap! <c-a> <Home>
noremap! <c-e> <End>
noremap! <c-f> <Right>
noremap! <c-b> <Left>
noremap! <c-d> <Delete>
noremap! <c-n> <Down>
noremap! <c-p> <Up>
inoremap <c-g> <c-p>

" Command line (Need to map these once more for inc-search to work).
cnoremap <c-a> <Home>
cnoremap <c-e> <End>
cnoremap <c-f> <Right>
cnoremap <c-b> <Left>
cnoremap <c-d> <Delete>
" =========================================================
