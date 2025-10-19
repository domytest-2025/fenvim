-- [nfnl] fnl/plugins/lsp.fnl
vim.diagnostic.config({signs = {text = {[vim.diagnostic.severity.ERROR] = "\239\129\151", [vim.diagnostic.severity.WARN] = "\239\129\177", [vim.diagnostic.severity.INFO] = "\239\129\154", [vim.diagnostic.severity.HINT] = "\239\129\153"}}})
local on_attach_handler
local function _1_(client, bufnr)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true})
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true})
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ld", "<Cmd>lua vim.lsp.buf.declaration()<CR>", {noremap = true})
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {noremap = true})
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true})
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ln", "<cmd>lua vim.lsp.buf.rename()<CR>", {noremap = true})
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>le", "<cmd>lua vim.diagnostic.open_float()<CR>", {noremap = true})
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", {noremap = true})
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", {noremap = true})
  vim.api.nvim_buf_set_keymap(bufnr, "v", "<leader>la", "<cmd>lua vim.lsp.buf.range_code_action()<CR> ", {noremap = true})
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", {noremap = true})
  return vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>li", "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>", {noremap = true})
end
on_attach_handler = _1_
local function _2_()
  local handlers = {["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {severity_sort = true, update_in_insert = true, underline = true, virtual_text = false}), ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = "single"}), ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {border = "single"})}
  local before_init
  local function _3_(params)
    params.workDoneToken = "1"
    return nil
  end
  before_init = _3_
  local on_attach = on_attach_handler
  vim.lsp.config("*", {on_attach = on_attach, handlers = handlers, before_init = before_init})
  local function _4_(bufnr, on_dir)
    local pattern = vim.api.nvim_buf_get_name(bufnr)
    local util = require("lspconfig.util")
    local fallback = vim.loop.cwd()
    local patterns = {"project.clj", "deps.edn", "build.boot", "shadow-cljs.edn", ".git", "bb.edn"}
    return __fnl_global__on_2ddir((root or fallback))
  end
  vim.lsp.config("clojure_lsp", {root_dir = _4_})
  return vim.lsp.enable("clojure_lsp")
end
return {{"neovim/nvim-lspconfig", config = _2_}}
