require("oil").setup({
	default_file_explorer = true,
	keymaps = { ["<C-q>"] = "actions.close" },
})
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory", silent = true })
