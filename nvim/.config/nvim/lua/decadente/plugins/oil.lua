return {
	"stevearc/oil.nvim",
	lazy = false,
	opts = {
		default_file_explorer = true,
		keymaps = { ["<C-q>"] = "actions.close" },
	},
	keys = { { "-", "<CMD>Oil<CR>", mode = "n", desc = "Open parent directory", silent = true } },
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}
