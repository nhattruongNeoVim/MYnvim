--------- ███╗   ██╗██╗  ██╗ █████╗ ████████╗    ████████╗██████╗ ██╗   ██╗ ██████╗ ███╗   ██╗ ██████╗     ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗----------------
--------- ████╗  ██║██║  ██║██╔══██╗╚══██╔══╝    ╚══██╔══╝██╔══██╗██║   ██║██╔═══██╗████╗  ██║██╔════╝     ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║----------------
--------- ██╔██╗ ██║███████║███████║   ██║          ██║   ██████╔╝██║   ██║██║   ██║██╔██╗ ██║██║  ███╗    ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║----------------
--------- ██║╚██╗██║██╔══██║██╔══██║   ██║          ██║   ██╔══██╗██║   ██║██║   ██║██║╚██╗██║██║   ██║    ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║----------------
--------- ██║ ╚████║██║  ██║██║  ██║   ██║          ██║   ██║  ██║╚██████╔╝╚██████╔╝██║ ╚████║╚██████╔╝    ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║----------------
--------- ╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝          ╚═╝   ╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝     ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝----------------

if vim.g.vscode then
	-- Config for VSCode Neovim
    require("vscode.functions")
    require("vscode.mappings")
else
	-- Config for neovim
	require("core.keymaps")
	require("core.options")
	require("core.neovide")
	require("core.lazy")
end
