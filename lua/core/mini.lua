-- [nfnl] fnl/core/mini.fnl
local _local_1_ = require("nfnl.module")
local autoload = _local_1_.autoload
local core = autoload("nfnl.core")
local mini_align = require("mini.align")
local function setup()
  return mini_align.setup({})
end
return {setup = setup}
