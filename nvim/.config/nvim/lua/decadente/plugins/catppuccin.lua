return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			background = { -- :h background
				light = "latte",
				dark = "mocha",
			},
			custom_highlights = function(colors)
				return {
					Folded = { bg = colors.mantle, fg = colors.text },
					CursorLine = { bg = colors.base },
					CursorLineNr = { fg = colors.blue, style = { "bold" } },
					FoldColumn = { fg = colors.surface1 },
					LineNr = { fg = colors.surface1 },
				}
			end,
			transparent_background = false,
			show_end_of_buffer = true, -- show the '~' characters after the end of buffers
			term_colors = false,
			dim_inactive = {
				enabled = false,
				shade = "dark",
				percentage = 0.15,
			},
			no_italic = false, -- Force no italic
			no_bold = false, -- Force no bold
			styles = {
				comments = { "italic" },
				conditionals = { "italic" },
			},
			-- default_integrations = false,
			integrations = {
				gitsigns = true,
				telescope = true,
				mason = true,
				treesitter = true,
				blink_cmp = true,
				notify = true,
				render_markdown = true,
				-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
			},
		})

		-- setup must be called before loading
		vim.cmd.colorscheme("catppuccin")
	end,
}
