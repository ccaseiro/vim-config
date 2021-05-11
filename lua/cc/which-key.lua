local wk = require("which-key")

wk.register({
  ["<leader>"] = {
    b = { name = "Buffers" },
    d = { name = "Diagnostics" },
    f = {
      name = "File",
			o = { 'Show in file tree'},
      f = { "Open File" },
      r = { "Open Recent File" },
      t = 'toggle file tree'
      -- n = { "<cmd>enew<cr>", "New File" },
    },
		g = { name = "Git"},
		h = { name = "Help"},
		s = { name = "Search"},
		t = { name = "Toggle",
			h = "highlight"
	  },
    w = { name = "Wiki"}
  },
})

