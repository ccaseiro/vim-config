local nmap = require'cc.utils'.nmap
local nnoremap = require'cc.utils'.nnoremap
local inoremap = require'cc.utils'.inoremap
local wk = require'cc.utils'.wk

vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

-- no hl
vim.api.nvim_set_keymap('n', '<Leader>ths', ':set hlsearch!<CR>', {noremap = true, silent = true})

-- explorer
vim.api.nvim_set_keymap('n', '<Leader>ft', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

-- better window movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true})
-- -- Windows manipulation
-- wk.register({["<leader>ws"] = {'<cmd>split<cr>', 'Horizontal Split'}})
-- wk.register({["<leader>wv"] = {'<cmd>vsplit<cr>', 'Vertical Split'}})
-- wk.register({["<leader>wo"] = {'<cmd>only<cr>', 'Only'}})
-- wk.register({["<leader>ww"] = {'<C-W>w', 'Cycle'}})

-- better indenting
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv=gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv=gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-j>', '<right><esc>:move .+1<CR>==i', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-k>', '<right><esc>:move .-2<CR>==i', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>j', '<esc>:move .+1<CR>==', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>k', '<esc>:move .-2<CR>==', {noremap = true, silent = true})

-- Plugin: nvim-miniyank
wk.register({["<leader>y"] = {name = 'Yank'}})
vim.api.nvim_set_keymap('n', 'p', '<Plug>(miniyank-autoput)', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', 'P', '<Plug>(miniyank-autoPut)', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>yn', '<Plug>(miniyank-cycle)', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>ye', '<Plug>(miniyank-cycleback)', {noremap = false, silent = true})

-- Buffers
-- vim.api.nvim_set_keymap('n', '<C-TAB>', ':bnext<CR>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<C-S-TAB>', ':bprev<CR>', {noremap = true, silent = true})
wk.register({["<leader>bd"] = {'<cmd>BufDel<cr>', 'delete buffer'}})
wk.register({["<leader>bk"] = {'<cmd>BufDel<cr>', 'delete buffer'}})

-- Escape
-- vim.api.nvim_set_keymap('i', 'nn', '<ESC>', { noremap = true, silent = true })

-- QuickFix
vim.api.nvim_set_keymap('n', '<leader>q/', ':Telescope quickfix<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ql', ':copen<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>qo', ':copen<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>qc', ':cclose<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>qp', ':cpred<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>qn', ':cnext<CR>', {noremap = true, silent = true})

-- Files
wk.register({["<leader>fs"] = {'<cmd>write<cr>', 'Save'}})
wk.register({["<leader>fw"] = {'<cmd>write<cr>', 'Save'}})

nmap('<leader>o<leader>w', '<Plug>VimwikiMakeDiaryNote')
nmap('<leader>o<leader>t', '<Plug>VimwikiTabMakeDiaryNote')
nmap('<leader>o<leader>y', '<Plug>VimwikiMakeYesterdayDiaryNote')
nmap('<leader>o<leader>m', '<Plug>VimwikiMakeTomorrowDiaryNote')
nmap('<leader>o<leader>e', '<Plug>VimwikiDiaryGenerateLinks')

-- Toggles
nnoremap('<leader>tn', ':set number!<cr>')
nnoremap('<leader>tr', ':set relativenumber!<cr>')
nnoremap('<leader>tc', ':set listchars&<cr>')

-- Projects
-- cd to current file's directory
wk.register({["<leader>pc"] = {'<cmd>cd %:p:h<cr>:pwd<CR>', 'CWD current'}})
-- cd to VIM config directory
wk.register({["<leader>pv"] = {'<cmd>cd ' .. vim.fn.stdpath('config') .. '<cr>:pwd<CR>', 'CWD VIM'}})

-- Find all the files in vim config
wk.register({
  ["<leader>fv"] = {
    "<cmd>lua require'telescope.builtin'.find_files{ cwd = '" .. vim.fn.stdpath('config') .. "' }<CR>",
    'FindFile in VIM'
  }
})

-- Code
wk.register({["<leader>c"] = {name = 'code'}})
wk.register({["<leader>ce"] = {'<cmd>:silent! write|source %<CR>', 'eval buffer'}})

-- Misc
nnoremap('Y', 'y$')

-- Keeping it centered
nnoremap('n', 'nzzzv')
nnoremap('N', 'Nzzzv')
nnoremap('J', 'mzJ`z')

-- Undo Breakpoints
inoremap(',', ',<C-g>u')
inoremap('.', '.<C-g>u')
inoremap('!', '!<C-g>u')
inoremap('?', '?<C-g>u')

wk.register({["<leader>nc"] = {'<cmd>:cnext<CR>', 'next quickfix'}})
wk.register({["<leader>ec"] = {'<cmd>:cprev<CR>', 'prev quickfix'}})
wk.register({["<leader>nl"] = {'<cmd>:lnext<CR>', 'next loclist'}})
wk.register({["<leader>el"] = {'<cmd>:lprev<CR>', 'prev loclist'}})
