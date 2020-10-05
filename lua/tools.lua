local api = vim.api
local M = {}
function M.makeScratch()
  api.nvim_command('enew') -- equivalent to :enew
  -- vim.bo[0].buftype=nofile -- set the current buffer's (buffer 0) buftype to nofile
  -- vim.bo[0].swapfile=false
  -- vim.bo[0].bufhidden=hide
end
return M
-- this is a test with luasf as fsa fsajfjlkaslf af lasfdl asfl asl fas f as dfas f asdf asjfdasdkfj asdf asfd asdf fdfs
