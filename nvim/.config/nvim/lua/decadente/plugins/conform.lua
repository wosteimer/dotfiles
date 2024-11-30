return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
		formatters_by_ft = {
			python = {
				"ruff_fix",
				"ruff_organize_imports",
				"ruff_format",
			},
			lua = { "stylua" },
			javascript = { "prettier" },
			markdown = { "prettier" },
		},
	},
}
