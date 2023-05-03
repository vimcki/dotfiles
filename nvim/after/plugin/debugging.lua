vim.keymap.set("n", "<leader>bb", ":lua require'dap'.toggle_breakpoint()<cr>")
vim.keymap.set("n", "<leader>bc", ":lua require'dap'.continue()<cr>")
vim.keymap.set("n", "<leader>bo", ":lua require'dap'.step_over()<cr>")
vim.keymap.set("n", "<leader>bi", ":lua require'dap'.step_into()<cr>")
vim.keymap.set("n", "<leader>bu", ":lua require'dap'.step_out()<cr>")
vim.keymap.set("n", "<leader>br", ":lua require'dap'.repl.open()<cr>")
vim.keymap.set("n", "<leader>bt", ":lua require'dap'.run_to_cursor()<cr>")
vim.keymap.set("n", "<leader>bs", ":lua require'dap'.disconnect()<cr>")
vim.keymap.set("n", "<leader>bl", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
vim.keymap.set("n", "<leader>bp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>")

require('dap-go').setup()
require('dapui').setup()

vim.keymap.set("n", "<leader>bz", ":lua require'dapui'.toggle()<cr>")

require('nvim-dap-virtual-text').setup()

vim.api.nvim_set_hl(0, 'debugPc', { bg = "#135065" })
vim.api.nvim_set_hl(0, 'NvimDapVirtualText', { fg = "#BEE120" })
