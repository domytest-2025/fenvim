(local {: autoload} (require :nfnl.module))
(local core (autoload :nfnl.core))

(local conform (require :conform))

(fn setup []
  (vim.api.nvim_create_autocmd :BufWritePre
                               {:pattern "*"
                                :callback (fn [args]
                                            ;;(print args.buf)
                                            (conform.format {:bufnr args.buf}))}))

{: setup}
