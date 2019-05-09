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

" Autocomplete
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'lifepillar/vim-mucomplete'

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

" Auto close bracket / parenthises
Plug 'jiangmiao/auto-pairs'

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
Plug 'jparise/vim-graphql'
Plug 'AndrewRadev/tagalong.vim'

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

" Required for operations modifying multiple buffers like rename.
set hidden

" relativenumber
set number relativenumber

" lower the delay, because we are using <space> as leader
set timeoutlen=400
set ttimeoutlen=0

" highlight all search matches
set hlsearch

" font
set guifont=Dank\ Mono:h12,Fira\ Code:h12

" Saving marks and jumps
set viminfo='100,f1

" auto reload
set autoread
au FocusGained * :checktime
"au CursorHold * checktime

" autocomplete
" let g:deoplete#enable_at_startup = 1

" deoplete tab-complete
" set completeopt=menuone,longest,preview,noinsert
" set completeopt=menuone,noinsert

" inoremap <expr> <TAB> pumvisible() ? "\<C-y><tab>" : "\<tab>"
" inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"
" inoremap <expr> <C-j> pumvisible() ? "\<Down>" : "\<C-j>"
" inoremap <expr> <C-k> pumvisible() ? "\<Up>" : "\<C-k>"


" inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" inoremap <silent><expr><tab> pumvisible() ? "\<c-y>" : "\<tab>"

"
" mucomplete
" Some configuration is in 'after/plugin/mucomplete.vim'
set completeopt=menuone,noinsert
let g:mucomplete#enable_auto_at_startup = 1
"
let g:mucomplete#chains = {}
let g:mucomplete#chains.default  = ['path', 'omni', 'ulti', 'keyn', 'dict', 'uspl']


" Snipets
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" Change to F5 to use Tab with mucomplete
let g:UltiSnipsExpandTrigger="<F5>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-l>"

" Mouse
set mouse=a

" Window sizing
set winheight=20
set winminheight=0

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
" noremap! <c-n> <Down>
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
let g:lmap =  {
      \ "'" : ['below 20sp term://$SHELL | startinsert',   'Terminal']  ,
      \ }

let g:lmap[' '] = {
      \ 'name': '+tab' ,
      \ ' ' : ['tabn',   'Next Tab']  ,
      \ 'l' : ['tabn',   'Next Tab']  ,
      \ ']' : ['tabn',   'Next Tab']  ,
      \ '[' : ['tabp',   'Prev Tab']  ,
      \ 'h' : ['tabp',   'Prev Tab']  ,
      \ '1' : ['tabn 1', 'tab-1']  ,
      \ '2' : ['tabn 2', 'tab-2']  ,
      \ '3' : ['tabn 3', 'tab-3']  ,
      \ '4' : ['tabn 4', 'tab-4']  ,
      \ '5' : ['tabn 5', 'tab-5']  ,
      \ '6' : ['tabn 6', 'tab-6']  ,
      \ '7' : ['tabn 7', 'tab-7']  ,
      \ '8' : ['tabn 8', 'tab-8']  ,
      \ '9' : ['tabn 9', 'tab-9']  ,
      \ }

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
      \ '~' : ['Files ~'            , 'files-in-home-direcotry']         ,
      \ 's' : ['save'               , 'save-file']                       ,
      \ 't' : ['NERDTreeToggle'     , 'toggle-NERDTree']                 ,
      \ 'f' : ['Files'              , 'files-in-current-direcotry']      ,
      \ 'R' : [':source $MYVIMRC'    , 'reload-vimrc']                    ,
      \ }

let g:lmap.f.e = { 
                  \'name' : '+vimrc',
                  \'d' : [':e ~/.vim/vimrc', '.vimrc'],
                  \'v' : [':e $MYVIMRC', '$MYVIMRC'],
                  \'r' : [':so $MYVIMRC', 'sync $MYVIMRC'],
                  \'R' : [':so $MYVIMRC', 'sync $MYVIMRC'],
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
                \'v' : ['SessionView', 'Session View'],
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
" -   `c-y`: Yank the selected filenames
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
set signcolumn=yes
" let g:ale_sign_column_always=1 " always show sign column
" let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
"
let g:ale_fixers = {}
let g:ale_fixers['graphql'] = ['prettier']
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['json'] = ['prettier']
let g:ale_fixers['markdown'] = ['prettier']

let g:ale_fix_on_save = 1

" =========================================================
" Session
" =========================================================

let g:session_command_aliases = 1
let g:session_autosave = 'no'
let g:session_autoload = 'no'

" =========================================================
" External re-mappins (karabiner and iTerm)
" =========================================================
" F6  - <C-i>
" F20 - <M-h>
" F21 - <M-j>
" F22 - <M-k>
" F23 - <M-l>

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
inoremap <F20> <Esc><c-w>h
inoremap <F21> <Esc><c-w>j
inoremap <F22> <Esc><c-w>k
inoremap <F23> <Esc><c-w>l
inoremap <A-s> <Esc>:w<CR>
" Visual:
vnoremap <F20> <Esc><c-w>h
vnoremap <F21> <Esc><c-w>j
vnoremap <F22> <Esc><c-w>k
vnoremap <F23> <Esc><c-w>l
vnoremap <A-s> <Esc>:w<CR>
" Normal:
nnoremap <F20> <c-w>h
nnoremap <F21> <c-w>j
nnoremap <F22> <c-w>k
nnoremap <F23> <c-w>l
nnoremap <A-s> :w<CR>

if has('nvim')
  " Terminal:
  tnoremap <F20> <c-\><c-n><c-w>h
  tnoremap <F21> <c-\><c-n><c-w>j
  tnoremap <F22> <c-\><c-n><c-w>k
  tnoremap <F23> <c-\><c-n><c-w>l
  tnoremap <A-s> <c-\><c-n>:w<CR>
endif

" =========================================================
" Tricks
" =========================================================
" write file with sudo
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" move lines (keep identation / visual selection)
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Relying on Karabiner-Elements to avoid collision between <Tab> and
" <C-i> (have it send F6 instead for <C-i>).
nnoremap <F6> <C-i>

" Remapping
nnoremap Y y$

" Search down into subfolders
" Provides tab-completion for all file related tasks
set path+=**
