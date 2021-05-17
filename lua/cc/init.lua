require'colorizer'.setup()
require'cc.gitsigns'
require('nvim-autopairs').setup()
require'cc.undotree'
require'cc.nvim-lightbulb'

-- Startify
vim.api.nvim_set_keymap('n', '<leader>bh', ':Startify<CR>', { noremap = true, silent = true })

