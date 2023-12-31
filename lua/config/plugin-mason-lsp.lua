local status, mason = pcall(require, "mason")
if not status then
    return
end
mason.setup()

local status_masonlsp, masonlsp = pcall(require, "mason-lspconfig")
if not status_masonlsp then
    return
end

masonlsp.setup({
    automatic_installation = true,
    ensure_installed = {
        "cssls",
        "eslint",
        "lua_ls",
        "html",
        "jsonls",
        "tsserver",
        "intelephense",
    },
})
