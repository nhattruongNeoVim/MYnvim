--------------------------------------------------------- OPT: ---------------------------------------------------------

-- Options enabled by default in Neovim:
-- filetype syntax on
-- set autoindent autoread background=dark backspace=indent,eol,start nocompatible display=lastline encoding=utf-8
-- set hidden history=10000 nojoinspaces incsearch laststatus=2 ruler showcmd nostartofline tabpagemax=50 timeoutlen=50
-- set ttyfast smarttab wildmenu wildoptions=pum,tagfile
-- https://neovim.io/doc/user/vim_diff.html#nvim-defaults

local my_opt = {

    -- Buffer
    number         = true,
    relativenumber = true,
    cursorline     = false,
    cursorcolumn   = false,
    cursorlineopt  = "number",

    -- Update time
    updatetime     = 250, --> specifies the update time interval in milliseconds for recording changes
    timeoutlen     = 300, --> this determines how frequently NeoVim saves changes to the undo buffer.

    -- Tab
    tabstop        = 4,    --> how many characters Vim /treats/renders/ <TAB> as
    shiftwidth     = 4,    --> number of spaces to use for auto-indentation, <<, >>, etc
    softtabstop    = 0,    --> how many chracters the /cursor moves/ with <TAB> and <BS> -- 0 to disable
    expandtab      = true, --> use space instead of tab
    autoindent     = true, --> enable automatic indentation for new lines based on the previous line

    -- Search
    ignorecase     = true, --> ignore case in search
    smartcase      = true, --> /smartcase -> apply ignorecase | /sMartcase -> do not apply ignorecase

    -- Split
    splitright     = true, --> vertical split created right
    splitbelow     = true, --> horizontal split created below

    -- Spell
    spell          = false,    --> autocmd will enable spellcheck in Tex or markdown
    spelllang      = "en",     --> lang
    spellsuggest   = "best,8", --> suggest 8 words for spell suggestion
    spelloptions   = "camel",  --> consider CamelCase when checking spelling

    -- UI
    signcolumn     = "yes",             --> render signcolumn
    scrolloff      = 7,                 --> keep minimum x number of screen lines above and below the cursor
    termguicolors  = true,              --> enables 24-bit RGB color in the TUI
    showtabline    = 0,                 --> 0: never, 1: >= 2 tabs, 2: always
    laststatus     = 0,                 --> 0: never, 1: >= 2 windows, 2: always, 3: always and have one global statusline
    cmdheight      = 1,                 --> size of neovim command line for display command
    guifont        = "MesloLGS NF:h10", --> font in neovim-qt

    -- Fold
    foldenable     = false,                        --> auto folds until close them using zc/zC or update using zx
    foldmethod     = "expr",                       --> use `foldexpr` function for folding
    foldexpr       = "nvim_treesitter#foldexpr()", --> treesitter folding
    foldlevel      = 1,                            --> ignore n - 1 level fold

    -- Others
    mouse          = "a",                              --> allow mouse in all mode
    confirm        = true,                             --> confirm before exiting with unsaved bufffer(s)
    fillchars      = { eob = " " },                    --> delete ~ on empty line
    wrap           = false,                            --> wrap code
    mousemoveevent = true,                             --> enable mouse move events to track mouse movements
    iskeyword      = vim.opt.iskeyword + "-",          --> append '-' to the list of characters considered as keyword parts
    clipboard      = vim.opt.clipboard + "unnamedplus" --> add clipboard
}

local opt = vim.opt
for key, val in pairs(my_opt) do
    opt[key] = val
end

--------------------------------------------------------- CMD  ---------------------------------------------------------
-- autoreload file when it changes outside of NeoVim
vim.cmd([[au FocusGained,BufEnter,BufRead * checktime]])
vim.loader.enable()
