[{1 :stevearc/conform.nvim
    :event :BufWritePre
    :cmd :ConformInfo
    :config (fn []
	      (let [conform (require :conform)]
		(conform.setup
		  {:formatters_by_ft {:lua [:stylua]}
		   :format_on_save {
		   	:timeout_ms 500
			:lsp_fallback true
		   }})))
    }
]


