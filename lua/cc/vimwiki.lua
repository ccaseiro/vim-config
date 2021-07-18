local nmap = require'cc.utils'.nmap
local nnoremap = require'cc.utils'.nnoremap

vim.g.vimwiki_list = {{path = '~/wiki/', syntax = 'markdown', ext = '.md'}}

nmap('<leader>ow', '<Plug>VimwikiIndex')
nmap('<leader>ot', '<Plug>VimwikiTabIndex')
nmap('<leader>ou', '<Plug>VimwikiUISelect')
nmap('<leader>oi', '<Plug>VimwikiDiaryIndex')

nnoremap('<leader>oss', ':VimwikiSearch ', {silent = false})
nnoremap('<leader>ost', ':VimwikiSearchTags ', {silent = false})
