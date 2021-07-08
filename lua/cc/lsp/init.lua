local lspconfig = require('lspconfig')
local wk = require'cc.utils'.wk

wk.register({["<leader>l"] = {name = 'LSP'}})
wk.register({["<leader>li"] = {'<cmd>LspInfo<cr>', 'LspInfo'}})

vim.fn.sign_define("LspDiagnosticsSignError",
                   {texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError"})
vim.fn.sign_define("LspDiagnosticsSignWarning",
                   {texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning"})
vim.fn.sign_define("LspDiagnosticsSignHint",
                   {texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint"})
vim.fn.sign_define("LspDiagnosticsSignInformation",
                   {texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation"})

local use_sagalsp = true

local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd>" .. result .. "<CR>", {noremap = true, silent = true})
end

local updated_capabilities = vim.lsp.protocol.make_client_capabilities()
updated_capabilities.textDocument.completion.completionItem.snippetSupport = true
updated_capabilities.textDocument.completion.completionItem.resolveSupport =
    {properties = {"documentation", "detail", "additionalTextEdits"}}

local custom_attach = function(client)
  local filetype = vim.api.nvim_buf_get_option(0, 'filetype')

  mapper('n', 'gd', 'lua vim.lsp.buf.definition()')
  mapper('n', 'gD', 'lua vim.lsp.buf.declaration()')
  -- mapper('n', 'gr', 'lua vim.lsp.buf.references()')
  mapper('n', 'gr', 'Telescope lsp_references')
  mapper('n', 'gi', 'lua vim.lsp.buf.implementation()')

  mapper('n', '[d', 'CCLspDiagGotoPrev')
  mapper('n', ']d', 'CCLspDiagGotoNext')
  mapper('n', '<leader>lk', 'CCLspDiagGotoPrev')
  mapper('n', '<leader>lj', 'CCLspDiagGotoNext')
  mapper('n', '<leader>lp', 'CCLspDiagGotoPrev')
  mapper('n', '<leader>ln', 'CCLspDiagGotoNext')
  mapper('n', '<leader>ll', 'CCLspDiagShowLine')

  -- mapper('n', '<leader>lf', 'lua vim.lsp.buf.formatting()')
  wk.register({["<leader>lf"] = {'<cmd>lua vim.lsp.buf.formatting()<cr>', 'Format'}})
  wk.register({["<leader>lr"] = {'<cmd>CCLspRename<cr>', 'Rename'}})
  wk.register({["<leader>la"] = {'<cmd>CCLspCodeActions<cr>', 'Code Action'}})

  if filetype ~= 'lua' then mapper('n', 'K', 'CCLspHoverDoc') end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end

  -- we can toggle 'format on save' with a global option, that we ckeck later during BufWritePre
  O = {}
  O.autoformat = true
  wk.register({
    ["<leader>tf"] = {
      '<cmd>lua O.autoformat = not O.autoformat; print("format on save = ".. (O.autoformat and "true" or "false") )<cr>',
      'format on save'
    }
  })
  vim.cmd [[autocmd BufWritePre <buffer> lua if O.autoformat then vim.lsp.buf.formatting_sync() end]]

end

-- override defaults
lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config,
                                               {on_attach = custom_attach, capabilities = updated_capabilities})

require('cc/lsp/lua')
require('cc.lsp.graphql')

-- Installation:
-- npm i -g pyright
lspconfig.pyright.setup {}

-- Install server with:
-- npm install -g typescript typescript-language-server
lspconfig.tsserver.setup {
  -- to enable debug, uncomment the next line
  -- cmd = { "typescript-language-server", "--stdio", "--log-level", "4", "--tsserver-log-file", "tmp/tsserver.out", "--tsserver-log-verbosity", "verbose" },
  on_attach = function(client)
    custom_attach(client)
    client.resolved_capabilities.document_formatting = false;
  end
}

lspconfig.yamlls.setup({settings = {yaml = {schemas = {kubernetes = "/*.yaml"}}}})

local pid = vim.fn.getpid()
-- On linux/darwin if using a release build, otherwise under scripts/OmniSharp(.Core)(.cmd)
local omnisharp_bin = "/Users/ccaseiro/Downloads/omnisharp-osx/run"
require'lspconfig'.omnisharp.setup {cmd = {omnisharp_bin, "--languageserver", "--hostPID", tostring(pid)}}

-- Install server with:
-- brew install hashicorp/tap/terraform-ls
require'lspconfig'.terraformls.setup {filetypes = {"tf", "terraform", "hcl"}}

require('cc/lsp/efm')

-- -- symbols for autocomplete
-- vim.lsp.protocol.CompletionItemKind = {
--   "   (Text) ", "   (Method)", "   (Function)", "   (Constructor)", " ﴲ  (Field)", "[] (Variable)",
--   "   (Class)", " ﰮ  (Interface)", "   (Module)", " 襁 (Property)", "   (Unit)", "   (Value)",
--   " 練 (Enum)", "   (Keyword)", "   (Snippet)", "   (Color)", "   (File)", "   (Reference)",
--   "   (Folder)", "   (EnumMember)", " ﲀ  (Constant)", " ﳤ  (Struct)", "   (Event)", "   (Operator)",
--   "   (TypeParameter)"
-- }
vim.lsp.protocol.CompletionItemKind = {
  "", " ", " ", "", "ﴲ", "[]", "", "ﰮ", "", "襁", "", "", "練", "", "", "",
  "", "", "", "", "ﲀ", "ﳤ", "", "", ""
}
-- vim.lsp.protocol.CompletionItemKind = {
--   '', -- Text
--   '', -- Method
--   '', -- Function
--   '', -- Constructor
--   '', -- Field
--   '', -- Variable
--   '', -- Class
--   'ﰮ', -- Interface
--   '', -- Module
--   '', -- Property
--   '', -- Unit
--   '', -- Value
--   '了', -- Enum
--   '', -- Keyword
--   '﬌', -- Snippet
--   '', -- Color
--   '', -- File
--   '', -- Reference
--   '', -- Folder
--   '', -- EnumMember
--   '', -- Constant
--   '', -- Struct
--   '', -- Event
--   'ﬦ', -- Operator
--   '' -- TypeParameter
-- }

