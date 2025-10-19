-- [nfnl] fnl/config/conform.fnl
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local core = autoload("nfnl.core")
local conform = require("conform")
local function setup()
  local function _2_(args)
    return conform.format({bufnr = args.buf})
  end
  return vim.api.nvim_create_autocmd("BufWritePre", {pattern = "*", callback = _2_})
end
return {setup = setup}
