<div align="center">
    <h1>MYnvim 💫</h1>
</div>

![Imgur](https://i.imgur.com/R8HZazO.png)

## Advice

> [!Important]
> You should only use this configuration on Linux or WSL (Windows Subsystem for Linux), not on Windows. If used on Windows, it may result in various errors, and I don't have the time to troubleshoot them.

## Dependencies

- Prerequisites:

  - Make sure you have installed the latest version of [Neovim v0.9.0+](https://github.com/neovim/neovim/releases/tag/v0.9.5).
  - Have [git](https://cli.github.com/), [make](https://www.gnu.org/software/make/), [fzf](https://github.com/junegunn/fzf), [pip](https://pypi.org/project/pip/), [python](https://www.python.org/), [npm](https://nodejs.org/), [node](https://nodejs.org/), and [cargo](https://www.rust-lang.org/tools/install) installed on your system
  - Install [lazygit](https://github.com/jesseduffield/lazygit#installation) to launch lazygit in neovim with `<leader>gg` _*(optional)*_
  - A terminal that support true color and undercurl:
    - [kitty](https://github.com/kovidgoyal/kitty) _*(Linux & Macos)*_
    - [wezterm](https://github.com/wez/wezterm) _*(Linux, Macos & Windows)*_
    - [alacritty](https://github.com/alacritty/alacritty) _*(Linux, Macos & Windows)*_
    - [iterm2](https://iterm2.com/) _*(Macos)*_
    - [PowerShell 7+](https://learn.microsoft.com/en-us/powershell/scripting/whats-new/migrating-from-windows-powershell-51-to-powershell-7?view=powershell-7.2) _*(Windows)*_

  ```bash
  # Then run this command:
  pip install pynvim
  npm install neovim -g
  ```

- Necessary font:
  - [MesloLGS NF Regular.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf)
  - [MesloLGS NF Bold.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf)
  - [MesloLGS NF Italic.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf)
  - [MesloLGS NF Bold Italic.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf)

> [!Tip]
> Script to auto setup environment for Ubuntu user
>
> ```
> bash <(curl -sSL https://is.gd/nhattruongNeoVim_nvim)
> ```

## Install

- Make sure you have removed nvim and nvim-data

```bash
# Windows
Remove-Item -Path "~\AppData\Local\nvim" -Recurse -Force
Remove-Item -Path "~\AppData\Local\nvim-data" -Recurse -Force

# Linux / Macos (unix)
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
```

- Then run this command:

```bash
# Window
git clone https://github.com/nhattruongNeoVim/MYnvim $HOME\AppData\Local\nvim --depth 1

# Linux / Macos (unix)
git clone https://github.com/nhattruongNeoVim/MYnvim ~/.config/nvim --depth 1
```

- You can remove .git file with this command:

```bash
# window
Remove-Item -Path "~\AppData\Local\nvim\.git" -Recurse -Force

# Linux / Macos (unix)
rm -rf ~/.config/nvim/.git
```

Now just open neovim and enjoy.

![Imgur](https://i.imgur.com/4rEZBH0.png)

## Plugins list

| Name                                                                                            | Description                                                                                      | Optional?  |
| ----------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------ | ---------- |
| [alpha-nvim](https://github.com/goolord/alpha-nvim)                                             | a lua powered greeter like vim-startify / dashboard-nvim                                         |            |
| [bufdelete.nvim](https://github.com/famiu/bufdelete.nvim)                                       | delete Neovim buffers without losing window layout                                               |            |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)                                   | a snazzy bufferline for Neovim                                                                   |            |
| [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)                                             | nvim-cmp source for buffer words                                                                 |            |
| [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)                                         | nvim-cmp source for neovim builtin LSP client                                                    |            |
| [cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua)                                         | nvim-cmp source for nvim lua                                                                     |            |
| [cmp-path](https://github.com/hrsh7th/cmp-path)                                                 | nvim-cmp source for path                                                                         |            |
| [cmp-tabnine](https://github.com/tzachar/cmp-tabnine)                                           | nvim-cmp source for TabNine                                                                      | _Optional_ |
| [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)                                      | nvim-cmp source for luasnip completion                                                           |            |
| [code_runner.nvim](https://github.com/CRAG666/code_runner.nvim)                                 | the best code runner you could have                                                              |            |
| [Comment.nvim](https://github.com/numToStr/Comment.nvim)                                        | smart and powerful comment plugin for neovim                                                     |            |
| [conform.nvim](https://github.com/stevearc/conform.nvim)                                        | lightweight yet powerful formatter plugin for Neovim                                             |            |
| [diffview.nvim](https://github.com/sindrets/diffview.nvim)                                      | single tabpage interface for easily cycling through diffs for all modified files for any git rev | _Optional_ |
| [dressing.nvim](https://github.com/stevearc/dressing.nvim)                                      | neovim plugin to improve the default vim.ui interfaces                                           |            |
| [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)                            | set of preconfigured snippets for different languages                                            | _Optional_ |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)                                     | git integration for buffers                                                                      | _Optional_ |
| [hop.nvim](https://github.com/phaazon/hop.nvim)                                                 | neovim motions on speed!                                                                         |            |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)                 | indent guides for Neovim                                                                         |            |
| [lazy.nvim](https://github.com/folke/lazy.nvim)                                                 | a modern plugin manager for Neovim                                                               |            |
| [live-server.nvim](https://github.com/aurum77/live-server.nvim)                                 | a plugin to integrate live-server from Neovim                                                    |            |
| [lspkind.nvim](https://github.com/onsails/lspkind.nvim)                                         | vscode-like pictograms for neovim lsp completion items                                           |            |
| [lspsaga.nvim](https://github.com/nvimdev/lspsaga.nvim)                                         | improve neovim lsp experience                                                                    |            |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)                                    | a blazing fast and easy to configure neovim statusline plugin                                    |            |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip)                                                  | snippet Engine for Neovim written in Lua                                                         |            |
| [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)                        | markdown preview plugin for neovim                                                               | _Optional_ |
| [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)                    | extension to mason.nvim that makes it easier to use lspconfig with mason.nvim.                   |            |
| [mason-null-ls.nvim](https://github.com/jay-babu/mason-null-ls.nvim)                            | allow you to automatically install, and automatically set up a predefined list of sources        |            |
| [mason.nvim](https://github.com/williamboman/mason.nvim)                                        | easily install and manage LSP servers, DAP servers, linters, and formatters                      |            |
| [neogit](https://github.com/NeogitOrg/neogit)                                                   | an interactive and powerful Git interface for Neovim                                             | _Optional_ |
| [neoscroll.nvim](https://github.com/karb94/neoscroll.nvim)                                      | smooth scrolling neovim plugin written in lua                                                    |            |
| [noice.nvim](https://github.com/folke/noice.nvim)                                               | UI for messages, cmdline and the popupmenu                                                       |            |
| [none-ls.nvim](https://github.com/nvimtools/none-ls.nvim)                                       | null-ls.nvim reloaded                                                                            |            |
| [nui.nvim](https://github.com/MunifTanjim/nui.nvim)                                             | UI Component Library for Neovim                                                                  | _Optional_ |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs)                                      | autopairs for neovim written by lua                                                              | _Optional_ |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)                                                 | a completion plugin for neovim coded in Lua                                                      |            |
| [nvim-colorizer.lua](https://github.com/NvChad/nvim-colorizer.lua)                              | maintained fork of the fastest Neovim colorizer                                                  |            |
| [nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls)                                        | extensions for the built-in LSP support in Neovim for eclipse.jdt.ls                             |            |
| [nvim-lint](https://github.com/mfussenegger/nvim-lint)                                          | an asynchronous linter plugin for Neovim                                                         |            |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)                                      | quickstart configs for Nvim LSP                                                                  |            |
| [nvim-notify](https://github.com/rcarriga/nvim-notify)                                          | a fancy, configurable, notification manager for NeoVim                                           | _Optional_ |
| [nvim-surround](https://github.com/kylechui/nvim-surround)                                      | add/change/delete surrounding delimiter pairs with ease                                          |            |
| [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)                                    | file explorer tree for neovim written in lua                                                     |            |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)                           | syntax highlighting                                                                              |            |
| [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)                                    | use treesitter to auto close and auto rename html tag                                            | _Optional_ |
| [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring) | neovim treesitter plugin for setting the commentstring based on the cursor location in a file    |            |
| [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)                            | beautiful and configurable dev icons                                                             |            |
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)                                        | all the lua functions                                                                            |            |
| [smart-splits.nvim](https://github.com/mrjones2014/smart-splits.nvim)                           | navigation and resizing of Neovim + terminal multiplexer splits                                  |            |
| [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)        | FZF sorter for telescope written in c                                                            |            |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)                              | file searching, previewing image and text files and more                                         |            |
| [toggleterm](https://github.com/akinsho/toggleterm.nvim)                                        | inbuilt terminal toggling & management                                                           |            |
| [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)                                     | a clean, dark Neovim theme                                                                       |            |
| [treesj](https://github.com/Wansmer/treesj)                                                     | neovim plugin for splitting/joining blocks of code                                               |            |
| [vim-maximizer](https://github.com/szw/vim-maximizer)                                           | maximizes and restores the current window in Vim                                                 | _Optional_ |
| [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)                         | seamless navigation between tmux panes and vim splits                                            |            |
| [whichkey.nvim](https://github.com/folke/which-key.nvim)                                        | popup mappings keysheet                                                                          | _Optional_ |
| ...                                                                                             |                                                                                                  |            |

# (￣ y▽ ￣)╭ Ohohoho.....
