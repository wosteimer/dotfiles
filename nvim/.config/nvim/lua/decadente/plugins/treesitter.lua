return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	main = "nvim-treesitter.configs",
	opts = {
		auto_install = true,
		indent = { enable = true },
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
	},
}
