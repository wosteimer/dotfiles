vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Paste without replacing the content in the clipboard
vim.keymap.set("v", "<leader>p", '"_dP', { desc = "[P]aste" })

-- Auto center cursor in screen when use ctrl+u/d to scroll
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Move selection up/down with shift+j/k
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "move selection up" })

-- Indent with tab key in visual mode
vim.keymap.set("v", "<S-Tab>", "<gv", { desc = "unindent selection" })
vim.keymap.set("v", "<Tab>", ">gv", { desc = "indent selection" })

-- Disable arrows keys
vim.keymap.set({ "n", "i", "v" }, "<up>", "<nop>", { noremap = true })
vim.keymap.set({ "n", "i", "v" }, "<down>", "<nop>", { noremap = true })
vim.keymap.set({ "n", "i", "v" }, "<left>", "<nop>", { noremap = true })
vim.keymap.set({ "n", "i", "v" }, "<right>", "<nop>", { noremap = true })

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "-", ":Ex<CR>", { silent = true, desc = "Open netrw" })

-- Toggle spell checking
vim.keymap.set("n", "<F3>", function()
	---@diagnostic disable-next-line: undefined-field
	vim.opt.spell = not (vim.opt.spell:get())
end, { desc = "toggle spell checking" })
