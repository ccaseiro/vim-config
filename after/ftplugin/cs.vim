setlocal textwidth=80
setlocal colorcolumn=+1
setlocal nowrap
setlocal foldmethod=expr
" setlocal formatoptions-=o

" let g:OmniSharp_selector_findusages = 'fzf'

nnoremap <silent> <buffer> K :OmniSharpDocumentation<CR>

nnoremap <silent> <buffer> gk :OmniSharpTypeLookup<CR>
nnoremap <silent> <buffer> <Leader>ltl :OmniSharpTypeLookup<CR>

" The following commands are contextual, based on the cursor position.
nnoremap <silent> <buffer> gd :OmniSharpGotoDefinition<CR>
nnoremap <silent> <buffer> <c-]> :OmniSharpGotoDefinition<CR>
nnoremap <silent> <buffer> <LocalLeader>gd :OmniSharpGotoDefinition<CR>

nnoremap <silent> <buffer> gi :OmniSharpFindImplementations<CR>
nnoremap <silent> <buffer> <LocalLeader>fi :OmniSharpFindImplementations<CR>

nnoremap <silent> <buffer> gr :OmniSharpFindUsages<CR>
nnoremap <silent> <buffer> <Leader>lfr :OmniSharpFindUsages<CR>

nmap <silent> <buffer> crr <Plug>(omnisharp_rename)
nmap <silent> <buffer> <Leader>lr <Plug>(omnisharp_rename)
nmap <silent> <buffer> <F2> <Plug>(omnisharp_rename)

nmap <silent> <buffer> <Leader>ca <plug>(omnisharp_code_actions)
xmap <silent> <buffer> <Leader>ca <plug>(omnisharp_code_actions)
nmap <silent> <buffer> <Leader>lca <plug>(omnisharp_code_actions)
xmap <silent> <buffer> <Leader>lca <plug>(omnisharp_code_actions)

nnoremap <silent> <buffer> <LocalLeader>pd :OmniSharpPreviewDefinition<CR>
nnoremap <silent> <buffer> <LocalLeader>pi :OmniSharpPreviewImplementation<CR>
nnoremap <silent> <buffer> <Leader>lfm :OmniSharpFindMembers<CR>
nnoremap <silent> <buffer> <LocalLeader>fs :OmniSharpFindSymbol<CR>
nnoremap <silent> <buffer> <LocalLeader>fu :OmniSharpFixUsings<CR>
nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
imap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
nnoremap <silent> <buffer> <Leader>lcc :<c-u>ccl<CR>:OmniSharpGlobalCodeCheck<CR>

nmap <silent> <buffer> <Leader>. <Plug>(omnisharp_code_action_repeat)
nmap <silent> <buffer> <Leader>l. <Plug>(omnisharp_code_action_repeat)

nmap <silent> <buffer> <Leader>= <Plug>(omnisharp_code_format)
nmap <silent> <buffer> <Leader>l= <Plug>(omnisharp_code_format)

nmap <silent> <buffer> <Leader>lsr <Plug>(omnisharp_restart_server)
nmap <silent> <buffer> <Leader>lst <Plug>(omnisharp_start_server)
nmap <silent> <buffer> <Leader>lsp <Plug>(omnisharp_stop_server)


" autocmd BufWritePre <buffer> call OmniSharp#CodeFormat()
autocmd BufWritePre <buffer> call OmniSharp#actions#format#Format()

" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

" Navigate up and down by method/property/field
" nmap <buffer> [[ <Plug>(omnisharp_navigate_up)
" nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)
" nnoremap <silent> <buffer> <C-k> :OmniSharpNavigateUp<CR>
" nnoremap <silent> <buffer> <C-j> :OmniSharpNavigateDown<CR>

nnoremap <buffer> ]m :OmniSharpNavigateDown<cr>
nnoremap <buffer> [m :OmniSharpNavigateUp<cr>
nnoremap <buffer> ]M :OmniSharpNavigateDown<cr>
nnoremap <buffer> [M :OmniSharpNavigateUp<cr>

xnoremap <buffer> ]m :OmniSharpNavigateDown<cr>
xnoremap <buffer> [m :OmniSharpNavigateUp<cr>
xnoremap <buffer> ]M :OmniSharpNavigateDown<cr>
xnoremap <buffer> [M :OmniSharpNavigateUp<cr>

onoremap <buffer> ]m :OmniSharpNavigateDown<cr>
onoremap <buffer> [m :OmniSharpNavigateUp<cr>
onoremap <buffer> ]M :OmniSharpNavigateDown<cr>
onoremap <buffer> [M :OmniSharpNavigateUp<cr>


" == Config {{{
" let g:OmniSharp_diagnostic_exclude_paths = [
"       \ 'AssemblyAttributes.cs',
"       \ ]
"
" let g:OmniSharp_want_snippet = 1
"
" autocmd CursorHold <buffer> call OmniSharp#TypeLookupWithoutDocumentation()
" }}}
" == folding {{{
setlocal foldmethod=expr
setlocal foldexpr=GetCSFold(v:lnum)

function! GetCSFold(lnum) 
  if getline(a:lnum) =~? '\v^\s*$'
    return '-1'
  endif

  let this_indent = IndentLevel(a:lnum)
  let next_indent = IndentLevel(NextNonBlankLine(a:lnum))

  if getline(a:lnum) =~? '\v\{\{\{\s*$'
    return '>' . this_indent
  endif
  if getline(a:lnum) =~? '\v\}\}\}\s*$'
    return '<' . this_indent
  endif

  if next_indent == this_indent
    return this_indent
  elseif next_indent < this_indent
    return this_indent
  elseif next_indent > this_indent
    return '>' . next_indent
  endif
endfunction

function! IndentLevel(lnum)
  return indent(a:lnum) / &shiftwidth
endfunction

function! NextNonBlankLine(lnum)
  let numlines = line('$')
  let current = a:lnum + 1

  while current <= numlines
    " if getline(current) =~? '\v^(\s|\{)*$'
    "   let current += 1
    " else
    "   return current
    " endif
    if getline(current) =~? '\v\S'
      return current
    endif
    let current += 1
  endwhile
  return -2
endfunction
" }}}
