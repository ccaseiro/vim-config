local opt = vim.opt

opt.number = true
opt.relativenumber = true -- without 'number', current line is always '0'
-- opt.signcolumn = "auto:2-4" -- TODO: not working with telescope. Need to test/report
opt.signcolumn = "yes:2"

opt.hidden = true -- required to keep multiple buffers open multiple buffers
opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.fileencoding = "utf-8"
opt.mouse = "a" -- enable mouse
-- opt.guifont = "Dank\\ Mono:h11,Fira\\ Code:h12"
opt.termguicolors = true
opt.timeoutlen = 300
opt.updatetime = 300 -- Faster CursorHold events
opt.undofile = true
opt.listchars = 'eol:↲,tab:▷-,space: ,trail:·,extends:☛,precedes:☚,conceal:┊,nbsp:☠'
opt.list = true
