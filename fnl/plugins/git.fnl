
[{1 :FabijanZulj/blame.nvim
   :opts {}
   :keys [["<leader>tb"
              "<CMD>BlameToggle<CR>"
              {:desc "Toggle git blame"}]]}
 {1 :sindrets/diffview.nvim
   :opts {}
   :cmd ["DiffviewOpen"
         "DiffviewClose"
         "DiffviewToggleFiles"
         "DiffviewFocusFiles"
         "DiffviewRefresh"
         "DiffviewFileHistory"
         "DiffviewLog"]
   :keys [[ "<leader>do" "<CMD>DiffviewOpen<CR>" {:desc "Open Diffview"}]
          [ "<leader>dq" "<CMD>DiffviewClose<CR>" {:desc "Close Diffview"}]
          [ "<leader>dr" "<CMD>DiffviewRefresh<CR>" {:desc "Refresh Diffview"}]
          [ "<leader>dt" "<CMD>DiffviewToggleFiles<CR>" {:desc "Toggle Diffview files"}]
          [ "<leader>df" "<CMD>DiffviewFocusFiles<CR>" {:desc "Focus Diffview files"}]
          [ "<leader>dh" "<CMD>DiffviewFileHistory<CR>" {:desc "Diffview file history"}]
          [ "<leader>dl" "<CMD>DiffviewLog<CR>" {:desc "Diffview log"}]]}
 {1 "lewis6991/gitsigns.nvim"
    :VeryLazy true
    :opts {}}
 {1 "kdheepak/lazygit.nvim"
    :dependencies ["nvim-lua/plenary.nvim"]
    :cmd ["LazyGit" "LazyGitConfig" "LazyGitCurrentFile" "LazyGitFilter" "LazyGitFilterCurrentFile"]
    :keys [[ "<leader>gg" "<CMD>LazyGit<CR>" {:desc "LazyGit"}]]}]
