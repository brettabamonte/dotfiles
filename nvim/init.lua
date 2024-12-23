-- disable netrw at the very start of your init.lua so I can use other file nav plugin
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Update vim leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Bootstrap lazy.nvim
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

require("config")

---- Configure lazy to install plugins from `./lua/plugins`.
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
})
