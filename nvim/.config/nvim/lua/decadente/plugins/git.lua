return {
	-- {
	--     "NeogitOrg/neogit",
	--     dependencies = {
	--         "nvim-lua/plenary.nvim", -- required
	--         "sindrets/diffview.nvim", -- optional - Diff integration
	--         "nvim-telescope/telescope.nvim", -- optional
	--     },
	--     config = true,
	-- },
	{
		"lewis6991/gitsigns.nvim",
		opts = {},
		event = { "BufReadPre", "BufNewFile" },
		cmd = { "Gitsigns" },
		keys = {
			{
				"<leader>gp",
				function()
					require("gitsigns").preview_hunk()
				end,
				mode = "n",
				desc = "[P]review hunk",
			},
			{
				"<leader>gt",
				function()
					require("gitsigns").toggle_current_line_blame()
				end,
				mode = "n",
				desc = "[T]oggle current line blame",
			},
		},
	},
}
