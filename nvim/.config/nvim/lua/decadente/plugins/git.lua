return {
	{
		"tpope/vim-fugitive",
		keys = {
			{
				"<leader>gf",
				"<cmd>Git<cr>",
				mode = "n",
				desc = "Open [F]ugitive",
			},
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {},
		event = { "BufReadPre", "BufNewFile" },
		cmd = { "Gitsigns" },
		keys = {
			{
				"<leader>gd",
				function()
					require("gitsigns").diffthis()
				end,
				mode = "n",
				desc = "[D]iff file",
			},
			{
				"<leader>gs",
				function()
					require("gitsigns").stage_hunk()
				end,
				mode = "n",
				desc = "Toggle [S]tage hunk",
			},
			{
				"<leader>gr",
				function()
					require("gitsigns").reset_hunk()
				end,
				mode = "n",
				desc = "reset hunk",
			},
			{
				"<leader>gp",
				function()
					require("gitsigns").preview_hunk()
				end,
				mode = "n",
				desc = "[P]review hunk",
			},
			{
				"<leader>gb",
				function()
					require("gitsigns").toggle_current_line_blame()
				end,
				mode = "n",
				desc = "Toggle current line [B]lame",
			},
			{
				"[g",
				function()
					require("gitsigns").nav_hunk("prev")
				end,
				mode = "n",
				desc = "Go previous git hunk",
			},
			{
				"]g",
				function()
					require("gitsigns").nav_hunk("next")
				end,
				mode = "n",
				desc = "Go next git hunk",
			},
		},
	},
}
