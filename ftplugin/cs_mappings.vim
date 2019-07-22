" Show type information automatically when the cursor stops moving
" autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

" The following commands are contextual, based on the cursor position.
nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
nnoremap <buffer> <Leader>li :OmniSharpFindImplementations<CR>
nnoremap <buffer> <Leader>ls :OmniSharpFindSymbol<CR>

" nnoremap <buffer> <Leader>lu :OmniSharpFindUsages<CR>
nnoremap <buffer> gu :OmniSharpFindUsages<CR>

" Finds members in the current buffer
nnoremap <buffer> <Leader>lm :OmniSharpFindMembers<CR>

nnoremap <buffer> <Leader>lx :OmniSharpFixUsings<CR>

" nnoremap <buffer> <Leader>lt :OmniSharpTypeLookup<CR>
nnoremap <buffer> gh :OmniSharpTypeLookup<CR>

nnoremap <buffer> <Leader>ld :OmniSharpDocumentation<CR>
nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

" Navigate up and down by method/property/field
nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>

" Find all code errors/warnings for the current solution and populate the quickfix window
nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
autocmd BufWritePre <buffer> call OmniSharp#CodeFormat()
" autocmd BufWritePre <buffer> :normal gg=G

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <LocalLeader>ll :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <LocalLeader>ll :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>

" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

nnoremap <Leader>lf :OmniSharpCodeFormat<CR>

" Start the omnisharp server for the current solution
" nnoremap <Leader>ss :OmniSharpStartServer<CR>
" nnoremap <Leader>sp :OmniSharpStopServer<CR>

" Enable snippet completion
" let g:OmniSharp_want_snippet=1

