-- https://stackoverflow.com/questions/15429236/how-to-check-if-a-module-exists-in-lua
function isModuleAvailable(name)
  if package.loaded[name] then
    return true
  else
    for _, searcher in ipairs(package.searchers or package.loaders) do
      local loader = searcher(name)
      if type(loader) == 'function' then
        package.preload[name] = loader
        return true
      end
    end
    return false
  end
end


if vim.fn.exists("nolsp") == 0 then
  require("cc.nvim_lsp")
end

if isModuleAvailable('plenary.reload') then
  RELOAD = require('plenary.reload').reload_module

  R = function(name)
    RELOAD(name)
    return require(name)
  end
end

-- require('cc.completion')


-- require'nvim-treesitter.configs'.setup {
--   ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
--   highlight = {
--     enable = true,              -- false will disable the whole extension
--     -- disable = { "c", "rust" },  -- list of language that will be disabled
--   },
--   -- incremental_selection = {
--   --   enable = true,
--   --   keymaps = {
--   --     init_selection = "gnn",
--   --     node_incremental = "grn",
--   --     scope_incremental = "grc",
--   --     node_decremental = "grm",
--   --   },
--   -- },
-- }
--
