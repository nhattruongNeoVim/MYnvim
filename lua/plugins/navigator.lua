return {
    "christoomey/vim-tmux-navigator", -- seamless navigation between tmux panes and vim splits
    keys = {
        { "<c-h>",  desc = "tmux navigate left" },
        { "<c-j>",  desc = "tmux navigate down" },
        { "<c-k>",  desc = "tmux navigate up" },
        { "<c-l>",  desc = "tmux navigate right" },
        { "<c-\\>", desc = "tmux navigate previous" },
    },
}
