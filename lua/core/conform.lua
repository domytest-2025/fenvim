-- [nfnl] fnl/core/conform.fnl
local _local_1_ = require("nfnl.module")
local autoload = _local_1_.autoload
local core = autoload("nfnl.core")
local conform = require("conform")
local function setup()
  local function _2_(args)
    return conform.format({bufnr = args.buf})
  end
  vim.api.nvim_create_autocmd("BufWritePre", {pattern = "*", callback = _2_})
  local function _3_()
    local cf = require("conform")
    local function _4_(err)
      if not err then
        local function _5_()
          if vim.startswith(mode, "v") then
            return vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
          else
            return nil
          end
        end
        return __fnl_global__let_2a({mode, vim.api.nvim_get_mode().mode, mode, string.lower(mode)}, print(mode), _5_())
      else
        return print("error: ", err)
      end
    end
    return cf.format({async = true}, _4_)
  end
  return vim.keymap.set("", "<leader>fs", _3_, {desc = "Format code"})
end
return {setup = setup}
