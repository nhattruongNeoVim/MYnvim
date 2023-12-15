local lspconfig_status, dapui = pcall(require, "dapui")
if not lspconfig_status then
    return
end

dapui.setup({})
