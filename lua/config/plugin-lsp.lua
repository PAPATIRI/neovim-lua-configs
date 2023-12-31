local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	return
end

-- local protocol = require("vim.lsp.protocol")

local on_attach = function(client)
	vim.o.completeopt = "menuone,noinsert,noselect"
	vim.opt.shortmess = vim.opt.shortmess + "c"

	vim.diagnostic.config({ virtual_text = false, float = { border = "rounded" } })
	vim.o.updatetime = 250
	vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
	vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335 guifg=#abb2bf]])
	--format on save
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_create_autocmd({ "BufWritePre" }, {
			pattern = { "*" },
			group = vim.api.nvim_create_augroup("Format", { clear = true }),
			-- buffer = bufnr,
			callback = function(args)
				-- vim.lsp.buf.format({ async = false })
				require("conform").format({ async = false, bufnr = args.buf })
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

nvim_lsp.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {

			diagnostics = {
				globals = {
					"vim",
					"require",
				},
			},
		},
	},
})

-- emmet ls
nvim_lsp.emmet_ls.setup({
	-- on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {
		"css",
		"html",
		"javascript",
		"javascriptreact",
		"less",
		"sass",
		"scss",
		"svelte",
		"pug",
		"typescriptreact",
		"vue",
	},
	init_options = {
		html = {
			options = {
				-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
				["bem.enabled"] = true,
			},
		},
	},
})
