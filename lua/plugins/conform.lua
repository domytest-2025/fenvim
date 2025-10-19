-- [nfnl] fnl/plugins/conform.fnl
local function _1_()
  local conform = require("conform")
  return conform.setup({formatters_by_ft = {lua = {"stylua"}, fennel = {"fnlfmt"}, python = {"black"}, rust = {"rustfmt", {lsp_format = "fallback"}}}, format_on_save = {timeout_ms = 500, lsp_fallback = true}})
end
return {{"stevearc/conform.nvim", event = "BufWritePre", cmd = "ConformInfo", opts = _1_}}
