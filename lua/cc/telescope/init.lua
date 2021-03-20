local map_tele = vim.api.nvim_set_keymap

map_tele("n", '<leader>ff', ':Telescope find_files<cr>', {})
map_tele("n", '<leader>fg', ':Telescope live_grep<cr>', {})
map_tele("n", '<leader>fb', '<cmd>Telescope buffers<cr>', {})
map_tele("n", '<leader>fh', '<cmd>Telescope help_tags<cr>', {})

