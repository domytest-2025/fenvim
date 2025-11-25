-- [nfnl] fnl/plugins/lsp.fnl
local lsps = {"clojure_lsp", "lua_ls", "jsonls", "yamlls", "marksman", "html", "basedpyright", "ts_ls", "terraformls", "tailwindcss", "dockerls", "docker_compose_language_service", "bashls", "taplo", "sqlls", "fennel_ls"}
local filetype__3eformatters = {lua = {"stylua"}, sh = {"shfmt"}, python = {"ruff_organize_imports", "ruff_format"}, rust = {"rustfmt"}, toml = {"taplo"}, clojure = {"cljfmt"}, json = {"prettierd"}, javascript = {"prettierd"}, typescript = {"prettierd"}, jsx = {"prettierd"}, html = {"prettierd"}, css = {"prettierd"}, yaml = {"prettierd"}, markdown = {"prettierd"}, fennel = {"fnlfmt"}, sql = {"sqlfmt"}, gleam = {"gleam"}, c = {"clang-format"}, ["*"] = {"trim_whitespace", "trim_newlines"}}
local formatter__3epackage = {ruff_organize_imports = "ruff", ruff_format = "ruff"}
local disable_formatter_on_save = {fennel = true, sql = true}
local disable_formatter_auto_install = {fnlfmt = true, rustfmt = true, trim_whitespace = true, trim_newlines = true, gleam = true}
local function _1_(_buf)
  if (vim.g.dotfiles_format_on_save and ((nil == vim.b.dotfiles_format_on_save) or vim.b.dotfiles_format_on_save) and not disable_formatter_on_save[vim.bo.filetype]) then
    return {timeout_ms = 500, lsp_format = "fallback"}
  else
    return nil
  end
end
local function _3_(_, opts)
  local conform = require("conform")
  local registry = require("mason-registry")
  local formatters_for_mason = {}
  conform.formatters.shfmt = {prepend_args = {"-i", "2", "-ci"}}
  local function _4_()
    for _ft, formatters in pairs(filetype__3eformatters) do
      for _idx, formatter in ipairs(formatters) do
        if not disable_formatter_auto_install[formatter] then
          formatters_for_mason[(formatter__3epackage[formatter] or formatter)] = true
        else
        end
      end
    end
    for formatter, _true in pairs(formatters_for_mason) do
      local pkg = registry.get_package(formatter)
      if not pkg:is_installed() then
        vim.notify(("Automatically installing " .. formatter .. " with Mason."))
        pkg:install()
      else
      end
    end
    return nil
  end
  vim.g.dotfiles_format_on_save = true
  vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  return vim.schedule(_4_, nil, conform.setup(opts), nil)
end
local function _7_()
  if (nil == vim.b.dotfiles_format_on_save) then
    vim.b.dotfiles_format_on_save = false
  else
    vim.b.dotfiles_format_on_save = not vim.b.dotfiles_format_on_save
  end
  return vim.notify(("Set vim.b.dotfiles_format_on_save to " .. tostring(vim.b.dotfiles_format_on_save)))
end
local function _9_()
  vim.g.dotfiles_format_on_save = not vim.g.dotfiles_format_on_save
  return vim.notify(("Set vim.g.dotfiles_format_on_save to " .. tostring(vim.g.dotfiles_format_on_save)))
end
local function _10_()
  local lsp = vim.lsp
  local caps = require("cmp_nvim_lsp").default_capabilities()
  local mlsp = require("mason-lspconfig")
  local function _11_(server_name)
    return lsp.config(server_name, {capabilities = caps})
  end
  local function _12_()
    print("fennel")
    return lsp.config("fennel", {cmd = "fennel-language-server", filetypes = {"fennel"}, single_file_support = true, root_dir = lsp.util.root_pattern("fnl"), settings = {fennel = {workspace = {library = vim.api.nvim_list_runtime_paths()}}}})
  end
  local function _13_()
    return lsp.config("tailwindcss", {settings = {tailwindCSS = {experimental = {classRegex = {{"\\[:[^.\\s]*((?:\\.[^.\\s\\]]*)+)[\\s\\]]", "\\.([^.]*)"}, {"\\:(\\.[^\\s#]+(?:\\.[^\\s#]+)*)", "\\.([^\\.\\s#]+)"}, {"class\\s+(\\:[^\\s\\}]*)[\\s\\}]", "[\\:.]([^.]*)"}, {"class\\s+(\"[^\\}\"]*)\"", "[\"\\s]([^\\s\"]*)"}, {"class\\s+\\[([\\s\\S]*)\\]", "[\"\\:]([^\\s\"]*)[\"]?"}, {"class\\s+'\\[([\\s\\S]*)\\]", "([^\\s]*)?"}}}, includeLanguages = {clojure = "html", clojurescript = "html"}}}})
  end
  return mlsp.setup_handlers({_11_, {fennel_ls = _12_}, tailwindcss = _13_})
end
local function _14_()
  return vim.lsp.buf.code_action()
end
local function _15_()
  return require("conform").format()
end
return {{"williamboman/mason.nvim", tag = "v2.1.0", opts = {}}, {[2] = "stevearc/conform.nvim", dependencies = {"rcarriga/nvim-notify"}, opts = {formatters_by_ft = filetype__3eformatters, format_on_save = _1_}, config = _3_, keys = {{"<leader>tf", _7_, desc = "Toggle buffer formatting"}, {"<leader>tF", _9_, desc = "Toggle global formatting"}}}, {"williamboman/mason-lspconfig.nvim", dependencies = {"williamboman/mason.nvim"}, opts = {ensure_installed = lsps, automatic_installation = true}, tag = "v1.32.0"}, {"neovim/nvim-lspconfig", config = _10_, dependencies = {"williamboman/mason-lspconfig.nvim", "hrsh7th/cmp-nvim-lsp", "stevearc/conform.nvim", "SmiteshP/nvim-navic"}, keys = {{"<leader>ld", "<CMD>Telescope lsp_definitions<CR>", desc = "LSP definition"}, {"<leader>lu", "<CMD>Telescope lsp_implementations<CR>", desc = "LSP implementations"}, {"<leader>lt", "<CMD>Telescope lsp_type_definitions<CR>", desc = "LSP type definitions"}, {"<leader>lr", "<CMD>Telescope lsp_references<CR>", desc = "LSP references"}, {"<leader>li", "<CMD>Telescope lsp_incoming_calls<CR>", desc = "LSP incoming calls"}, {"<leader>lo", "<CMD>Telescope lsp_outgoing_calls<CR>", desc = "LSP outgoing calls"}, {"<leader>ls", "<CMD>Telescope lsp_document_symbols<CR>", desc = "LSP document symbols"}, {"<leader>lS", "<CMD>Telescope lsp_workspace_symbols<CR>", desc = "LSP workspace symbols"}, {"<leader>lx", "<CMD>Telescope lsp_dynamic_workspace_symbols<CR>", desc = "LSP dynamic workspace symbols (all workspaces)"}, {"<leader>lA", _14_, desc = "Invoke code_action, prompting for an action to take at the cursor"}, {"<leader>laf", _15_, desc = "LSP format"}, {"<leader>lar", vim.lsp.buf.rename, desc = "LSP rename"}}, lazy = false}, {"RubixDev/mason-update-all", cmd = "MasonUpdateAll", dependencies = {"williamboman/mason.nvim"}, main = "mason-update-all", opts = {}}}
