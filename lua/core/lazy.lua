local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = { { import = "plugins" }, { import = "plugins.lsp" } },
    defaults = { lazy = true }, --> every plugin is lazy-loaded by default
    ui = {
        title = " nhattruongNeoVim ",
        title_pos = "left",
        border = "rounded",
        throttle = 40,
        icons = {
            ft = "󰈔",
        },
    },
    change_detection = { enabled = true, notify = false },  --> automatically check for config file changes and reload the ui
    lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json", --> lockfile generated after running update.
    checker = { enabled = true },                           --> automatically check for plugin updates
    performance = {
        rtp = {
            -- disable some rtp plugins
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrw",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
                "lazyredraw",
            },
        },
    },
})
