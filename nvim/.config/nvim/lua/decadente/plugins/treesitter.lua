return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local nvim_treesitter = require("nvim-treesitter.configs")
		nvim_treesitter.setup({
			-- A list of parser names, or "all" (the five listed parsers should always be installed)
			ensure_installed = {
				"vim",
				"regex",
				"markdown_inline",
				"javascript",
				"typescript",
				"python",
				"c",
				"lua",
				"rust",
				"json",
				"html",
				"htmldjango",
				"css",
				"markdown",
				"bash",
				"gitignore",
			},

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,

			---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
			-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

			-- enable indentation
			indent = { enable = true },

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		})
		vim.treesitter.language.register("html", "htmldjango")
	end,
}
