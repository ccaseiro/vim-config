local map_tele = vim.api.nvim_set_keymap
local wk = require'cc.utils'.wk

wk.register({["<leader>T"] = {'<cmd>Telescope<cr>', 'Telescope'}})
wk.register({
  ["<leader>ff"] = {':Telescope find_files<cr>', 'Find file'},
  ["<leader><leader>"] = {':Telescope find_files<cr>', 'Find file in project'},
  -- ["<leader>."] = {':Telescope find_files<cr>', 'Find file'}
  ["<leader>."] = {':Telescope file_browser<cr>', 'Find file'}
})
map_tele("n", '<leader>fr', ':Telescope oldfiles<cr>', {})
wk.register({["<leader>/"] = {':Telescope live_grep<cr>', 'Search Project'}})
wk.register({["<leader>ss"] = {':Telescope current_buffer_fuzzy_find<cr>', 'Search buffer'}})
wk.register({["<leader>su"] = {'<cmd>Telescope grep_string<cr>', 'Telescope'}})
wk.register({["<leader>s*"] = {'<cmd>Telescope grep_string<cr>', 'Telescope'}})
wk.register({
  ["<leader>bb"] = {':Telescope buffers<cr>', 'Switch buffer'},
  ["<leader>,"] = {':Telescope buffers<cr>', 'Switch buffer'}
})
map_tele("n", '<leader>h<Space>', '<cmd>Telescope help_tags<cr>', {})
