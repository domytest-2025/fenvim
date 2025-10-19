local lazy_path = vim.fn.stdpath("data") .. "/lazy/"
local function bootstrap(path, repo)
  local plugin_path = lazy_path .. path
  if not vim.uv.fs_stat(plugin_path) then
    print("bootstrap " .. repo .. "...")
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "--single-branch",
      "https://github.com/" .. repo .. ".git",
      plugin_path,
    })
  end
  vim.opt.rtp:prepend(plugin_path)
end

bootstrap("lazy.nvim", "folke/lazy.nvim")

vim.g.mapleader = ","
vim.g.maplocalleader = " "
vim.loader.enable()

require("lazy").setup({
  spec = {
    -- import lua/plugins/init.lua
    { import = "plugins" },
  },
  change_detection = {
    notify = false,
    enable = true,
    reload = true,
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  -- install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

bootstrap("nfnl", "Olical/nfnl")

require("nfnl").setup()
require("core.init").init()
