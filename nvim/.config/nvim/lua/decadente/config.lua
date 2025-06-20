vim.opt.clipboard = "unnamedplus"
vim.opt.guicursor = ""
vim.opt.conceallevel = 2
vim.opt.colorcolumn = "84"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = false
vim.opt.wrap = false

vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.completeopt = "menu,menuone,noinsert"

vim.opt.termguicolors = true
vim.opt.showmode = false

vim.opt.spell = false
vim.opt.spelllang = { "pt_br", "en_us" }

vim.opt.swapfile = false
--
-- Auto enable spell checking in markdown files
local spell_group = vim.api.nvim_create_augroup("spell", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "*.md" },
	group = spell_group,
	callback = function()
		vim.opt.spell = true
	end,
})
vim.api.nvim_create_autocmd({ "BufLeave" }, {
	pattern = { "*.md" },
	group = spell_group,
	callback = function()
		vim.opt.spell = false
	end,
})

-- Highlight when yanking text
local yank_highlight_group = vim.api.nvim_create_augroup("highlight-yank", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = yank_highlight_group,
	callback = function()
		vim.hl.on_yank()
	end,
})
