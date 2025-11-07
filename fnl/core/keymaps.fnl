(local {: autoload} (require :nfnl.module))
(local core (autoload :nfnl.core))
(local NS {:noremap true :silent true})
(local telescope (require :telescope.builtin))
(fn get-visual-selection []
  (let [[sline scol] (vim.api.nvim_buf_get_mark 0 "<")
        [eline ecol] (vim.api.nvim_buf_get_mark 0 ">")
        ; nvim_buf_get_lines end index is exclusive, so use eline (already 0-based) as-is
        lines (vim.api.nvim_buf_get_lines 0 sline eline true)]
    (print lines)
    (when (> (# lines) 0)
      ; scol/ecol are 0-based; Lua string.sub is 1-based indices
      (tset lines 1 (string.sub (. lines 1) (+ scol 1)))
      (tset lines (# lines) (string.sub (. lines (# lines)) 1 (+ ecol 1)))
      (table.concat lines " "))))

(local n_keys {:n [[:<leader>e :<Cmd>Neotree<CR> {:silent true :noremap true}]
                   [:<LocalLeader>fb
                    "<Cmd>lua require'conform'.format()<CR>"
                    NS]
                   ["<C-\\>"
                    "<Cmd>lua require'FTerm'.toggle()<CR>"
                    NS]
                   ["<leader>fw"
                    (fn []
                      (telescope.live_grep {:default_text (vim.fn.expand "<cword>")}))
                    NS]]
               :v [["<leader>fw"
                    (fn []
                      (let [text (get-visual-selection)]
                        (when text
                          (telescope.live_grep {:default_text text}))))
                    NS]]})

(fn setup []
  (let [keys [n_keys]]
    (each [_ t (ipairs keys)]
      (each [m kms (pairs t)]
        (each [_ [k cmd opt] (ipairs kms)]
          ;(print k cmd)
          (vim.keymap.set m k cmd opt))))))

{: setup}
