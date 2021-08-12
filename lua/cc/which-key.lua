local wk = require'cc.utils'.wk

wk.register({
  ["<leader>"] = {
    f = {
      name = "File",
      o = {'Show in file tree'},
      r = {"Open Recent File"},
      t = 'toggle file tree'
      -- n = { "<cmd>enew<cr>", "New File" },
    },
    g = {name = "Git"},
    h = {name = "Help"},
    o = {name = "Org/Wiki"},
    s = {name = "Search"},
    t = {name = "Toggle", h = "highlight"}
  }
})

