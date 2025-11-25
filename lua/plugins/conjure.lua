-- [nfnl] fnl/plugins/conjure.fnl
local function _1_()
  vim.g["conjure#filetype#fennel"] = "conjure.client.fennel.nfnl"
  vim.g["conjure#mapping#doc_word"] = "K"
  vim.g["conjure#client#clojure#nrepl#eval#auto_require"] = false
  vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false
  return nil
end
local function _2_()
  local cmp = require("cmp")
  local config = cmp.get_config()
  table.insert(config.sources, {name = "conjure"})
  return cmp.setup(config)
end
return {{"Olical/conjure", branch = "main", lazy = true, dependencies = {"Paterjason/cmp-conjure"}, ft = {"clojure", "fennel", "python", "scheme", "lisp", "janet", "racket"}, init = _1_}, {[2] = "PaterJason/cmp-conjure", lazy = true, config = _2_}, {"Invertisment/conjure-clj-additions-nrepl", lazy = true}, {"Invertisment/conjure-clj-additions-vanilla", lazy = true}}
