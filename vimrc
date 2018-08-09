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

" FZF
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Leader-Guide (similar to spacemacs) 
Plug 'hecal3/vim-leader-guide'

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
" vim-leader-guide
" =========================================================

" set up dictionary for <localleader>
let g:llmap = {}

let g:lmap =  {}

let g:lmap.f =  {
                \'name' : '+files',
                \'t' : ['NERDTreeToggle', 'NERDTree'],
                \}
let g:lmap.f.e = { 
                  \'name' : '+vimrc',
                  \'d' : ['e ~/.vim/vimrc', '.vimrc'],
                  \'v' : ['e $MYVIMRC', '$MYVIMRC'],
                  \'r' : ['so $MYVIMRC', 'sync $MYVIMRC'],
                  \'R' : ['so $MYVIMRC', 'sync $MYVIMRC'],
                  \}
let g:lmap.t = {
                \'name' : 'Tab',
                \'t' : ['tablast | tab new', 'tab new'],
                \'o' : ['SessionTabOpen', 'Session Tab Open'],
                \'c' : ['SessionTabClose', 'Session Tab Close'],
                \'s' : ['SessionTabSave', 'Session Tab Save'],
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

" =========================================================
" FZF
" =========================================================

" localleader = f

"nnoremap <C-p> :<C-u>FZF<CR>
nnoremap <silent> <Leader>ff  :Files<CR>
nnoremap <silent> <Leader>bb  :Buffers<CR>
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
" Emmet
" =========================================================
let g:user_emmet_leader_key='<Tab>'
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
" FZF
" =========================================================

let g:session_command_aliases = 1
let g:session_autosave = 'no'
let g:session_autoload = 'no'

