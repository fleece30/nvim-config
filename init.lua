require("vim-options")
require("maps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Disable arrow keys in all modes
local directions = { '<Up>', '<Down>', '<Left>', '<Right>' }
local modes = { 'n', 'i', 'v' }

for _, mode in ipairs(modes) do
	for _, key in ipairs(directions) do
		vim.keymap.set(mode, key, '<Nop>')
	end
end

-- Setup lazy.nvim
return require("lazy").setup("plugins")
