(import-macros {: tx} :config.macros)

[{1 :nvim-treesitter/nvim-treesitter
  :build ":TSUpdate"
  :config (fn []
            (let [treesitter (require :nvim-treesitter.configs)]
              (treesitter.setup {:highlight {:enable true}
                                 :indent {:enable true}
                                 :ensure_installed [:bash
                                                    :clojure
                                                    :python
                                                    :starlark
                                                    :janet_simple
                                                    :commonlisp
                                                    :dockerfile
                                                    :fennel
                                                    :html
                                                    :java
                                                    :javascript
                                                    :json
                                                    :lua
                                                    :markdown
                                                    :c
                                                    :cpp
                                                    :vim
                                                    :racket
                                                    :yaml]})))}
 (tx :utilyre/barbecue.nvim
  {:name "barbecur"
   ;;:event :VeryLazy
   :dependencies ["SmiteshP/nvim-navic" "nvim-tree/nvim-web-devicons"]
   :opts
   {:create_autocmd true
     :attach_navic true
     :theme "auto"
     :show_dirname true
     :show_basename true
     :separator " › "}})
 ;; LSP setup with navic attach (barbecue reads from navic)
 (tx "neovim/nvim-lspconfig"
  {:ft ["c" "cpp"]
   :dependencies ["SmiteshP/nvim-navic"]
   :enable :c
   :config
   (fn []
     (local navic (require :nvim-navic))
     (local lspconfig (require :lspconfig))
     (vim.lsp.config :clangd
       {:on_attach
        (fn [client bufnr]
           (when (. client.server_capabilities :documentSymbolProvider)
             (navic.attach client bufnr)))}))})]
  
 
               
