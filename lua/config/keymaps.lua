-- [nfnl] fnl/config/keymaps.fnl
local _local_1_ = require("nfnl.module")
local autoload = _local_1_.autoload
local core = autoload("nfnl.core")
local NS = {noremap = true, silent = true}
local n_keys = {n = {{"<leader>e", "<Cmd>Neotree<CR>", {silent = true, noremap = true}}, {"<LocalLeader>fb", "<Cmd>lua require'conform'.format()<CR>", {}}, {"<C-\\>", "<Cmd>FloatermToggle<CR>", {silent = true, noremap = true}}}}
local t_keys = {t = {{"<C-\\>", "<C-\\><C-n><Cmd>FloatermToggle<CR>", {silent = true, noremap = true}}}}
local function setup()
  local keys = {n_keys, t_keys}
  for _, t in ipairs(keys) do
    for m, kms in pairs(t) do
      for _0, _2_ in ipairs(kms) do
        local k = _2_[1]
        local cmd = _2_[2]
        local opt = _2_[3]
        vim.api.nvim_set_keymap(m, k, cmd, opt)
      end
    end
  end
  return nil
end
return {setup = setup}
