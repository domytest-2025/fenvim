-- [nfnl] fnl/core/fterm.fnl
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local core = autoload("nfnl.core")
local fterm = require("FTerm")
local function setup()
  local function _2_()
    return require("FTerm").toggle()
  end
  vim.keymap.set("t", "<C-\\>", _2_)
  vim.g.floaterm_width = 0.8
  vim.g.floaterm_height = 0.8
  return nil
end
return {setup = setup}
