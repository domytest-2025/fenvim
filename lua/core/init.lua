-- [nfnl] fnl/core/init.fnl
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local core = autoload("nfnl.core")
local function toggle_diagnostic_lines()
  local _2_
  if vim.diagnostic.config().virtual_lines then
    _2_ = false
  else
    _2_ = {current_line = true}
  end
  return vim.diagnostic.config({virtual_lines = _2_})
end
local function toggle_diagnostic_text()
  return vim.diagnostic.config({virtual_text = not vim.diagnostic.config().virtual_text})
end
local function init()
  vim.o.exrc = true
  vim.diagnostic.config({virtual_text = true, virtual_lines = false})
  vim.keymap.set("n", "<leader>tdl", toggle_diagnostic_lines, {desc = "Toggle diagnostic virtual lines."})
  vim.keymap.set("n", "<leader>tdt", toggle_diagnostic_text, {desc = "Toggle diagnostic virtual text."})
  vim.keymap.set("i", "jk", "<esc>")
  vim.keymap.set("n", "<leader>q", "<CMD>quit<CR>", {desc = "quit"})
  vim.keymap.set("n", "\\", "<CMD>split<CR>", {desc = "split"})
  vim.keymap.set("n", "|", "<CMD>vsplit<CR>", {desc = "vsplit"})
  vim.keymap.set("n", "<leader>w", "<CMD>w<CR>", {desc = "write the buffer"})
  vim.keymap.set("n", "<leader>sc", "<CMD>nohlsearch<CR>", {desc = "Clear search highlight"})
  do
    local options = {expandtab = true, tabstop = 2, shiftwidth = 2, softtabstop = 2, completeopt = "menuone,noselect", ignorecase = true, smartcase = true, clipboard = "unnamedplus", ruler = true, signcolumn = "number"}
    for option, value in pairs(options) do
      core.assoc(vim.o, option, value)
    end
  end
  local cfgs = {"core.keymaps", "core.fterm", "core.conform", "core.options"}
  for _, cfg in ipairs(cfgs) do
    local c = require(cfg)
    c.setup()
  end
  return nil
end
return {init = init}
