(local {: autoload} (require :nfnl.module))
(local core (autoload :nfnl.core))
(local fterm (require :FTerm))

(fn setup []
  (vim.keymap.set :t "<C-\\>" (fn [] ((. (require :FTerm) :toggle))))
  (set vim.g.floaterm_width 0.8)
  (set vim.g.floaterm_height 0.8))
  

{: setup}
