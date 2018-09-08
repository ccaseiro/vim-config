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

" Snipets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" highlight yanked text
Plug 'machakann/vim-highlightedyank'

" An ack/ag/pt/rg powered code search and view tool
Plug 'dyng/ctrlsf.vim'

" Multiple cursors
Plug 'terryma/vim-multiple-cursors'

" Comments
Plug 'tomtom/tcomment_vim'

" FZF
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" FZF-notational
Plug 'alok/notational-fzf-vim'

" Leader-Guide (similar to spacemacs) 
Plug 'liuchengxu/vim-which-key'

" Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

" NERDTree
Plug 'scrooloose/nerdtree'

" Colorscheme
Plug 'haishanh/night-owl.vim'

" Syntax Highlighting - Javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'moll/vim-node'

" Emmet
Plug 'mattn/emmet-vim'

" Syntax checking
Plug 'w0rp/ale'

call plug#end()


" =========================================================
" colorscheme config
" =========================================================
" enable 24bit true color (If you have vim >=8.0 or Neovim >= 0.1.5)
if (has("termguicolors"))
  set termguicolors
endif

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

colorscheme night-owl

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
" Copy to global clipboard
" =========================================================
let g:clipboard = {
      \   'name': 'myClipboard',
      \   'copy': {
      \      '+': 'pbcopy',
      \      '*': 'pbcopy',
      \   },
      \   'paste': {
      \      '+': '+',
      \      '*': '*',
      \   },
      \   'cache_enabled': 1,
      \ }

set clipboard+=unnamedplus,unnamed
" set clipboard+=unnamedplus

" =========================================================
" CtrlSF config
" =========================================================
nmap     <leader>sff <Plug>CtrlSFPrompt
vmap     <leader>sff <Plug>CtrlSFVwordPath
vmap     <leader>sfF <Plug>CtrlSFVwordExec
nmap     <leader>sfn <Plug>CtrlSFCwordPath
nmap     <leader>sfp <Plug>CtrlSFPwordPath
nnoremap <leader>sfo :CtrlSFOpen<CR>
nnoremap <leader>sft :CtrlSFToggle<CR>
inoremap <c-space>sft <Esc>:CtrlSFToggle<CR>

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
" vim-which-key
" =========================================================

" Check space-vim form more: https://github.com/liuchengxu/space-vim/blob/master/core/autoload/spacevim/map/leader.vim
let g:lmap =  {}

let g:lmap.b = {
      \ 'name' : '+buffer' ,
      \ '1' : ['b1'        , 'buffer-1']        ,
      \ '2' : ['b2'        , 'buffer-2']        ,
      \ '3' : ['b3'        , 'buffer-3']        ,
      \ '4' : ['b4'        , 'buffer-4']        ,
      \ '5' : ['b5'        , 'buffer-5']        ,
      \ '6' : ['b6'        , 'buffer-6']        ,
      \ '7' : ['b7'        , 'buffer-7']        ,
      \ '8' : ['b8'        , 'buffer-8']        ,
      \ '9' : ['b9'        , 'buffer-9']        ,
      \ 'd' : ['bd'        , 'delete-buffer']   ,
      \ 'f' : ['bfirst'    , 'first-buffer']    ,
      \ 'h' : ['Startify'  , 'home-buffer']     ,
      \ 'k' : ['bw'        , 'kill-buffer']     ,
      \ 'l' : ['blast'     , 'last-buffer']     ,
      \ 'n' : ['bnext'     , 'next-buffer']     ,
      \ 'p' : ['bprevious' , 'previous-buffer'] ,
      \ 'b' : ['Buffers'   , 'fzf-buffer']      ,
      \ '?' : ['Buffers'   , 'fzf-buffer']      ,
      \ }

let g:lmap.e = {
      \ 'name' : '+errors'                              ,
      \ 'n' : ['<Plug>(ale_next)'     , 'next-error']     ,
      \ 'p' : ['<Plug>(ale_previous)' , 'previous-error'] ,
      \ }

let g:lmap.f = {
      \ 'name' : '+find/files/fold' ,
      \ '0' : ['set foldlevel=0'    , '0-fold-level']                    ,
      \ '1' : ['set foldlevel=1'    , '1-fold-level']                    ,
      \ '2' : ['set foldlevel=2'    , '2-fold-level']                    ,
      \ '3' : ['set foldlevel=3'    , '3-fold-level']                    ,
      \ '4' : ['set foldlevel=4'    , '4-fold-level']                    ,
      \ '5' : ['set foldlevel=5'    , '5-fold-level']                    ,
      \ '6' : ['set foldlevel=6'    , '6-fold-level']                    ,
      \ '7' : ['set foldlevel=7'    , '7-fold-level']                    ,
      \ '8' : ['set foldlevel=8'    , '8-fold-level']                    ,
      \ '9' : ['set foldlevel=9'    , '9-fold-level']                    ,
      \ 'b' : ['BLines'             , 'fzf-find-current-buffer']         ,
      \ 'd' : ['NERDTreeFind'       , 'find-current-buffer-in-NERDTree'] ,
      \ 'f' : ['Files ~'            , 'files-in-home-direcotry']         ,
      \ 's' : ['save'               , 'save-file']                       ,
      \ 't' : ['NERDTreeToggle'     , 'toggle-NERDTree']                 ,
      \ '?' : ['Files'              , 'files-in-current-direcotry']      ,
      \ 'R' : ['source $MYVIMRC'    , 'reload-vimrc']                    ,
      \ }

let g:lmap.f.e = { 
                  \'name' : '+vimrc',
                  \'d' : ['e ~/.vim/vimrc', '.vimrc'],
                  \'v' : ['e $MYVIMRC', '$MYVIMRC'],
                  \'r' : ['so $MYVIMRC', 'sync $MYVIMRC'],
                  \'R' : ['so $MYVIMRC', 'sync $MYVIMRC'],
                  \}
let g:lmap.l = {
      \ 'name' : '+lsp'                                            ,
      \ 'a' : ['LanguageClient#textDocument_codeAction()'     , 'code-action']      ,
      \ 'c' : ['LanguageClient_contextMenu()'                 , 'context-menu']      ,
      \ 'f' : ['LanguageClient#textDocument_formatting()'     , 'formatting']       ,
      \ 'h' : ['LanguageClient#textDocument_hover()'          , 'hover']            ,
      \ 'r' : ['LanguageClient#textDocument_references()'     , 'references']       ,
      \ 'R' : ['LanguageClient#textDocument_rename()'         , 'rename']           ,
      \ 's' : ['LanguageClient#textDocument_documentSymbol()' , 'document-symbol']  ,
      \ 'S' : ['LanguageClient#workspace_symbol()'            , 'workspace-symbol'] ,
      \ 'g' : {
        \ 'name': '+goto',
        \ 'd' : ['LanguageClient#textDocument_definition()'     , 'definition']       ,
        \ 't' : ['LanguageClient#textDocument_typeDefinition()' , 'type-definition']  ,
        \ 'i' : ['LanguageClient#textDocument_implementation()'  , 'implementation']   ,
        \ },
      \ }

let g:lmap.n =  {
                \'name' : '+files',
                \'n' : ['NV', 'notes'],
                \'t' : ['NERDTreeToggle', 'NERDTree'],
                \}
let g:lmap.t = {
                \'name' : 'Tab',
                \'t' : ['tablast | tab new', 'tab new'],
                \'o' : ['SessionTabOpen', 'Session Tab Open'],
                \'c' : ['SessionTabClose', 'Session Tab Close'],
                \'s' : ['SessionTabSave', 'Session Tab Save'],
                \}

call which_key#register('<Space>', "g:lmap")
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

" Hide statusline
" autocmd! FileType which_key
" autocmd  FileType which_key set laststatus=0 noshowmode noruler
"   \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler


" =========================================================
" FZF
" =========================================================

" localleader = f

"nnoremap <C-p> :<C-u>FZF<CR>
" nnoremap <silent> <Leader>ff  :Files<CR>
" nnoremap <silent> <Leader>bb  :Buffers<CR>
nnoremap <silent> <leader>fr  :History<CR>
nnoremap <silent> <Leader>/   :BLines<CR>
nnoremap <silent> <Leader>fl  :BLines<CR>

" [Tags] Command to generate tags file
" let g:fzf_tags_command = 'ctags -R'

" nnoremap <silent> <Leader><Leader> :Files<CR>
" nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <silent> <Leader>fc        :Colors<CR>
nnoremap <silent> <Leader>fC        :Commands<CR>
nnoremap <silent> <Leader>pg        :Tags<CR>

" nnoremap <silent> <Leader>/         :Lines<CR>
" nnoremap <silent> <Leader>/         :Ag<CR>
nnoremap <silent> <Leader>sp        :Ag<CR>

" nnoremap <silent> <Leader>*         :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>sP        :Ag <C-R><C-W><CR>

nnoremap <silent> <Leader>sW        :Ag <C-R><C-A><CR>
xnoremap <silent> <Leader>sP        y:Ag <C-R>"<CR>

nnoremap <silent> <Leader>fm        :Marks<CR>
nnoremap <silent> <Leader>fM        :Maps<CR>
nnoremap <silent> <Leader>fM        :Maps<CR>

nnoremap <silent> <leader>f: :History:<CR>
nnoremap <silent> <leader>f/ :History/<CR>

" =========================================================
" FZF - notational
" =========================================================
" -   `c-x`: Use search string as filename and open in vertical split.
" -   `c-v`: Open in vertical split
" -   `c-s`: Open in horizontal split
" -   `c-t`: Open in new tab
" -   `<Enter>`: Open highlighted search result in current buffer
let g:nv_search_paths = ['~/Dropbox/Notes', 'readme.md', 'docs.md' , './notes.md']

" =========================================================
" Emmet
" =========================================================
""" default key is <C-y>
" let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}


" =========================================================
" Ale
" =========================================================
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
" let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
"
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']

let g:ale_fix_on_save = 1

" =========================================================
" Session
" =========================================================

let g:session_command_aliases = 1
let g:session_autosave = 'no'
let g:session_autoload = 'no'

" =========================================================
" move to windows keybindings
" =========================================================
" This is needed in normal vim
if !has('nvim')
  execute "set <M-h>=\<Esc>h"
  execute "set <M-j>=\<Esc>j"
  execute "set <M-k>=\<Esc>k"
  execute "set <M-l>=\<Esc>l"
  execute "set <M-s>=\<Esc>s"
end

" Insert:
inoremap <M-h> <Esc><c-w>h
inoremap <M-j> <Esc><c-w>j
inoremap <M-k> <Esc><c-w>k
inoremap <M-l> <Esc><c-w>l
inoremap <A-s> <Esc>:w<CR>
" Visual:
vnoremap <M-h> <Esc><c-w>h
vnoremap <M-j> <Esc><c-w>j
vnoremap <M-k> <Esc><c-w>k
vnoremap <M-l> <Esc><c-w>l
vnoremap <A-s> <Esc>:w<CR>
" Normal:
nnoremap <A-h> <c-w>h
nnoremap <A-j> <c-w>j
nnoremap <A-k> <c-w>k
nnoremap <A-l> <c-w>l
nnoremap <A-s> :w<CR>

if has('nvim')
  " Terminal:
  tnoremap <M-h> <c-\><c-n><c-w>h
  tnoremap <M-j> <c-\><c-n><c-w>j
  tnoremap <M-k> <c-\><c-n><c-w>k
  tnoremap <M-l> <c-\><c-n><c-w>l
  tnoremap <M-s> <c-\><c-n>:w<CR>
endif
