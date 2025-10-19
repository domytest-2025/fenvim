[{1 :stevearc/conform.nvim
  :event :BufWritePre
  :cmd :ConformInfo
  :opts (fn []
          (let [conform (require :conform)]
            (conform.setup {:formatters_by_ft {:lua [:stylua]
                                               :fennel [:fnlfmt]
                                               :python [:black]
                                               :rust [:rustfmt
                                                      {:lsp_format :fallback}]}
                            :format_on_save {:timeout_ms 500
                                             :lsp_fallback true}})))}]
