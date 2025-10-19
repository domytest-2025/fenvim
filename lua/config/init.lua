-- [nfnl] fnl/config/init.fnl
local _local_1_ = require("nfnl.module")
local autoload = _local_1_.autoload
local core = autoload("nfnl.core")
do
  local options = {expandtab = true, tabstop = 2, shiftwidth = 2, softtabstop = 2, completeopt = "menuone,noselect", ignorecase = true, smartcase = true, clipboard = "unnamedplus", ruler = true, signcolumn = "number"}
  for option, value in pairs(options) do
    core.assoc(vim.o, option, value)
  end
end
do
  local cfgs = {"keymaps", "floaterm", "conform"}
  for _, cfg in ipairs(cfgs) do
    local c = require(("config" .. "/" .. cfg))
    c.setup()
  end
end
return {}
