-- Installation:
--   brew install efm-langserver
--   brew install luarocks
--   luarocks install --server=https://luarocks.org/dev luaformatter
-- lua-format configuration:
--   https://github.com/Koihik/LuaFormatter
require'lspconfig'.efm.setup {
  init_options = {documentFormatting = true},
  filetypes = {"lua"},
  settings = {
    rootMarkers = {".git/"},
    languages = {
      lua = {
        {
          -- formatCommand = "lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=150 --break-after-table-lb",
          -- formatCommand = "lua-format -i --no-keep-simple-function-one-line --column-limit=120",
          formatCommand = "lua-format -i --indent-width=2 --column-limit=120",
          formatStdin = true
        }
      }
    }
  }
}

