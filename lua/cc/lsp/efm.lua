-- Installation:
--   brew install efm-langserver
--   brew install luarocks
--   luarocks install --server=https://luarocks.org/dev luaformatter
-- lua-format configuration:
--   https://github.com/Koihik/LuaFormatter
local eslintLint = {
  lintCommand = './node_modules/.bin/eslint -f visualstudio --stdin --stdin-filename ${INPUT}',
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = {"%f(%l,%c): %tarning %m", "%f(%l,%c): %rror %m"}
}

local prettier = {formatCommand = './node_modules/.bin/prettier --stdin-filepath ${INPUT}', formatStdin = true}

local sh_shellcheck = {
  lintCommand = 'shellcheck -f gcc -x',
  lintSource = 'shellcheck',
  lintFormats = {'%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m', '%f:%l:%c: %tote: %m'}
}

local sh_shfmt = {formatCommand = 'shfmt -ci -s -bn', formatStdin = true}

require'lspconfig'.efm.setup {
  -- activate debug if/when needed
  -- cmd = {'efm-langserver', '-logfile', '/tmp/efm.log', '-loglevel', '5'},
  init_options = {documentFormatting = true},
  filetypes = {'lua', 'python', 'javascript', 'sh'},
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
      },
      python = {
        {
          -- lintCommand = "flake8 --max-line-length=119 --stdin-display-name ${INPUT} -",
          -- Instead of using "max-line-length" in lintCommand,
          -- we can configure a setup.cfg file in project root.
          -- This way we keep PEP8 defaut (length=79)
          lintCommand = "flake8 --stdin-display-name ${INPUT} -",
          lintStdin = true,
          lintFormats = {"%f:%l:%c: %m"}
        }, {formatCommand = 'yapf --quiet', formatStdin = true}, {formatCommand = 'isort --quiet -', formatStdin = true}
      },
      javascript = {eslintLint, prettier},
      sh = {sh_shellcheck, sh_shfmt}
    }
  }
}

