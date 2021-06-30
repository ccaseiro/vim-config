local utils = {}

function utils.define_augroups(definitions) -- {{{1
  -- Create autocommand groups based on the passed definitions
  --
  -- The key will be the name of the group, and each definition
  -- within the group should have:
  --    1. Trigger
  --    2. Pattern
  --    3. Text
  -- just like how they would normally be defined from Vim itself
  for group_name, definition in pairs(definitions) do
    vim.cmd('augroup ' .. group_name)
    vim.cmd('autocmd!')

    for _, def in pairs(definition) do
      local command = table.concat(vim.tbl_flatten {'autocmd', def}, ' ')
      vim.cmd(command)
    end

    vim.cmd('augroup END')
  end
end

function utils.nnoremap(key, command) vim.api.nvim_set_keymap('n', key, command, {noremap = true, silent = true}) end

function utils.nmap(key, command) vim.api.nvim_set_keymap('n', key, command, {noremap = false, silent = true}) end

function utils.goto_next()
  -- vim.lsp.diagnostic.goto_next()
  vim.cmd('Lspsaga diagnostic_jump_next')
end
vim.cmd [[command! CCLspDiagGotoNext lua require 'cc.utils'.goto_next()]]

function utils.goto_prev()
  -- vim.lsp.diagnostic.goto_prev()
  vim.cmd('Lspsaga diagnostic_jump_prev')
end
vim.cmd [[command! CCLspDiagGotoPrev lua require 'cc.utils'.goto_prev()]]

function utils.show_line_diagnostics()
  -- vim.lsp.diagnostic.show_line_diagnostics()
  vim.cmd('Lspsaga show_line_diagnostics')
end
vim.cmd [[command! CCLspDiagShowLine lua require 'cc.utils'.show_line_diagnostics()]]

function utils.code_actions()
  -- vim.lsp.buf.code_action()
  vim.cmd('Lspsaga code_action')
end
vim.cmd [[command! CCLspCodeActions lua require 'cc.utils'.code_actions()]]

function utils.hover_doc()
  -- vim.lsp.buf.hover()
  vim.cmd('Lspsaga hover_doc')
end
vim.cmd [[command! CCLspHoverDoc lua require 'cc.utils'.hover_doc()]]

function utils.rename() vim.cmd('Lspsaga rename') end
vim.cmd [[command! CCLspRename lua require 'cc.utils'.rename()]]

-- conditionally require module (in case its not added to path)
local function prequire(...)
  local status, lib = pcall(require, ...)
  if (status) then return lib end
  return nil
end

utils.wk = {}
local wk = prequire("which-key")
function utils.wk.register(dict) return wk and wk.register(dict) end

return utils
