return {
	'AndrewRadev/splitjoin.vim',
	lazy = false,
	keys = {
		{ "gJ", "SplitjoinJoin",  "n", noremap = true },
		{ "gS", "SplitjoinSplit", "n", noremap = true },
	},
	cmd = {
		"SplitjoinJoin",
		"SplitjoinSplit",
	},
}
