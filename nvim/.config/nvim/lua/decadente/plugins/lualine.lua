return {
	"nvim-lualine/lualine.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local colors = require("catppuccin.palettes").get_palette("mocha")
		local theme = {
			normal = {
				a = { bg = colors.mantle, fg = colors.blue, gui = "bold" },
				b = { bg = colors.mantle, fg = colors.blue },
				c = { bg = colors.mantle, fg = colors.text },
				y = { bg = colors.mantle, fg = colors.subtext0 },
				z = { bg = colors.mantle, fg = colors.text },
			},
			insert = {
				a = { bg = colors.mantle, fg = colors.green, gui = "bold" },
				b = { bg = colors.mantle, fg = colors.green },
				c = { bg = colors.mantle, fg = colors.text },
				y = { bg = colors.mantle, fg = colors.subtext0 },
				z = { bg = colors.mantle, fg = colors.text },
			},
			visual = {
				a = { bg = colors.mantle, fg = colors.mauve, gui = "bold" },
				b = { bg = colors.mantle, fg = colors.mauve },
				c = { bg = colors.mantle, fg = colors.text },
				y = { bg = colors.mantle, fg = colors.subtext0 },
				z = { bg = colors.mantle, fg = colors.text },
			},
			replace = {
				a = { bg = colors.mantle, fg = colors.red, gui = "bold" },
				b = { bg = colors.mantle, fg = colors.red },
				c = { bg = colors.mantle, fg = colors.text },
				y = { bg = colors.mantle, fg = colors.subtext0 },
				z = { bg = colors.mantle, fg = colors.text },
			},
			command = {
				a = { bg = colors.mantle, fg = colors.peach, gui = "bold" },
				b = { bg = colors.mantle, fg = colors.peach },
				c = { bg = colors.mantle, fg = colors.text },
				y = { bg = colors.mantle, fg = colors.subtext0 },
				z = { bg = colors.mantle, fg = colors.text },
			},
			inactive = {
				a = { bg = colors.mantle, fg = colors.overlay2, gui = "bold" },
				b = { bg = colors.mantle, fg = colors.overlay2 },
				c = { bg = colors.mantle, fg = colors.overlay2 },
				x = { bg = colors.mantle, fg = colors.overlay2 },
				z = { bg = colors.mantle, fg = colors.overlay2 },
			},
		}
		require("lualine").setup({
			options = {
				theme = theme,
				component_separators = "",
				section_separators = "",
				icons_enabled = true,
				globalstatus = true,
				ignore_focus = {
					"Trouble",
					"NvimTree",
				},
			},
			sections = {
				lualine_b = { "" },
				lualine_c = {
					{ "filename", path = 1, symbols = { modified = "", readonly = "" }, padding = 0 },
				},
				lualine_x = { "diagnostics" },
				lualine_y = { "branch", "diff" },
				lualine_z = {
					{ "progress", padding = 1 },
					{ "location", padding = 0 },
				},
			},
		})
	end,
}
