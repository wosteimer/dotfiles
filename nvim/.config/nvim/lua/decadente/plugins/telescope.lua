return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release &&\
                     cmake --build build --config Release &&\
                     cmake --install build --prefix build",
		},
	},
	cmd = { "Telescope" },
	keys = {
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files()
			end,
			mode = "",
			desc = "[F]ind [F]iles",
		},
		{
			"<leader>fg",
			function()
				require("telescope.builtin").live_grep()
			end,
			mode = "n",
			desc = "[F]ind [G]rep",
		},
		{
			"<leader>fb",
			function()
				require("telescope.builtin").buffers()
			end,
			mode = "n",
			desc = "[F]ind [B]uffers",
		},
		{
			"<leader>fh",
			function()
				require("telescope.builtin").help_tags()
			end,
			mode = "n",
			desc = "[F]ind [H]elp",
		},
		{
			"<leader>fd",
			function()
				require("telescope.builtin").diagnostics()
			end,
			mode = "n",
			desc = "[F]ind [D]iagnostics",
		},
		{
			"<leader>fs",
			function()
				require("telescope.builtin").spell_suggest()
			end,
			mode = "n",
			desc = "[F]ind [S]pell suggest",
		},
		{
			"<leader>fw",
			function()
				local word = vim.fn.expand("<cword>")
				require("telescope.builtin").grep_string({ search = word })
			end,
			mode = "n",
			desc = "[F]ind [W]ord",
		},
		{
			"<leader>fW",
			function()
				local word = vim.fn.expand("<cWORD>")
				require("telescope.builtin").grep_string({ search = word })
			end,
			mode = "n",
			desc = "[F]ind [W]ORDS",
		},
	},
	config = function()
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
	end,
}
