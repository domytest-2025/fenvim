(local {: autoload} (require :nfnl.module))
(local core (autoload :nfnl.core))

;;; Diagnostics
(fn toggle-diagnostic-lines []
  (vim.diagnostic.config
    {:virtual_lines
     (if (. (vim.diagnostic.config) :virtual_lines)
         false
         {:current_line true})}))

(fn toggle-diagnostic-text []
  (vim.diagnostic.config
    {:virtual_text (not (. (vim.diagnostic.config) :virtual_text))}))

(fn init []
  (set vim.o.exrc true)
  (vim.diagnostic.config
    {:virtual_text true
     :virtual_lines false})
  (vim.keymap.set "n" "<leader>tdl" toggle-diagnostic-lines {:desc "Toggle diagnostic virtual lines."})
  (vim.keymap.set "n" "<leader>tdt" toggle-diagnostic-text {:desc "Toggle diagnostic virtual text."})
  (vim.keymap.set "i" "jk" "<esc>")
  (vim.keymap.set "n" "<leader>q" "<CMD>quit<CR>" {:desc :quit})
  (vim.keymap.set "n" "\\" "<CMD>split<CR>" {:desc :split})
  (vim.keymap.set "n" "|" "<CMD>vsplit<CR>" {:desc :vsplit})
  (vim.keymap.set "n" "<leader>w" "<CMD>w<CR>" {:desc "write the buffer"})
  (vim.keymap.set "n" "<leader>sc" "<CMD>nohlsearch<CR>" {:desc "Clear search highlight"})

  (let [options
        {:expandtab true
         :tabstop 2
         :shiftwidth 2
         :softtabstop 2
         :completeopt "menuone,noselect"
         :ignorecase true
         ; for search
         :smartcase true
         :clipboard :unnamedplus
         :ruler true
         :signcolumn :number}]
    (each [option value (pairs options)]
      (core.assoc vim.o option value)))
  (let [cfgs ["core.keymaps" "core.fterm" "core.conform" "core.options" "core.mini" "core.lsp"]]
    (each [_ cfg (ipairs cfgs)]
      (let [c (require cfg)]
        ((. c :setup))))))
  
{: init}
