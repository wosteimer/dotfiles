return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", cmd = { "Mason" }, opts = {} },
		"williamboman/mason-lspconfig.nvim",
		"saghen/blink.cmp",
		{ "j-hui/fidget.nvim", opts = {} },
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
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
		vim.lsp.config("*", {
			capabilities = capabilities,
		})
		for name, server in pairs(servers) do
			server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
			-- require("lspconfig")[server_name].setup(server)
			vim.lsp.config(name, server)
		end
		--require("mason").setup()
		require("mason-lspconfig").setup({
			automatic_enable = true,
			ensure_installed = {
				"ts_ls",
				"html",
				"cssls",
				"lua_ls",
				"pyright",
				"ruff",
				"clangd",
				"rust_analyzer",
				"zls",
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
		local severity = vim.diagnostic.severity
		vim.diagnostic.config({
			virtual_text = true,
			signs = {
				text = {
					[severity.ERROR] = "",
					[severity.WARN] = "",
					[severity.INFO] = "",
					[severity.HINT] = "",
				},
			},
		})
	end,
}
