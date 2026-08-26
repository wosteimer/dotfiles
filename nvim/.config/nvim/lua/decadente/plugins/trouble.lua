require("trouble").setup({})
vim.keymap.set("n", "<leader>tw", "<cmd>Trouble diagnostics toggle<cr>", { desc = "[W]orspace Diagnostics" })
vim.keymap.set("n", "<leader>tb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "[B]uffer Diagnostics" })
vim.keymap.set("n", "<leader>ts", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "[S]ymbols" })
vim.keymap.set(
	"n",
	"<leader>td",
	"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
	{ desc = "LSP [D]efinitions / references / ..." }
)
