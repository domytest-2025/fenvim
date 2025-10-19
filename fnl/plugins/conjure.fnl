[{1 :Olical/conjure
  :branch "main"
  :lazy true
  :dependencies [:Paterjason/cmp-conjure]
  :ft [:clojure :fennel :python :scheme :lisp :janet :rocket]
  :init (fn []
          (set vim.g.conjure#mapping#doc_word "K")
          (set vim.g.conjure#client#clojure#nrepl#eval#auto_require false)
          (set vim.g.conjure#client#clojure#nrepl#connection#auto_repl#enabled false))}
 {2 :PaterJason/cmp-conjure
  :lazy true
  :config (fn []
            (print "cmp-joure")
            (let [cmp (require :cmp)
                  config (cmp.get_config)]
              (table.insert config.sources {:name "conjure"})
              (cmp.setup config)))}]
