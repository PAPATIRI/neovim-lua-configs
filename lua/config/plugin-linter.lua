local status, linter = pcall(require, "lint")
if not status then
    return
end

linter.lint_by_ft = {
    javascript = "eslint_d",
    typescript = "eslint_d",
    javascriptreact = "eslint_d",
    typescriptreact = "eslint_d",
    svelte = "eslint_d",
    php = "phpcs"
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    pattern = { "*.ts", "*.js", "*.jsx", "*.tsx" },
    group = lint_augroup,
    callback = function()
        linter.try_lint()
    end
})

vim.keymap.set("n", "<leader>l", function()
    linter.try_lint()
end, { desc = "linting for the current file" }
)
