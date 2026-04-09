local lsp_config_group = vim.api.nvim_create_augroup("lsp-config", { clear = true })
vim.api.nvim_create_autocmd("PackChanged", {
	group = lsp_config_group,
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "LuaSnip" and (kind == "install" or kind == "update") then
			vim.system({ "make", "install_jsregexp" }, { cwd = ev.data.path }):wait()
		end
		if name == "blink.cmp" and (kind == "install" or kind == "update") then
			vim.system({ "cargo", "build", "--release" }, { cwd = ev.data.path }):wait()
		end
		if name == "telescope-fzf-native.nvim" and (kind == "install" or kind == "update") then
			vim.system({ "make" }, { cwd = ev.data.path }):wait()
		end
	end,
})

vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/williamboman/mason.nvim",
	"https://github.com/williamboman/mason-lspconfig.nvim",
	"https://github.com/saghen/blink.cmp",
	"https://github.com/j-hui/fidget.nvim",
	{ src = "https://github.com/L3MON4D3/LuaSnip", version = vim.version.range("2.*") },
	"https://github.com/rafamadriz/friendly-snippets",
	"https://github.com/stevearc/conform.nvim",
	{ src = "https://github.com/nvim-telescope/telescope.nvim", version = "v0.2.1" },
	"https://github.com/nvim-telescope/telescope-ui-select.nvim",
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim",
})

require("fidget").setup()
vim.notify = require("fidget.notification").notify

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
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
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

require("mason").setup()
require("mason-lspconfig").setup({
	automatic_enable = true,
	ensure_installed = {
		"ts_ls",
		"html",
		"cssls",
		"lua_ls",
		"pyright",
		-- "ty",
		"ruff",
		"clangd",
		"rust_analyzer",
		"zls",
	},
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = lsp_config_group,
	callback = function(event)
		local function map(bind, fn, desc)
			vim.keymap.set("n", bind, fn, { buffer = event.buf, desc = desc })
		end
		local builtins = require("telescope.builtin")
		map("grd", builtins.lsp_definitions, "Go to [D]efinition")
		map("grD", vim.lsp.buf.declaration, "Go to [D]eclaration")
		map("grr", builtins.lsp_references, "Go to [R]eferences")
		map("gri", builtins.lsp_implementations, "Go to [I]mplemantation")
		map("grt", builtins.lsp_type_definitions, "Go to [T]ype definition")
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

require("conform").setup({
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
	formatters_by_ft = {
		c = { "clang_format" },
		zig = { "zigfmt" },
		python = {
			"ruff_fix",
			"ruff_organize_imports",
			"ruff_format",
		},
		go = { "goimports", "gofmt" },
		lua = { "stylua" },
		javascript = { "eslint", "prettier" },
		typescript = { "eslint", "prettier" },
		markdown = { "prettier" },
	},
	formatters = {
		clang_format = {
			prepend_args = { "--style=file", "--fallback-style=LLVM" },
		},
	},
})

vim.keymap.set({ "n", "v" }, "<leader>f", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "[F]ormat" })

require("luasnip.loaders.from_vscode").lazy_load()
require("blink.cmp").setup({
	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 500,
		},
		menu = {
			draw = {
				columns = {
					{ "label", "label_description", gap = 1 },
					{ "kind_icon", "kind", gap = 1 },
				},
			},
		},
	},
	keymap = {
		preset = "default",
		["<Tab>"] = {},
		["<S-Tab>"] = {},
		["<C-l>"] = { "snippet_forward", "fallback" },
		["<C-h>"] = { "snippet_backward", "fallback" },
		["<C-u>"] = { "scroll_documentation_up", "fallback" },
		["<C-d>"] = { "scroll_documentation_down", "fallback" },
	},
	appearance = {
		use_nvim_cmp_as_default = true,
		nerd_font_variant = "mono",
	},
	snippets = {
		preset = "luasnip",
	},
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
		providers = {
			lsp = { async = true },
		},
	},
	signature = { enabled = true },
})

local telescope = require("telescope")
telescope.setup({
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
		fzf = {},
	},
})
telescope.load_extension("ui-select")
telescope.load_extension("fzf")
vim.keymap.set("n", "<leader>sb", function()
	require("telescope.builtin").buffers()
end, { desc = "Search [B]uffers" })
vim.keymap.set("n", "<leader>sm", function()
	require("telescope.builtin").marks()
end, { desc = "Search [M]arks" })
vim.keymap.set("n", "<leader><leader>", function()
	require("telescope.builtin").find_files()
end, { desc = "Searh Files" })
vim.keymap.set("n", "<leader>sg", function()
	require("telescope.builtin").live_grep()
end, { desc = "Search [G]rep" })
vim.keymap.set("n", "<leader>sh", function()
	require("telescope.builtin").help_tags()
end, { desc = "Search [H]elp" })
vim.keymap.set("n", "<leader>sS", function()
	require("telescope.builtin").lsp_workspace_symbols()
end, { desc = "Search workspace [S]ymbols" })
vim.keymap.set("n", "<leader>ss", function()
	require("telescope.builtin").lsp_document_symbols()
end, { desc = "Search Document [S]ymbols" })
vim.keymap.set("n", "<leader>sw", function()
	local word = vim.fn.expand("<cword>")
	require("telescope.builtin").grep_string({ search = word })
end, { desc = "Search [W]ord" })
vim.keymap.set("n", "<leader>sW", function()
	local word = vim.fn.expand("<cWORD>")
	require("telescope.builtin").grep_string({ search = word })
end, { desc = "Search [W]ORDS" })
