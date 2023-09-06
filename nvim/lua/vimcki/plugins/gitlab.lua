local function starts_with(str, start)
	return str:sub(1, #start) == start
end

return {
	"harrisoncramer/gitlab.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
		"sindrets/diffview.nvim",
		enabled = true,
	},
	lazy = true,
	build = function() require("gitlab.server").build() end, -- Builds the Go binary
	setup = {
		port = 21036, -- The port of the Go server, which runs in the background
		log_path = vim.fn.stdpath("cache") .. "/gitlab.nvim.log", -- Log path for the Go server
		reviewer = "delta", -- The reviewer type (only delta is currently supported)
		popup = { -- The popup for comment creation, editing, and replying
			exit = "<Esc>",
			perform_action = "<leader>mm", -- Once in normal mode, does action (like saving comment or editing description, etc)
		},
		discussion_tree = { -- The discussion tree that holds all comments
			blacklist = {}, -- List of usernames to remove from tree (bots, CI, etc)
			jump_to_file = "o", -- Jump to comment location in file
			jump_to_reviewer = "m", -- Jump to the location in the reviewer window
			edit_comment = "e", -- Edit coment
			delete_comment = "dd", -- Delete comment
			reply = "r", -- Reply to comment
			toggle_node = "t", -- Opens or closes the discussion
			toggle_resolved = "p", -- Toggles the resolved status of the discussion
			position = "left", -- "top", "right", "bottom" or "left"
			size = "20%", -- Size of split
			relative = "editor", -- Position of tree split relative to "editor" or "window"
			resolved = '✓', -- Symbol to show next to resolved discussions
			unresolved = '✖', -- Symbol to show next to unresolved discussions
		},
		review_pane = { -- Specific settings for different reviewers
			delta = {
				added_file = "", -- The symbol to show next to added files
				modified_file = "", -- The symbol to show next to modified files
				removed_file = "", -- The symbol to show next to removed files
			}
		},
		dialogue = { -- The confirmation dialogue for deleting comments
			focus_next = { "j", "<Down>", "<Tab>" },
			focus_prev = { "k", "<Up>", "<S-Tab>" },
			close = { "<Esc>", "<C-c>" },
			submit = { "<CR>", "<Space>" },
		},
	},
	keys = {
		{ "<leader>ms", "lua require('gitlab').summary",            "n" },
		{ "<leader>ma", "lua require('gitlab').approve",            "n" },
		{ "<leader>mr", "lua require('gitlab').revoke",             "n" },
		{ "<leader>mc", "lua require('gitlab').create_comment",     "n" },
		{ "<leader>mg", "lua require('gitlab').toggle_discussions", "n" },
		{ "<leader>md", "lua require('gitlab').review",             "n" }
		-- { "<leader>md", function()
		-- 	local isDiff = vim.fn.getwinvar(nil, "&diff")
		-- 	local bufName = vim.api.nvim_buf_get_name(0)
		-- 	if isDiff ~= 0 or starts_with(bufName, "diff") then
		-- 		vim.cmd.tabclose()
		-- 		vim.cmd.tabprev()
		-- 	else
		-- 		vim.cmd.DiffviewOpen("main")
		-- 	end
		-- end, "n" },
	}
}
