return {
	"folke/zen-mode.nvim",
	keys = {
		{
			"<leader>z",
			function()
				require("zen-mode").toggle()
			end,
			mode = "n",
			desc = "Toggle [Z]en mode",
		},
	},
	opts = {

		window = {
			backdrop = 0.95,
			width = function()
				return vim.fn.getwininfo()[1].textoff + 84
			end,
			height = 1,
			options = {
				-- signcolumn = "no", -- disable signcolumn
				-- number = false, -- disable number column
				-- relativenumber = false, -- disable relative numbers
				-- cursorline = false, -- disable cursorline
				-- cursorcolumn = false, -- disable cursor column
				-- foldcolumn = "0", -- disable fold column
				-- list = false, -- disable whitespace characters
			},
		},
		plugins = {
			tmux = { enabled = true }, -- disables the tmux statusline
		},
	},
}
