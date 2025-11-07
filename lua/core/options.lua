-- [nfnl] fnl/core/options.fnl
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local core = autoload("nfnl.core")
local function setup()
  vim.o.tags = "tags;/tags;"
  return nil
end
return {setup = setup}
