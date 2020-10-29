if !get(g:, 'loaded_cyclist', v:false)
  finish
endif

call cyclist#add_listchar_option_set("default", {
        \ 'eol': '↲',
        \ 'tab': '▷-',
        \ 'space': ' ',
        \ 'trail': '·',
        \ 'extends': '☛',
        \ 'precedes': '☚',
        \ 'conceal': '┊',
        \ 'nbsp': '☠'
        \ })
        " \ 'extends': '…',
        " \ 'precedes': '…',

call cyclist#add_listchar_option_set("none", {
        \ 'eol': '',
        \ 'tab': '',
        \ 'space': '',
        \ 'trail': '',
        \ 'extends': '',
        \ 'precedes': '',    
        \ 'conceal': '',
        \ 'nbsp': '',
        \ })

call cyclist#add_listchar_option_set("limited", {
        \ 'eol': '↲',
        \ 'tab': '»·',
        \ 'space': '␣',
        \ 'trail': '-',
        \ 'extends': '☛',
        \ 'precedes': '☚',
        \ 'conceal': '┊',
        \ 'nbsp': '☠',
        \ })

		

" nmap <leader>cn <Plug>CyclistNext
" nmap <leader>cp <Plug>CyclistPrev
silent! call cyclist#activate_listchars('default')
nmap <leader>cl <Plug>CyclistNext
