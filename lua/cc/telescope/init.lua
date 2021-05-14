local map_tele = vim.api.nvim_set_keymap
local wk = require("which-key")

wk.register({["<leader><leader>"] = {'<cmd>Telescope<cr>', 'Telescope'}})
map_tele("n", '<leader>ff', ':Telescope find_files<cr>', {})
map_tele("n", '<leader>fr', ':Telescope oldfiles<cr>', {})
map_tele("n", '<leader>ss', ':Telescope live_grep<cr>', {})
map_tele("n", '<leader>bb', '<cmd>Telescope buffers<cr>', {})
map_tele("n", '<leader>h<Space>', '<cmd>Telescope help_tags<cr>', {})
