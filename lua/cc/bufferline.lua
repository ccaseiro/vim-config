require'bufferline'.setup()
vim.api.nvim_set_keymap('n', '<F11>', ':BufferLineCycleNext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F10>', ':BufferLineCyclePrev<CR>', {noremap = true, silent = true})
