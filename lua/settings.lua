vim.wo.number = true
-- vim.wo.signcolumn = "auto:2-4" -- TODO: not working with telescope. Need to test/report
vim.wo.signcolumn = "yes:2"

vim.o.hidden=true               -- required to keep multiple buffers open multiple buffers
vim.o.clipboard = "unnamedplus"
vim.o.cursorline = true
vim.o.mouse = "a" 		-- enable mouse
-- vim.o.guifont = "Dank\\ Mono:h11,Fira\\ Code:h12"
vim.o.termguicolors = true
vim.bo.undofile = true -- if I only use "o", then first buffer gets "noundofile"
vim.o.undofile = true -- if I only put "bo", then only first buffer gets undo.
