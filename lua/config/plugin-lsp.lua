local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
  return
end

local protocol = require("vim.lsp.protocol")

local on_attach = function(client, bufnr)
  --format on save
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", {clear = true}),
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({async = true})
      end,
    })
  end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- typescript
nvim_lsp.tsserver.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
-- CSS
nvim_lsp.cssls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
-- PHP
nvim_lsp.intelephense.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- php format onsave using php-cs-fixer formatter 
