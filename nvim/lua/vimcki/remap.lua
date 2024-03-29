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

vim.keymap.set("n", "<leader>tq",
	function()
		local qf_exists = false
		for _, win in pairs(vim.fn.getwininfo()) do
			if win["quickfix"] == 1 then
				qf_exists = true
			end
		end
		if qf_exists == true then
			vim.cmd "cclose"
			return
		end
		if not vim.tbl_isempty(vim.fn.getqflist()) then
			vim.cmd "copen"
		end
	end,
	{ silent = true, noremap = true }
)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "<c-f>", ":!tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>lc", "<cmd>cexpr []<CR>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Make help open to the right and close with "q"
vim.api.nvim_create_autocmd("BufWinEnter", {
	group = vim.api.nvim_create_augroup("help_window_right", {}),
	pattern = { "*.txt" },
	callback = function(opts)
		if vim.o.filetype == "help" then
			vim.cmd.wincmd("L")
			vim.keymap.set("n", "q", ":bd<cr>", { buffer = opts.buf })
		end
	end,
})

local function len(t)
	local n = 0

	for _ in pairs(t) do
		n = n + 1
	end
	return n
end

local function qf(operation)
	local quickfix_size = len(vim.fn.getqflist())
	if quickfix_size == 0 then
		return false
	end
	local ok, _ = pcall(vim.cmd, operation)
	if ok then
		vim.cmd("normal zz")
	end
	return true
end


local function next_qf()
	return qf("cnext")
end

local function prev_qf()
	return qf("cprev")
end

local function diag(move_func)
	local diag_size = len(vim.diagnostic.get(0))
	if diag_size == 0 then
		return false
	end
	move_func()
	vim.cmd("normal zz")
	return true
end

local function next_diag()
	return diag(vim.diagnostic.goto_next)
end

local function prev_diag()
	return diag(vim.diagnostic.goto_prev)
end


local function next_hunk()
	local gs = require("gitsigns")
	if vim.wo.diff then return ']c' end
	vim.schedule(function() gs.next_hunk() end)
	vim.cmd("normal zz")
end

local function prev_hunk()
	local gs = require("gitsigns")
	if vim.wo.diff then return '[c' end
	vim.schedule(function() gs.prev_hunk() end)
	vim.cmd("normal zz")
end

vim.keymap.set("n", "<C-j>", function()
	funcs = { next_qf, next_diag, next_hunk }
	for _, func in pairs(funcs) do
		if func() then
			return
		end
	end
end)

vim.keymap.set("n", "<C-k>", function()
	funcs = { prev_qf, prev_diag, prev_hunk }
	for _, func in pairs(funcs) do
		if func() then
			return
		end
	end
end)
