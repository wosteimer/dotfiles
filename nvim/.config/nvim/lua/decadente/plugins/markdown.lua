require("render-markdown").setup({
	file_types = { "markdown", "vimwiki" },
	completions = { lsp = { enabled = true } },
})
