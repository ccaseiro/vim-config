if !exists('g:test#ocaml#dune#file_pattern')
  let g:test#ocaml#dune#file_pattern = '\v\.ml$'
endif

" Returns true if the given file belongs to your test runner
function! test#ocaml#dune#test_file(file) abort
  return a:file =~# g:test#ocaml#dune#file_pattern
endfunction

" Returns test runner's arguments which will run the current file and/or line
function! test#ocaml#dune#build_position(type, position) abort
  return []
endfunction

" Returns processed args (if you need to do any processing)
function! test#ocaml#dune#build_args(args) abort
  return a:args
endfunction

" Returns the executable of your test runner
function! test#ocaml#dune#executable() abort
  return 'dune runtest'
endfunction

