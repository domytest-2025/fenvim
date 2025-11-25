(local {: autoload} (require :nfnl.module))
(local core (autoload :nfnl.core))
(local fterm (require :FTerm))

(fn setup []
  (vim.keymap.set :n "<leader>tt" (fn [] (fterm:toggle) {:desc "[T]oggle [T]erminal"}))
  (vim.keymap.set :t "<leader>tt" (fn [] (fterm:toggle) {:desc "[T]oggle [T]erminal"}))
  (set vim.g.floaterm_width 0.8)
  (set vim.g.floaterm_height 0.8))
  

{: setup}
