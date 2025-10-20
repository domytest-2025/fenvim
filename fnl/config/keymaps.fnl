(local {: autoload} (require :nfnl.module))
(local core (autoload :nfnl.core))
(local NS {:noremap true :silent true})

(local n_keys {:n [[:<leader>e :<Cmd>Neotree<CR> {:silent true :noremap true}]
                   [:<LocalLeader>fb
                    "<Cmd>lua require'conform'.format()<CR>"
                    {}]
                   ["<C-\\>"
                    :<Cmd>FloatermToggle<CR>
                    {:silent true :noremap true}]]})

(local t_keys {:t [["<C-\\>"
                    "<C-\\><C-n><Cmd>FloatermToggle<CR>"
                    {:silent true :noremap true}]]})

(fn setup []
  (let [keys [n_keys t_keys]]
    (each [_ t (ipairs keys)]
      (each [m kms (pairs t)]
        (each [_ [k cmd opt] (ipairs kms)]
          ;;(print m k cmd)
          (vim.api.nvim_set_keymap m k cmd opt))))))

{: setup}
