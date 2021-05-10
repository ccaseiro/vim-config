local wk = require("which-key")

wk.register({
  ["<leader>"] = {
    b = { name = "Buffers" },
    f = {
      name = "File",
			-- f = { 'Find File'},
      -- f = { "<cmd>Telescope find_files<cr>", "Find File" },
      -- r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
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

