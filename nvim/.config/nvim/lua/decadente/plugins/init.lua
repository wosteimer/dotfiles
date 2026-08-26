require("decadente.plugins.autocmds")

vim.api.nvim_create_user_command("PackUpdate", function(opts)
	if opts.args:match("%S") then
		local plugins = vim.split(opts.args, "%s+", { trimempty = true })
		vim.pack.update(plugins, { force = true })
	else
		vim.pack.update(nil, { force = true })
	end
end, { nargs = "*", desc = "Update all plugins or specific ones" })

vim.pack.add({
	-- dependencies
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-lua/plenary.nvim",
	-- tmux-navigator
	"https://github.com/christoomey/vim-tmux-navigator",
	-- catppuccin
	{ src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
	-- lsp
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/williamboman/mason.nvim",
	"https://github.com/williamboman/mason-lspconfig.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
	"https://github.com/saghen/blink.lib",
	"https://github.com/saghen/blink.cmp",
	"https://github.com/j-hui/fidget.nvim",
	{ src = "https://github.com/L3MON4D3/LuaSnip", version = vim.version.range("2.*") },
	"https://github.com/rafamadriz/friendly-snippets",
	"https://github.com/stevearc/conform.nvim",
	-- telescope
	{ src = "https://github.com/nvim-telescope/telescope.nvim", version = "v0.2.1" },
	"https://github.com/nvim-telescope/telescope-ui-select.nvim",
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim",
	-- oil
	"https://github.com/stevearc/oil.nvim",
	-- dap
	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/rcarriga/nvim-dap-ui",
	"https://github.com/nvim-neotest/nvim-nio",
	"https://github.com/theHamsta/nvim-dap-virtual-text",
	-- git
	"https://github.com/tpope/vim-fugitive",
	"https://github.com/lewis6991/gitsigns.nvim",
	-- harpoon
	{ src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
	-- lualine
	"https://github.com/nvim-lualine/lualine.nvim",
	-- treesitter
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	-- markdown
	"https://github.com/MeanderingProgrammer/render-markdown.nvim",
	-- mini
	"https://github.com/echasnovski/mini.ai",
	"https://github.com/echasnovski/mini.surround",
	"https://github.com/echasnovski/mini.pairs",
	-- todo-comments
	"https://github.com/folke/todo-comments.nvim",
	-- trouble
	"https://github.com/folke/trouble.nvim",
	-- which-key
	"https://github.com/folke/which-key.nvim",
	-- zen
	"https://github.com/folke/zen-mode.nvim",
})

require("decadente.plugins.catppuccin")
require("decadente.plugins.lsp")
require("decadente.plugins.oil")
require("decadente.plugins.dap")
require("decadente.plugins.git")
require("decadente.plugins.harpoon")
require("decadente.plugins.lualine")
require("decadente.plugins.markdown")
require("decadente.plugins.mini")
require("decadente.plugins.todo-comments")
require("decadente.plugins.trouble")
require("decadente.plugins.which-key")
require("decadente.plugins.zen")
