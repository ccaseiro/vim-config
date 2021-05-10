local map_tele = vim.api.nvim_set_keymap

map_tele("n", '<leader>ff', ':Telescope find_files<cr>', {})
map_tele("n", '<leader>ss', ':Telescope live_grep<cr>', {})
map_tele("n", '<leader>bb', '<cmd>Telescope buffers<cr>', {})
map_tele("n", '<leader>h<Space>', '<cmd>Telescope help_tags<cr>', {})

