return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"ts_ls",
				"html",
				"cssls",
				"lua_ls",
				"pyright",
				"ruff",
				"clangd",
				"rust_analyzer",
			},
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,
				["pyright"] = function()
					require("lspconfig").pyright.setup({
						capabilities = capabilities,
						settings = {
							pyright = {
								disableOrganizeImports = true,
								disableTaggedHints = true,
							},
							python = {
								analysis = {
									autoImportCompletions = true,
								},
							},
						},
					})
				end,
				["lua_ls"] = function()
					require("lspconfig").lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
							},
						},
					})
				end,
			},
		})
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(e)
				local opts = { buffer = e.buf }
				vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, opts)
				vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
			end,
		})
		vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
		vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
		vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
		vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
		vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			underline = false,
			virtual_text = { spacing = 4 },
			signs = true,
			update_in_insert = false,
		})
	end,
}
