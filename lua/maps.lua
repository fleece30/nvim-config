vim.g.mapleader = " "

local function map(mode, op, ob)
	vim.keymap.set(mode, op, ob, { silent = true })
end

-- Neotree
map("n", "<C-n>", "<CMD>Neotree toggle<CR>")
