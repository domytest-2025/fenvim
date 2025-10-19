
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
  (vim.keymap.set "n" "<leader>sc" "<CMD>nohlsearch<CR>"
    {:desc "Clear search highlight"}))
  

{: init}

