return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        -- "nvim-treesitter/nvim-treesitter-textobjects",
        "windwp/nvim-ts-autotag",
    },
    config = function()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({                  -- cấu hình treesitter
            highlight = {                   -- bật syntax highlighting
                enable = true,
                disable = {"css", "markdown"},
            },
            indent = { enable = true },     -- bật indentation
            autotag = { enable = true },    -- bật autotagging (với nvim-ts-autotag plugin)
            ensure_installed = {            -- đảm bảo các trình phân tích cú pháp ngôn ngữ này được cài đặt
                "json",
                "javascript",
                "typescript",
                "tsx",
                "yaml",
                "html",
                "css",
                "bash",
                "lua",
                "vim",
                "dockerfile",
                "gitignore",
                "query",
                "cpp"
            },
            auto_install = true,            -- tự động cài đặt các trình phân tích cú pháp ngôn ngữ trên
        })
    end
}
