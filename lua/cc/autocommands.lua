local utils = require('cc/utils')

utils.define_augroups({
  _general_settings = {
    {'TextYankPost', '*', 'lua require(\'vim.highlight\').on_yank({higroup = \'Search\', timeout = 200})'},
    -- I'm using BufNewFile,BufRead instead of BufEnter, because with BufEnter I can't ovewride the option
    -- with modeline (ex. // vim: set ft=javascript:)
    {'BufNewFile,BufRead', '*.js', 'setlocal filetype=javascriptreact'}
  }
})
