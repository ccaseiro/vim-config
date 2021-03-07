local nvim_lsp = require('nvim_lsp')
local diagnostic = require('diagnostic')

local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, result, {noremap = true, silent = true})
end

local custom_attach = function(client)
  -- TODO: check other features with `:h vim.lsp.buf.<TAB>`
  -- mapper('n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>')
  mapper('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  mapper('n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>')
  mapper('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  mapper('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  mapper('n', '1gD', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  mapper('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  mapper('n', 'crr', '<cmd>lua vim.lsp.buf.rename()<CR>')

  -- mapper('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
  if vim.api.nvim_buf_get_option(0, 'filetype') ~= 'vim' then
    mapper('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
  end

  mapper('i', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
  mapper('n', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')

  mapper('n', 'g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
  mapper('n', 'gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')

  diagnostic.on_attach();

end


nvim_lsp.pyls_ms.setup({
  root_dir = require'nvim_lsp'.util.root_pattern('.git'),
  on_attach = custom_attach
})

nvim_lsp.rust_analyzer.setup({ on_attach = custom_attach })

nvim_lsp.sumneko_lua.setup({ on_attach = custom_attach })

nvim_lsp.vimls.setup({ on_attach = custom_attach })

-- nvim_lsp.omnisharp.setup({ on_attach = require'diagnostic'.on_attach })
-- nvim_lsp.omnisharp.setup({ on_attach = custom_attach })

nvim_lsp.dockerls.setup({
    cmd = { "docker-langserver", "--stdio" },
    filetypes = { "Dockerfile", "dockerfile" },
    -- root_dir = root_pattern("Dockerfile"),
  root_dir = require'nvim_lsp'.util.root_pattern('Dockerfile'),
  on_attach = custom_attach
})

vim.g.diagnostic_enable_virtual_text = 1;

