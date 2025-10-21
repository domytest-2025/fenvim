(local {: autoload} (require :nfnl.module))
(local core (autoload :nfnl.core))

(fn setup []
  (set vim.g.floaterm_width 0.8)
  (set vim.g.floaterm_height 0.8)
  (set vim.g.floaterm_keymap_toggle "<C-\\>"))

{: setup}
