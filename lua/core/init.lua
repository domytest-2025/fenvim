-- [nfnl] fnl/core/init.fnl
local function toggle_diagnostic_lines()
  local _1_
  if vim.diagnostic.config().virtual_lines then
    _1_ = false
  else
    _1_ = {current_line = true}
  end
  return vim.diagnostic.config({virtual_lines = _1_})
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
  return vim.keymap.set("n", "<leader>sc", "<CMD>nohlsearch<CR>", {desc = "Clear search highlight"})
end
return {init = init}
