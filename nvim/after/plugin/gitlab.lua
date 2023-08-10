-- require("notify").setup({ background_colour = "#000000" })

local gitlab = require("gitlab")

gitlab.setup({
	port = 20136,                   -- The port of the Go server, which runs in the background
	keymaps = {
		popup = {                     -- The popup for comment creation, editing, and replying
			exit = "<Esc>",
			perform_action = "<leader>mm", -- Once in normal mode, does action
		},
		discussion_tree = {           -- The discussion tree that holds all comments
			jump_to_location = "o",
			edit_comment = "e",
			delete_comment = "dd",
			reply_to_comment = "r",
			toggle_node = "t",
		},
		dialogue = { -- The confirmation dialogue for deleting comments
			focus_next = { "j", "<Down>", "<Tab>" },
			focus_prev = { "k", "<Up>", "<S-Tab>" },
			close = { "<Esc>", "<C-c>" },
			submit = { "<CR>", "<Space>" },
		}
	}
})

vim.keymap.set("n", "<leader>ms", gitlab.summary)
vim.keymap.set("n", "<leader>ma", gitlab.approve)
vim.keymap.set("n", "<leader>mr", gitlab.revoke)
vim.keymap.set("n", "<leader>mc", gitlab.create_comment)
vim.keymap.set("n", "<leader>mg", gitlab.list_discussions)

local function starts_with(str, start)
	return str:sub(1, #start) == start
end

vim.keymap.set("n", "<leader>md", function()
	local isDiff = vim.fn.getwinvar(nil, "&diff")
	local bufName = vim.api.nvim_buf_get_name(0)
	if isDiff ~= 0 or starts_with(bufName, "diff") then
		vim.cmd.tabclose()
		vim.cmd.tabprev()
	else
		vim.cmd.DiffviewOpen("main")
	end
end)
