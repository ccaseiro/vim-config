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
Plug 'tpope/vim-fugitive'

" Autocomplete
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Denite - Fuzzy finding, buffer management
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }

" Plug 'lifepillar/vim-mucomplete'

" Print function signatures in echo area
Plug 'Shougo/echodoc.vim'

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
Plug 'airblade/vim-rooter'
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
Plug 'chriskempson/base16-vim'

" Syntax Highlighting - Javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'moll/vim-node'
Plug 'jparise/vim-graphql'
Plug 'AndrewRadev/tagalong.vim'

" Typescript
" Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
" Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Rust
Plug 'rust-lang/rust.vim'

" Swift
Plug 'toyamarinyon/vim-swift'

" Emmet
Plug 'mattn/emmet-vim'

" Syntax checking
Plug 'w0rp/ale'

" Customized vim status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git
Plug 'airblade/vim-gitgutter'

Plug 'OmniSharp/omnisharp-vim'

Plug 'Yggdroot/indentLine'
call plug#end()


" =========================================================
" colorscheme config
" =========================================================
" enable 24bit true color (If you have vim >=8.0 or Neovim >= 0.1.5)
if (has("termguicolors"))
  set termguicolors
endif

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

let base16colorspace=256  " Access colors present in 256 colorspace

" Syntax: call Base16hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
function! s:base16_customize() abort
   call Base16hi("htmlBold",    g:base16_gui0A, "", g:base16_cterm08, "", "bold", "") 
   call Base16hi("markdownBold",    g:base16_gui0A, "", g:base16_cterm08, "", "bold", "") 
   call Base16hi("markdownHeadingDelimiter",    g:base16_gui0A, "", g:base16_cterm08, "", "bold", "") 
   call Base16hi("markdownH1",    g:base16_gui0A, "", g:base16_cterm08, "", "bold", "") 
   call Base16hi("markdownH2",    g:base16_gui0A, "", g:base16_cterm08, "", "bold", "") 
   call Base16hi("htmlItalic",  g:base16_gui0E, "", g:base16_cterm0A, "", "italic", "")
   call Base16hi("markdownItalic",  g:base16_gui0E, "", g:base16_cterm0A, "", "italic", "")
   call Base16hi("htmlUnderline",  g:base16_gui0E, "", g:base16_cterm0A, "", "underline", "")
   call Base16hi("Italic",        "", "", "", "", "italic", "")
   call Base16hi("Comment",      g:base16_gui03, "", g:base16_cterm03, "", "italic", "")
endfunction

augroup on_change_colorschema
  autocmd!
  autocmd ColorScheme * call s:base16_customize()
augroup END


" colorscheme night-owl
colorscheme base16-gruvbox-dark-hard
" colorscheme base16-default-dark
" colorscheme base16-atelier-dune
"
"

" =========================================================
" General config
" =========================================================
let mapleader=' '
let maplocalleader=' '

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

" will make Vim automatically read the file again if it detects the file has 
" been changed outside of Vim
set autoread
" au FocusGained * :checktime
" "au CursorHold * checktime
autocmd FocusGained,CursorHold ?* if getcmdwintype() == '' | checktime | endif

" autocomplete
let g:deoplete#enable_at_startup = 1

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" To get correct comment highlighting in jsonc (json with comments)
autocmd FileType json syntax match Comment +\/\/.\+$+

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

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
" set completeopt=menuone,noinsert
" let g:mucomplete#enable_auto_at_startup = 1
" "
" let g:mucomplete#chains = {}
" let g:mucomplete#chains.default  = ['path', 'omni', 'ulti', 'keyn', 'dict', 'uspl']


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

set colorcolumn=80 " and give me a colored column

" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

""" Very magic by default
set ignorecase
set smartcase
" nnoremap ? ?\v
" nnoremap / /\v
" cnoremap %s/ %sm/

" =========================================================
" copy current path
" =========================================================

" copy current file name (relative/absolute) to system clipboard
if has("mac") || has("gui_macvim") || has("gui_mac")
  " relative path  (src/foo.txt)
  nnoremap <leader>yf :let @*=expand("%")<CR>

  " absolute path  (/something/src/foo.txt)
  nnoremap <leader>yF :let @*=expand("%:p")<CR>

  " filename       (foo.txt)
  nnoremap <leader>yt :let @*=expand("%:t")<CR>

  " directory name (/something/src)
  nnoremap <leader>yh :let @*=expand("%:p:h")<CR>
endif

" =========================================================
" Permanent Undo
" =========================================================
set undodir=~/.vim/undodir
set undofile

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

let g:lmap.y = {
      \ 'name' : '+yank',
      \ 'f' : 'relative path',
      \ 'F' : 'absolute path',
      \ 't' : 'filename',
      \ 'h' : 'directory name',
      \ }

" let g:lmap.e = {
"       \ 'name' : '+errors'                              ,
"       \ 'n' : ['<Plug>(ale_next)'     , 'next-error']     ,
"       \ 'p' : ['<Plug>(ale_previous)' , 'previous-error'] ,
"       \ }
"
nnoremap <leader>ee :e <C-R>=expand("%:p:h") . "/" <CR><Paste>

let g:lmap.f = {
      \ 'name' : '+find/files/fold' ,
      \ '0' : [':set foldlevel=0'    , '0-fold-level']                    ,
      \ '1' : [':set foldlevel=1'    , '1-fold-level']                    ,
      \ '2' : [':set foldlevel=2'    , '2-fold-level']                    ,
      \ '3' : [':set foldlevel=3'    , '3-fold-level']                    ,
      \ '4' : [':set foldlevel=4'    , '4-fold-level']                    ,
      \ '5' : [':set foldlevel=5'    , '5-fold-level']                    ,
      \ '6' : [':set foldlevel=6'    , '6-fold-level']                    ,
      \ '7' : [':set foldlevel=7'    , '7-fold-level']                    ,
      \ '8' : [':set foldlevel=8'    , '8-fold-level']                    ,
      \ '9' : [':set foldlevel=9'    , '9-fold-level']                    ,
      \ 'b' : ['BLines'             , 'fzf-find-current-buffer']         ,
      \ 'd' : ['NERDTreeFind'       , 'find-current-buffer-in-NERDTree'] ,
      \ '~' : [':Files ~'           , 'files-in-home-direcotry']         ,
      \ 's' : ['write'               , 'save-file']                       ,
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
      \ 'name' : '+lsp',
      \ 'f' : ['spacevim#lang#util#Format()'          , 'formatting']       ,
      \ 'r' : ['spacevim#lang#util#FindReferences()'  , 'references']       ,
      \ 'R' : ['spacevim#lang#util#Rename()'          , 'rename']           ,
      \ 's' : ['spacevim#lang#util#DocumentSymbol()'  , 'document-symbol']  ,
      \ 'S' : ['spacevim#lang#util#WorkspaceSymbol()' , 'workspace-symbol'] ,
      \ 'g' : {
        \ 'name': '+goto',
        \ 'd' : ['spacevim#lang#util#Definition()'     , 'definition']      ,
        \ 't' : ['spacevim#lang#util#TypeDefinition()' , 'type-definition'] ,
        \ 'i' : ['spacevim#lang#util#Implementation()' , 'implementation']  ,
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

" let g:which_key_map['w'] = {
let g:lmap['w'] = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-W>w'     , 'other-window']          ,
      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
      \ '-' : ['<C-W>s'     , 'split-window-below']    ,
      \ '|' : ['<C-W>v'     , 'split-window-right']    ,
      \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
      \ 'J' : [':resize +5' , 'expand-window-below']   ,
      \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
      \ 'K' : [':resize -5' , 'expand-window-up']      ,
      \ '=' : ['<C-W>='     , 'balance-window']        ,
      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'     , 'split-window-right']    ,
      \ '?' : ['Windows'    , 'fzf-window']            ,
      \ }



nnoremap <leader>1 :1wincmd w<CR>
nnoremap <leader>2 :2wincmd w<CR>
nnoremap <leader>3 :3wincmd w<CR>
nnoremap <leader>4 :4wincmd w<CR>
nnoremap <leader>5 :5wincmd w<CR>
nnoremap <leader>6 :6wincmd w<CR>
let g:lmap.1 = 'which_key_ignore'
let g:lmap.2 = 'which_key_ignore'
let g:lmap.3 = 'which_key_ignore'
let g:lmap.4 = 'which_key_ignore'
let g:lmap.5 = 'which_key_ignore'
let g:lmap.6 = 'which_key_ignore'

call which_key#register('<Space>', "g:lmap")
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>


let g:lmap.d = {
      \ 'name' : '+denite' ,
      \ 'b' : 'buffers'        ,
      \ }


" Hide statusline
" autocmd! FileType which_key
" autocmd  FileType which_key set laststatus=0 noshowmode noruler
"   \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" =========================================================
" FZF
" =========================================================

" Reverse the layout to make the FZF list top-down
let $FZF_DEFAULT_OPTS='--layout=reverse'

" Using the custom window creation function
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

" Function to create the custom floating window
function! FloatingFZF()
  " creates a scratch, unlisted, new, empty, unnamed buffer
  " to be used in the floating window
  let buf = nvim_create_buf(v:false, v:true)

  " 90% of the height
  let height = float2nr(&lines * 0.9)
  " 60% of the height
  let width = float2nr(&columns * 0.6)
  " horizontal position (centralized)
  let horizontal = float2nr((&columns - width) / 2)
  " vertical position (one line down of the top)
  let vertical = 1

  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height
        \ }

  " open the new window, floating, and enter to it
  call nvim_open_win(buf, v:true, opts)
endfunction

" localleader = f

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>
" nnoremap <C-p> :<C-u>FZF<CR>
nnoremap <C-p> :Files<CR>
nnoremap <leader>; :Buffers<CR>
" <leader>, shows/hides hidden characters
nnoremap <leader>, :set invlist<cr>


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
nnoremap <silent> <Leader>ss        :Ag<CR>

nnoremap <silent> <Leader>r         :Rg<CR>

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
" Rust
" =========================================================
let g:rustfmt_autosave = 1

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
" let g:ale_sign_error = '●' " Less aggressive than the default '>>'
" let g:ale_sign_warning = '.'
" " let g:ale_sign_column_always=1 " always show sign column
" " let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
" "
" let g:ale_fixers = {}
" let g:ale_fixers['graphql'] = ['prettier']
" let g:ale_fixers['javascript'] = ['prettier']
" let g:ale_fixers['json'] = ['prettier']
" let g:ale_fixers['markdown'] = ['prettier']
"
" let g:ale_fix_on_save = 1

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

" Search down into subfolders
" Provides tab-completion for all file related tasks
set path+=**

""" airline
" Configure error/warning section to use coc.nvim
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'




" ===============================
" Coc
" ===============================
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" let g:coc_snippet_next = '<tab>'
" let g:coc_snippet_prev = '<s-tab>'

" Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [w <Plug>(coc-diagnostic-prev)
nmap <silent> ]w <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
" nnoremap <silent> gh :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')
nnoremap <silent> gh :call CocActionAsync('highlight')<CR>

" Remap for rename current word
" nmap <leader>rn <Plug>(coc-rename)
nmap <f2> <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)

" Fix autofix problem of current line
nmap <leader>cf  <Plug>(coc-fix-current)

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>ca  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>ce  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>cc  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>co  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>cj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>ck  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>cp  :<C-u>CocListResume<CR>



""" denite
call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git', '!node_modules'])

" Ripgrep command on grep source
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts',
		\ ['-i', '--vimgrep', '--no-heading'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Use ripgrep in place of "grep"
" call denite#custom#var('grep', 'command', ['rg'])

" === Denite shorcuts === "
"   ;         - Browser currently open buffers
"   <leader>t - Browse list of files in current directory
"   <leader>g - Search current directory for occurences of given term and
"   close window if no results
"   <leader>j - Search current directory for occurences of word under cursor
nmap <leader>db :Denite buffer -split=floating -winrow=1<CR>
nmap <leader>dt :Denite file/rec -split=floating -winrow=1<CR>
" nnoremap <leader>g :<C-u>Denite grep:. -no-empty<CR>
nnoremap <leader>g :<C-u>Denite grep<CR>
nnoremap <leader>j :<C-u>DeniteCursorWord grep<CR>

" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

"
" === Open ===
"
nnoremap <silent> <leader>eq  :copen<CR>
nnoremap <silent> <leader>el  :lopen<CR>
let g:lmap.e = {
      \ 'name' : '+open',
      \ 'q' : 'open-quickfix'    ,
      \ 'l' : 'open-locationlist',
      \ }

"
" === GitGutter ===
"
nmap ]g <Plug>GitGutterNextHunk
nmap [g <Plug>GitGutterPrevHunk

"
" === EchoDoc ===
"

" Or, you could use neovim's floating text feature.
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'floating'
" To use a custom highlight for the float window,
" change Pmenu to your highlight group
" highlight link EchoDocFloat Pmenu

"
" === OmniSharp ===
"


filetype indent plugin on

" Use the stdio OmniSharp-roslyn server
let g:OmniSharp_server_stdio = 1

" Set the type lookup function to use the preview window instead of echoing it
" let g:OmniSharp_typeLookupInPreview = 1

" Timeout in seconds to wait for a response from the server
let g:OmniSharp_timeout = 5


" Don't autoselect first omnicomplete option, show options even if there is only
" one (so the preview documentation is accessible). Remove 'preview' if you
" don't want to see any documentation whatsoever.
set completeopt=longest,menuone,preview

" Fetch full documentation during omnicomplete requests.
" By default, only Type/Method signatures are fetched. Full documentation can
" still be fetched when you need it with the :OmniSharpDocumentation command.
let g:omnicomplete_fetch_full_documentation = 1

" Set desired preview window height for viewing documentation.
" You might also want to look at the echodoc plugin.
" set previewheight=5


" Tell ALE to use OmniSharp for linting C# files, and no other linters.
let g:ale_linters = { 'cs': ['OmniSharp'] }

" Update symantic highlighting on BufEnter and InsertLeave
let g:OmniSharp_highlight_types = 2

" =============================================================================
" hacks
" =============================================================================

" convert rows of numbers or text (as if pasted from excel column) to a tuple
"
function! ToTupleFunction() range
  silent execute a:firstline . "," . a:lastline . "s/^/'/"
  silent execute a:firstline . "," . a:lastline . "s/$/',/"
  silent execute a:firstline . "," . a:lastline . "join"
  silent execute "normal! I("
  silent execute "normal! $xa)"
  silent execute "normal! \"*yy"
endfunction

command! -range ToTuple <line1>,<line2> call ToTupleFunction()

