vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("v", "<leader>p", '"_dP')

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("v", "<S-Tab>", "<gv")
vim.keymap.set("v", "<Tab>", ">gv")

vim.keymap.set("", "<up>", "<nop>", { noremap = true })
vim.keymap.set("", "<down>", "<nop>", { noremap = true })
vim.keymap.set("i", "<up>", "<nop>", { noremap = true })
vim.keymap.set("i", "<down>", "<nop>", { noremap = true })
vim.keymap.set("", "<left>", "<nop>", { noremap = true })
vim.keymap.set("", "<right>", "<nop>", { noremap = true })
vim.keymap.set("i", "<left>", "<nop>", { noremap = true })
vim.keymap.set("i", "<right>", "<nop>", { noremap = true })

vim.keymap.set("n", "<F3>", function()
	---@diagnostic disable-next-line: undefined-field
	vim.opt.spell = not (vim.opt.spell:get())
end)
local spell_group = vim.api.nvim_create_augroup("spell", {})
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "*.md" },
	callback = function()
		vim.opt.spell = true
	end,
	group = spell_group,
})
vim.api.nvim_create_autocmd({ "BufLeave" }, {
	pattern = { "*.md" },
	callback = function()
		vim.opt.spell = false
	end,
	group = spell_group,
})
