return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", cmd = { "Mason" }, opts = {} },
		"williamboman/mason-lspconfig.nvim",
		"saghen/blink.cmp",
		--"hrsh7th/cmp-nvim-lsp",
	},
	cmd = {
		"LspLog",
		"LspInfo",
		"LspStop",
		"LspStart",
		"LspInstall",
		"LspRestart",
		"LspUninstall",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities())
		local servers = {
			zls = {
				cmd = { "/home/william/zls" },
				settings = { preferAstCheckAsChildProcess = false },
			},
			pyright = {
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
			},
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			},
		}
		--require("mason").setup()
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
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(event)
				local function map(bind, fn, desc)
					vim.keymap.set("n", bind, fn, { buffer = event.buf, desc = desc })
				end
				local builtins = require("telescope.builtin")
				map("<leader>lgd", builtins.lsp_definitions, "[D]efinitions")
				map("<leader>lgr", builtins.lsp_references, "[R]eferences")
				map("K", vim.lsp.buf.hover, "[K] hover lsp")
				map("<leader>lr", vim.lsp.buf.rename, "[R]ename")
				map("<leader>lc", vim.lsp.buf.code_action, "[C]ode action")
			end,
		})
		vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
		vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
		vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
		vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
		vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			underline = false,
			virtual_text = { spacing = 4 },
			signs = true,
			update_in_insert = false,
		})
	end,
}
