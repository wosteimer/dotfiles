vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("", " ", "<nop>")

vim.keymap.set("i", "<C-u>", "<nop>")

-- paste without replacing the content in the clipboard
vim.keymap.set("v", "<leader>p", '"_dP', { desc = "[P]aste" })

-- auto center cursor in screen when use ctrl+u/d to scroll
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- move selection up/down with shift+j/k
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "move selection up" })

-- indent with tab key in visual mode
vim.keymap.set("v", "<S-Tab>", "<gv", { desc = "unindent selection" })
vim.keymap.set("v", "<Tab>", ">gv", { desc = "indent selection" })

-- Disable arrows keys
vim.keymap.set("", "<up>", "<nop>", { noremap = true })
vim.keymap.set("", "<down>", "<nop>", { noremap = true })
vim.keymap.set("i", "<up>", "<nop>", { noremap = true })
vim.keymap.set("i", "<down>", "<nop>", { noremap = true })
vim.keymap.set("", "<left>", "<nop>", { noremap = true })
vim.keymap.set("", "<right>", "<nop>", { noremap = true })
vim.keymap.set("i", "<left>", "<nop>", { noremap = true })
vim.keymap.set("i", "<right>", "<nop>", { noremap = true })

-- Toggle file manager
-- vim.keymap.set("n", "<leader>d", function()
-- 	if vim.bo.filetype ~= "netrw" then
-- 		vim.cmd("Ex")
-- 		return
-- 	end
-- 	while vim.bo.filetype == "netrw" do
-- 		vim.cmd("bd!")
-- 	end
-- end, { desc = "toggle netrw" })

-- Toggle spell checking
vim.keymap.set("n", "<F3>", function()
	---@diagnostic disable-next-line: undefined-field
	vim.opt.spell = not (vim.opt.spell:get())
end, { desc = "toggle spell checking" })
