vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>wq", ":wq<CR>")

vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

vim.keymap.set("n", "<leader>c", ":on<cr>:vsp<cr>")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<leader>'", ":nohlsearch<cr>")
vim.keymap.set("n", "<leader>nt", ":tabnew<cr>")
vim.keymap.set("n", "<leader>nt", ":tabnew<cr>")

vim.keymap.set("n", "<leader>dj", ":%!jq .<cr>")

vim.keymap.set("v", "<leader>fj", ":!fixjson --indent 2<cr>")
vim.keymap.set("n", "<leader>fj", ":%!fixjson --indent 2<cr>")

vim.keymap.set("n", "<leader>j", ":cnext<cr>")
vim.keymap.set("n", "<leader>k", ":cprev<cr>")

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("c", "<C-k>", "<Up>")
vim.keymap.set("c", "<C-j>", "<Down>")

vim.keymap.set("n", "<leader><leader>", ":source $MYVIMRC<cr>")

vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })


vim.api.nvim_set_keymap('v', '<leader>dc', ':g!/^  --data-raw/d<cr>0df\'%ld$%:%!jq .<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>dc', ':g!/^  --data-raw/d<cr>0df\'%ld$%:%!jq .<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>de',
	'0y/"{<cr>:g!/^<c-r>0/d<cr>0d/"{<cr>x$x%:%s/\\\\\\\\\\\\"/\\\\\\\\"/g<cr>:s/\\\\"/"/g<cr>:%!jq .<cr>',
	{ noremap = true })

vim.api.nvim_set_keymap('n', '<leader>dm',
	':%s/https:\\/\\/metrics-dev.grupawp.pl\\/cdp\\/v2\\//http:\\/\\/localhost:8080\\/api\\/v1\\//<cr>o  -H \'Authorization: Bearer test\' \\<esc>',
	{ noremap = true })


vim.api.nvim_set_keymap('n', '<leader>lw', ':!wsl -fix %<cr>', { noremap = true, silent = true })

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>tq", ":copen<cr>",
	{ silent = true, noremap = true }
)
