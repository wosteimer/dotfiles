return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({
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
			},
		})
		vim.keymap.set("n", "<leader>f", conform.format)
	end,
}
