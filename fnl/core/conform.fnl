(local {: autoload} (require :nfnl.module))
(local core (autoload :nfnl.core))

(local conform (require :conform))

(fn setup []
  (vim.api.nvim_create_autocmd
    :BufWritePre
    {:pattern "*"
     :callback (fn [args]
                 ;;(print args.buf)
                 (conform.format {:bufnr args.buf}))})
  (vim.keymap.set "" "<leader>fs"
    (fn []
      (let [cf (require :conform)]
        (cf.format {:async true}
          (fn [err]
            (if (not err) 
              (let* [mode (. (vim.api.nvim_get_mode) :mode)
                     mode (string.lower mode)]
                (print mode)
                (if (vim.startswith mode "v")
                  (vim.api.nvim_feedkeys (vim.api.nvim_replace_termcodes "<Esc>" true false true) "n" true)))
              (print "error: " err))))))
    {:desc "Format code"}))

{: setup}
