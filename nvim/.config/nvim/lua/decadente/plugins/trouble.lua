return {
	"folke/trouble.nvim",
	opts = {}, -- for default options, refer to the configuration section for custom setup.
	cmd = "Trouble",
	keys = {
		{
			"<leader>tw",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "[W]orspace Diagnostics",
		},
		{
			"<leader>tb",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "[B]uffer Diagnostics",
		},
		{
			"<leader>ts",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "[S]ymbols",
		},
		{
			"<leader>td",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "LSP [D]efinitions / references / ...",
		},
	},
}
