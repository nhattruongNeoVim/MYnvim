return {
	"wfxr/minimap.vim",
	build = "cargo install --locked code-minimap",
	cmd = { "MinimapToggle" },
	config = function()
		-- minimap size
		vim.cmd("let g:minimap_width = 20")

		-- Color Options
		vim.cmd([[
            " default
            " highlight minimapCursor            ctermbg=59  ctermfg=228 guibg=#5F5F5F guifg=#FFFF87
            " highlight minimapRange             ctermbg=242 ctermfg=228 guibg=#4F4F4F guifg=#FFFF87
            " highlight minimapDiffRemoved                   ctermfg=197               guifg=#FC1A70
            " highlight minimapDiffAdded                     ctermfg=148               guifg=#A4E400
            " highlight minimapDiffLine                      ctermfg=141               guifg=#AF87FF
            " highlight minimapCursorDiffRemoved ctermbg=59  ctermfg=197 guibg=#5F5F5F guifg=#FC1A70
            " highlight minimapCursorDiffAdded   ctermbg=59  ctermfg=148 guibg=#5F5F5F guifg=#A4E400
            " highlight minimapCursorDiffLine    ctermbg=59  ctermfg=141 guibg=#5F5F5F guifg=#AF87FF
            " highlight minimapRangeDiffRemoved  ctermbg=242 ctermfg=197 guibg=#4F4F4F guifg=#FC1A70
            " highlight minimapRangeDiffAdded    ctermbg=242 ctermfg=148 guibg=#4F4F4F guifg=#A4E400
            " highlight minimapRangeDiffLine     ctermbg=242 ctermfg=141 guibg=#4F4F4F guifg=#AF87FF

            " custom
            highlight minimapCursor            ctermbg=59  ctermfg=228 guibg=NONE    guifg=#FC1A70
            highlight minimapRange             ctermbg=242 ctermfg=228 guibg=NONE    guifg=#AF87FF
        ]])
	end,
}
