[{1 :Olical/conjure
  :branch :main
  :lazy true
  :dependencies [:Paterjason/cmp-conjure]
  :ft [:clojure :fennel :python :scheme :lisp :janet :racket]
  :init (fn []
          (set vim.g.conjure#filetype#fennel :conjure.client.fennel.nfnl)
          (set vim.g.conjure#mapping#doc_word :K)
          (set vim.g.conjure#client#clojure#nrepl#eval#auto_require false)
          (set vim.g.conjure#client#clojure#nrepl#connection#auto_repl#enabled
               false))}
 {2 :PaterJason/cmp-conjure
  :lazy true
  :config (fn []
            (let [cmp (require :cmp)
                  config (cmp.get_config)]
              (table.insert config.sources {:name :conjure})
              (cmp.setup config)))}
 {1 :Invertisment/conjure-clj-additions-nrepl :lazy true}
 {1 :Invertisment/conjure-clj-additions-vanilla :lazy true}]
