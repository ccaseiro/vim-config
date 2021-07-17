local nnoremap = require'cc.utils'.nnoremap
require("twilight").setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}
nnoremap('<leader>tt', ':Twilight<cr>')
