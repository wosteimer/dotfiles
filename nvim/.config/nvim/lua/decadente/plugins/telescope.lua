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
			"<leader>sb",
			function()
				require("telescope.builtin").buffers()
			end,
			mode = "n",
			desc = "Search [B]uffers",
		},
		{
			"<leader>sm",
			function()
				require("telescope.builtin").marks()
			end,
			mode = "n",
			desc = "Search [M]arks",
		},
		{
			"<leader><leader>",
			function()
				require("telescope.builtin").find_files()
			end,
			mode = "n",
			desc = "Searh Files",
		},
		{
			"<leader>sg",
			function()
				require("telescope.builtin").live_grep()
			end,
			mode = "n",
			desc = "Search [G]rep",
		},
		{
			"<leader>sh",
			function()
				require("telescope.builtin").help_tags()
			end,
			mode = "n",
			desc = "Search [H]elp",
		},
		{
			"<leader>sw",
			function()
				local word = vim.fn.expand("<cword>")
				require("telescope.builtin").grep_string({ search = word })
			end,
			mode = "n",
			desc = "Search [W]ord",
		},
		{
			"<leader>sW",
			function()
				local word = vim.fn.expand("<cWORD>")
				require("telescope.builtin").grep_string({ search = word })
			end,
			mode = "n",
			desc = "Search [W]ORDS",
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
