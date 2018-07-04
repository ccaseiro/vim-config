" =========================================================
" Plugins
" =========================================================
call plug#begin()

" Tim Pope plugins
"  - Sensible (configuration)
"  - Unimpaired (like [<Space> and ]<Space>)
"  - Surround (ex. cs"' )
"  - Repeat (.) plugin commands
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" highlight yanked text
Plug 'machakann/vim-highlightedyank'

" An ack/ag/pt/rg powered code search and view tool
Plug 'dyng/ctrlsf.vim'

" Multiple cursors
Plug 'terryma/vim-multiple-cursors'

" Comments
Plug 'tomtom/tcomment_vim'

" Leader-Guide (similar to spacemacs) 
Plug 'hecal3/vim-leader-guide'

call plug#end()


" =========================================================
" General config
" =========================================================
let mapleader=' '

" lower the delay, because we are using <space> as leader
set timeoutlen=400

" highlight all search matches
set hlsearch

" font
set guifont=Dank\ Mono:h12,Fira\ Code:h12


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
inoremap <c-space>ft <Esc>:CtrlSFToggle<CR>

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
" Mutiple cursor
" =========================================================
" If set to 0, then pressing g:multi_cursor_quit_key in visual/insert
" mode will not quit and delete all existing cursors
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0

" =========================================================
" Tab
" =========================================================
set listchars=tab:▸\ ,eol:¬
let &tabstop=exists('g:tabSize') ? g:tabSize : 2
let &softtabstop=exists('g:tabSize') ? g:tabSize : 2
let &shiftwidth=exists('g:tabSize') ? g:tabSize : 2
set expandtab

" =========================================================
" Terminal
" =========================================================
tnoremap <Esc> <C-\><C-N>
" tnoremap <M-[> <Esc>
tnoremap <C-v><Esc> <Esc>

if has('nvim')
  highlight! link TermCursor Cursor
  highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
endif

" =========================================================
" vim-leader-guide
" =========================================================

" set up dictionary for <localleader>
let g:llmap = {}

let g:lmap =  {}

let g:lmap.f =  {}
let g:lmap.f.e = { 
                  \'name' : '+vimrc',
                  \'d' : ['e ~/.vim/vimrc', '.vimrc'],
                  \'v' : ['e $MYVIMRC', '$MYVIMRC'],
                  \'r' : ['so $MYVIMRC', 'sync $MYVIMRC'],
                  \'R' : ['so $MYVIMRC', 'sync $MYVIMRC'],
                  \}

" combine the two dictionaries into a single top-level dictionary:
let g:topdict = {}
let g:topdict[' '] = g:lmap
let g:topdict[' ']['name'] = '<leader>'
let g:topdict[','] = g:llmap
let g:topdict[',']['name'] = '<localleader>'

" register it with the guide:
call leaderGuide#register_prefix_descriptions("", "g:topdict")

" define mappings:
nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>


