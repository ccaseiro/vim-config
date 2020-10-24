if !get(g:, 'loaded_denite', v:false)
  finish
endif

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
nnoremap <leader>dg :<C-u>Denite grep<CR>
nnoremap <leader>dj :<C-u>DeniteCursorWord grep<CR>

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

