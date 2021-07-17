local nnoremap = require'cc.utils'.nnoremap

require'qf_helper'.setup()

nnoremap('<leader>tq', '<cmd>LLToggle!<cr>')
nnoremap('<leader>tl', '<cmd>LLToggle!<cr>')
nnoremap('<C-n>', '<cmd>QNext!<cr>')
nnoremap('<C-e>', '<cmd>QPrev!<cr>')

