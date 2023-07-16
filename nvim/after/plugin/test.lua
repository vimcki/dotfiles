local test = require("nvim-test")

vim.keymap.nnoremap { "<leader>tn", "<cmd>TestNearest<cr>" }
vim.keymap.nnoremap { "<leader>tt", "<cmd>TestSuite<cr>" }
