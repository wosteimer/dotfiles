return {
	"saghen/blink.cmp",
	event = { "CmdlineEnter", "InsertEnter" },
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			dependencies = { "rafamadriz/friendly-snippets" },
			version = "v2.*",
			build = "make install_jsregexp",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		"folke/lazydev.nvim",
	},
	version = "*",
	opts = {
		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
			},
		},
		keymap = {
			preset = "default",
			["<Tab>"] = {},
			["<S-Tab>"] = {},
			["<C-l>"] = { "snippet_forward", "fallback" },
			["<C-h>"] = { "snippet_backward", "fallback" },
		},
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		snippets = {
			preset = "luasnip",
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer", "lazydev" },
			providers = {
				lsp = { async = true },
				lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
			},
		},
		signature = { enabled = true },
	},
	opts_extend = { "sources.default" },
}
