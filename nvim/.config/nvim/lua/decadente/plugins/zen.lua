return {
	"folke/zen-mode.nvim",
	cmd = "ZenMode",
	keys = {
		{
			"<leader>z",
			function()
				require("zen-mode").toggle()
			end,
			desc = "[Z]en mode",
		},
	},
	opts = {
		window = {
			width = 90,
		},
		plugins = {
			options = {
				laststatus = 1, -- turn off the statusline in zen mode
			},
			tmux = { enabled = true },
		},
	},
}
