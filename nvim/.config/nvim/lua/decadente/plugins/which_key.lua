return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		delay = 0,
		win = {
			height = { min = 4, max = 12 },
		},
		spec = {
			{ "<leader>z", icon = "" },
			{ "<leader>h", icon = "󰛢" },
			{ "<leader>j", icon = "󰛢" },
			{ "<leader>k", icon = "󰛢" },
			{ "<leader>l", icon = "󰛢" },
			{ "<leader>a", icon = "󰛢" },
			{ "<leader>m", icon = "󰛢" },
			{
				"<leader>t",
				group = "[T]rouble",
				icon = function()
					local ft = vim.bo.filetype
					return { name = ft, cat = "filetype" }
				end,
			},
			{ "<leader>f", group = "[F]ormat", icon = "" },
			{ "<leader>s", group = "[S]earch", icon = "" },
			{ "<leader><leader>", group = "Search file", icon = "" },
			{ "<leader>u", group = "Toggle [U]ndotree", mode = { "n" }, icon = "󰕌" },
			{ "<leader>g", group = "[G]it", mode = { "n", "v" }, icon = "" },
		},
		triggers = {
			{ "<auto>", mode = "nixsotc" },
			{ "s", mode = { "n", "v" } },
		},
	},
}
