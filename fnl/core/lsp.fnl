;lsp loading progress
(var progress-message {:status "" :percent 0 :msg ""})

;(vim.lsp.enable [:fennel-ls :typedclojure])

(fn get-progress-message []
  progress-message)

(fn progress-handler [_ msg ctx]
  (let [client (vim.lsp.get_client_by_id ctx.client_id)]
    (when client
      (set progress-message.status msg.value.kind)
      (when (not= msg.value.percentage nil)
        (set progress-message.percent msg.value.percentage))
      (if (and (not= msg.value.message nil)
               (and (not= msg.token nil)
                    (not= (type (tonumber msg.token)) :number)))
          (set progress-message.msg (.. msg.token " : " msg.value.message))
          (not= msg.value.message nil)
          (set progress-message.msg msg.value.message)
          (not= msg.token nil)
          (set progress-message.msg msg.token)))))

(fn setup-progress-handler []
  (let [original-handler (. vim.lsp.handlers :$/progress)]
    (tset vim.lsp.handlers :$/progress
          (fn [...]
            (let [args (vim.F.pack_len ...)]
              (progress-handler (vim.F.unpack_len args))
              (when original-handler
                (original-handler ...)))))))

(vim.lsp.config :fennel {:cmd [:fennel :lsp]
                         :filetypes [:fennel]})

(setup-progress-handler)

{: get-progress-message}
