return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	config = function()
		local trouble = require("trouble")
		vim.keymap.set("n", "<leader>tt", function()
			trouble.toggle()
		end)
		vim.keymap.set("n", "<leader>tw", function()
			trouble.toggle("workspace_diagnostics")
		end)
		vim.keymap.set("n", "<leader>tf", function()
			trouble.toggle("document_diagnostics")
		end)
		vim.keymap.set("n", "<leader>tq", function()
			trouble.toggle("quickfix")
		end)
		vim.keymap.set("n", "<leader>tl", function()
			trouble.toggle("loclist")
		end)
		vim.keymap.set("n", "tr", function()
			trouble.toggle("lsp_references")
		end)
	end,
}
