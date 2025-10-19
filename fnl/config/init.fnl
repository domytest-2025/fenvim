(local {: autoload} (require :nfnl.module))
(local core (autoload :nfnl.core))

(let [options
      {:expandtab true
       :tabstop 2
       :shiftwidth 2
       :softtabstop 2
       :completeopt "menuone,noselect"
       :ignorecase true ; for search
       :smartcase true
       :clipboard :unnamedplus
       :ruler true
       :signcolumn :number}]
  (each [option value (pairs options)]
    (core.assoc vim.o option value)))

;; nothing
{}

