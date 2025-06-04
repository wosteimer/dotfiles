return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>bf",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "[F]ormat",
		},
	},
	opts = {
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
		formatters_by_ft = {
			c = { "clang_format" },
			zig = { "zigfmt" },
			python = {
				"ruff_fix",
				"ruff_organize_imports",
				"ruff_format",
			},
			go = { "goimports", "gofmt" },
			lua = { "stylua" },
			javascript = { "prettier" },
			markdown = { "prettier" },
		},
		formatters = {
			clang_format = {
				prepend_args = { "--style=file", "--fallback-style=LLVM" },
			},
		},
	},
}
