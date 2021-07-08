require 'dap'
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

local wk = require'cc.utils'.wk

vim.fn.sign_define("DapBreakpoint", {text = "", texthl = "LspDiagnosticsSignError", linehl = "", numhl = ""})

wk.register({["<leader>d"] = {name = 'debug'}})
wk.register({["<leader>db"] = {name = 'breakpoints'}})

wk.register({["<leader>dc"] = {"<cmd>lua require'dap'.continue()<cr>", 'continue'}})
wk.register({["<leader>d."] = {"<cmd>lua require'dap'.run_to_cursor()<cr>", 'run to cursor'}})
wk.register({["<leader>db"] = {"<cmd>lua require'dap'.step_back()<cr>", 'step back'}})
wk.register({["<leader>ds"] = {"<cmd>lua require'dap'.step_over()<cr>", 'step over'}})
wk.register({["<leader>di"] = {"<cmd>lua require'dap'.step_into()<cr>", 'step into'}})
wk.register({["<leader>do"] = {"<cmd>lua require'dap'.step_out()<cr>", 'step out'}})
wk.register({["<leader>dp"] = {"<cmd>lua require'dap'.pause.toggle()<cr>", 'pause'}})
wk.register({["<leader>dq"] = {"<cmd>lua require'dap'.stop()<cr>", 'quit'}})
wk.register({["<leader>dr"] = {"<cmd>lua require'dap'.repl.toggle()<cr>", 'repl'}})
wk.register({["<leader>dl"] = {"<cmd>lua require'dap'.run.last()<cr>", 'repl'}})
wk.register({["<leader>dv"] = {"<cmd>lua require('dap.ui.variables').hover()<cr>", 'variables'}})

wk.register({["<leader>dt"] = {"<cmd>lua require'dap'.toggle_breakpoint()<cr>", 'toggle'}})
wk.register({["<leader>dd"] = {"<cmd>lua require'dap'.toggle_breakpoint()<cr>", 'toggle'}})
-- wk.register({["<leader>dbb"] = {"<cmd>lua require'dap'.toggle_breakpoint()<cr>", 'toggle'}})
wk.register({
  ["<leader>dC"] = {"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", 'condition'}
})
wk.register({
  ["<leader>dL"] = {
    "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>", 'log message'
  }
})
