local wk = require'cc.utils'.wk

wk.register({
  ["<leader>"] = {
    b = {name = "Buffers", d = {'<cmd>bd<cr>', 'delete buffer'}},
    d = {name = "Diagnostics"},
    f = {
      name = "File",
      o = {'Show in file tree'},
      f = {"Open File"},
      r = {"Open Recent File"},
      t = 'toggle file tree'
      -- n = { "<cmd>enew<cr>", "New File" },
    },
    g = {name = "Git"},
    h = {name = "Help"},
    o = {name = "Org/Wiki"},
    s = {name = "Search"},
    t = {name = "Toggle", h = "highlight"},
    w = {name = "Windows", o = 'Focus current window', s = 'Horizontal Split', v = 'Vertical Split', w = 'Cycle'}
  }
})

