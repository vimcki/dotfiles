vim.opt.guicursor = ""

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 2
vim.opt.expandtab = false

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 4
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.g.mapleader = " "

vim.cmd('iabbrev ret return')

local go_group = vim.api.nvim_create_augroup("go", { clear = true })

vim.api.nvim_create_autocmd(
	"BufEnter",
	{ pattern = "*.go", command = "iabbrev fn func", group = go_group }
)

local lua_group = vim.api.nvim_create_augroup("lua", { clear = true })

vim.api.nvim_create_autocmd(
	"BufEnter",
	{ pattern = "*.lua", command = "iabbrev fn function", group = go_group }
)
