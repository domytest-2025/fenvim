-- [nfnl] fnl/core/keymaps.fnl
local _local_1_ = require("nfnl.module")
local autoload = _local_1_.autoload
local core = autoload("nfnl.core")
local NS = {noremap = true, silent = false}
local telescope = require("telescope.builtin")
local function get_visual_selection()
  local _let_2_ = vim.api.nvim_buf_get_mark(0, "<")
  local sline = _let_2_[1]
  local scol = _let_2_[2]
  local _let_3_ = vim.api.nvim_buf_get_mark(0, ">")
  local eline = _let_3_[1]
  local ecol = _let_3_[2]
  local lines = vim.api.nvim_buf_get_lines(0, sline, eline, true)
  print(lines)
  if (#lines > 0) then
    lines[1] = string.sub(lines[1], (scol + 1))
    lines[#lines] = string.sub(lines[#lines], 1, (ecol + 1))
    return table.concat(lines, " ")
  else
    return nil
  end
end
local n_keys
local function _5_()
  return telescope.live_grep({default_text = vim.fn.expand("<cword>")})
end
local function _6_()
  local text = get_visual_selection()
  if text then
    return telescope.live_grep({default_text = text})
  else
    return nil
  end
end
n_keys = {n = {{"<leader>e", "<Cmd>Neotree<CR>", {silent = true, noremap = true}}, {"<ESC>", "<Cmd>nohl<CR>", {}}, {"<LocalLeader>fb", "<Cmd>lua require'conform'.format()<CR>", NS}, {"<leader>fw", _5_, NS}}, v = {{"<leader>fw", _6_, NS}}}
local function setup()
  local keys = {n_keys}
  vim.g.neovide_enable_logo_key = true
  for _, t in ipairs(keys) do
    for m, kms in pairs(t) do
      for _0, _8_ in ipairs(kms) do
        local k = _8_[1]
        local cmd = _8_[2]
        local opt = _8_[3]
        vim.keymap.set(m, k, cmd, opt)
      end
    end
  end
  return nil
end
return {setup = setup}
