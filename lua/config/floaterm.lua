-- [nfnl] fnl/config/floaterm.fnl
local _local_1_ = require("nfnl.module")
local autoload = _local_1_.autoload
local core = autoload("nfnl.core")
local function setup()
  vim.g.floaterm_width = 0.8
  vim.g.floaterm_height = 0.8
  vim.g.floaterm_keymap_toggle = "<C-\\>"
  return nil
end
return {setup = setup}
