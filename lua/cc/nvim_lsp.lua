local nvim_lsp = require('lspconfig')
-- local diagnostic = require('diagnostic')

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

  -- Use LSP as the handler for omnifunc.
  --    See `:help omnifunc` and `:help ins-completion` for more information.
  vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- diagnostic.on_attach();

end


nvim_lsp.pyls_ms.setup({
  root_dir = nvim_lsp.util.root_pattern('.git'),
  on_attach = custom_attach
})

nvim_lsp.rust_analyzer.setup({ on_attach = custom_attach })

nvim_lsp.sumneko_lua.setup({ on_attach = custom_attach })

nvim_lsp.vimls.setup({ on_attach = custom_attach })

-- nvim_lsp.omnisharp.setup({ on_attach = require'diagnostic'.on_attach })
-- nvim_lsp.omnisharp.setup({ on_attach = custom_attach })

nvim_lsp.yamlls.setup({
  settings = {
    yaml = {
      schemas = {
        kubernetes = "/*.yaml"
      }
    }
  },
  on_attach = custom_attach
})

nvim_lsp.dockerls.setup({
    cmd = { "docker-langserver", "--stdio" },
    filetypes = { "Dockerfile", "dockerfile" },
    -- root_dir = root_pattern("Dockerfile"),
  root_dir = nvim_lsp.util.root_pattern('Dockerfile'),
  on_attach = custom_attach
})

vim.g.diagnostic_enable_virtual_text = 1;



--
-- vim.o.completeopt = "menuone,noselect"
--
-- require'compe'.setup {
--   enabled = true;
--   autocomplete = true;
--   debug = false;
--   min_length = 1;
--   preselect = 'enable';
--   throttle_time = 80;
--   source_timeout = 200;
--   incomplete_delay = 400;
--   max_abbr_width = 100;
--   max_kind_width = 100;
--   max_menu_width = 100;
--   documentation = false;
--
--   source = {
--     path = true;
--     buffer = true;
--     calc = true;
--     vsnip = true;
--     nvim_lsp = true;
--     nvim_lua = true;
--     spell = true;
--     tags = true;
--     snippets_nvim = true;
--     treesitter = true;
--   };
-- }
--
-- local t = function(str)
--   return vim.api.nvim_replace_termcodes(str, true, true, true)
-- end
-- _G.s_tab_complete = function()
--   if vim.fn.pumvisible() == 1 then
--     return t "<C-p>"
--   elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
--     return t "<Plug>(vsnip-jump-prev)"
--   else
--     return t "<S-Tab>"
--   end
-- end
--
-- vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
