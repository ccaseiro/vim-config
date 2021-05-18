local wk = require("which-key")
wk.register({["<leader>tv"] = {'<cmd>Vista!!<cr>', 'Vista'}})
vim.cmd [[autocmd bufenter * if (winnr("$") == 1 && &filetype =~# 'vista') | q | endif]]
