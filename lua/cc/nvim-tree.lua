vim.g.nvim_tree_disable_netrw = 0 -- 1 by default, disables netrw
vim.g.nvim_tree_hijack_netrw = 0 --  by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
vim.g.nvim_tree_auto_close = 1

vim.api.nvim_set_keymap('n', '<leader>fo', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })

