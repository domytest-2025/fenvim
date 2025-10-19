-- [nfnl] fnl/plugins/conjure.fnl
local function _1_()
  vim.g["conjure#mapping#doc_word"] = "K"
  vim.g["conjure#client#clojure#nrepl#eval#auto_require"] = false
  vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false
  return nil
end
local function _2_()
  print("cmp-joure")
  local cmp = require("cmp")
  local config = cmp.get_config()
  table.insert(config.sources, {name = "conjure"})
  return cmp.setup(config)
end
return {{"Olical/conjure", branch = "main", lazy = true, dependencies = {"Paterjason/cmp-conjure"}, init = _1_}, {[2] = "PaterJason/cmp-conjure", lazy = true, config = _2_}}
