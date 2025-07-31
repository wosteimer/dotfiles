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

		local lsp_config_group = vim.api.nvim_create_augroup("lsp-config", { clear = true })
		vim.api.nvim_create_autocmd("LspAttach", {
			group = lsp_config_group,
			callback = function(event)
				local function map(bind, fn, desc)
					vim.keymap.set("n", bind, fn, { buffer = event.buf, desc = desc })
				end
				map("grd", vim.lsp.buf.definition, "Go to [D]efinition")
				map("grD", vim.lsp.buf.declaration, "Go to [D]eclaration")
				map("grr", vim.lsp.buf.references, "Go to [R]eferences")
				map("gri", vim.lsp.buf.implementation, "Go to [I]mplemantation")
				map("grn", vim.lsp.buf.rename, "Re[N]ame")
				map("gra", vim.lsp.buf.code_action, "code [A]ction")
				map("K", vim.lsp.buf.hover, "[K] hover lsp")
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client == nil then
					return
				end
				if client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
					map("<leader>i", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
					end, "Toggle [I]nlay hints")
				end
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
				numhl = {
					[severity.ERROR] = "ErrorMsg",
					[severity.WARN] = "WarningMsg",
				},
			},
		})
	end,
}
