-- [nfnl] fnl/plugins/notify.fnl
local suppress = {"No information available"}
local function _1_(_, opts)
  local notify = require("notify")
  local core = require("nfnl.core")
  notify.setup(opts)
  local function _2_(msg, ...)
    local function _3_(_241)
      return (_241 == msg)
    end
    if core.some(_3_, suppress) then
      return nil
    else
      return notify(msg, ...)
    end
  end
  vim.notify = _2_
  return nil
end
local function _5_()
  return require("notify").dismiss({silent = true})
end
return {{"rcarriga/nvim-notify", opts = {stages = "static", render = "compact", fps = 1}, event = "VeryLazy", dependencies = {"Olical/nfnl"}, config = _1_, keys = {{"<leader>nd", _5_, {desc = "Dismiss notifications"}}, {"<leader>nc", "<CMD>NotificationsClear<CR>", {desc = "Clear notifications"}}, {"<leader>fn", "<CMD>Telescope notify<CR>", {desc = "Find notifications"}}}}}
