-- [nfnl] fnl/plugins/treesitter.fnl
local function _1_()
  local treesitter = require("nvim-treesitter.configs")
  return treesitter.setup({highlight = {enable = true}, indent = {enable = true}, ensure_installed = {"bash", "clojure", "python", "starlark", "janet_simple", "commonlisp", "dockerfile", "fennel", "html", "java", "javascript", "json", "lua", "markdown", "c", "cpp", "vim", "racket", "yaml"}})
end
local function _2_()
  local navic = require("nvim-navic")
  local lspconfig = require("lspconfig")
  local function _3_(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
      return navic.attach(client, bufnr)
    else
      return nil
    end
  end
  return vim.lsp.config("clangd", {on_attach = _3_})
end
return {{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = _1_}, {"utilyre/barbecue.nvim", dependencies = {"SmiteshP/nvim-navic", "nvim-tree/nvim-web-devicons"}, name = "barbecur", opts = {create_autocmd = true, attach_navic = true, theme = "auto", show_dirname = true, show_basename = true, separator = " \226\128\186 "}}, {"neovim/nvim-lspconfig", config = _2_, dependencies = {"SmiteshP/nvim-navic"}, enable = "c", ft = {"c", "cpp"}}}
