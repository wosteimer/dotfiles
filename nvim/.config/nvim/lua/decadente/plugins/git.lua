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
				desc = "[G]it [P]review hunk",
			},
			{
				"<leader>gt",
				function()
					require("gitsigns").toggle_current_line_blame()
				end,
				mode = "n",
				desc = "[G]it [T]oggle current line blame",
			},
		},
		config = function()
			local gitsigns = require("gitsigns")
			gitsigns.setup()
			vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk, { desc = "[G]it [P]review hunk" })
			vim.keymap.set(
				"n",
				"<leader>gt",
				gitsigns.toggle_current_line_blame,
				{ desc = "[G]it [T]oggle current line blame" }
			)
		end,
	},
}
