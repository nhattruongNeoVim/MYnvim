--------- ███╗   ██╗██╗  ██╗ █████╗ ████████╗    ████████╗██████╗ ██╗   ██╗ ██████╗ ███╗   ██╗ ██████╗     ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗----------------
--------- ████╗  ██║██║  ██║██╔══██╗╚══██╔══╝    ╚══██╔══╝██╔══██╗██║   ██║██╔═══██╗████╗  ██║██╔════╝     ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║----------------
--------- ██╔██╗ ██║███████║███████║   ██║          ██║   ██████╔╝██║   ██║██║   ██║██╔██╗ ██║██║  ███╗    ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║----------------
--------- ██║╚██╗██║██╔══██║██╔══██║   ██║          ██║   ██╔══██╗██║   ██║██║   ██║██║╚██╗██║██║   ██║    ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║----------------
--------- ██║ ╚████║██║  ██║██║  ██║   ██║          ██║   ██║  ██║╚██████╔╝╚██████╔╝██║ ╚████║╚██████╔╝    ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║----------------
--------- ╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝          ╚═╝   ╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝     ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝----------------

if vim.g.neovide then
	-- Config for Neovide
	require("extras.neovide")
elseif vim.g.vscode then
	-- Config for VSCode Neovim extension
	require("extras.functions")
	require("extras.mappings")
else
	-- Config for neovim
	require("core.keymaps")
	require("core.options")
	require("core.lazy")
end
