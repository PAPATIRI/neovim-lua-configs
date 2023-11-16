local status, formatter = pcall(require, "formatter")
if not status then
	return
end

local function pcf()
	return {
		exe = "php-cs-fixer",
		args = {
			"--rules=@Symfony",
			"--using-cache=no",
			"--no-interaction",
			"fix",
			vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
		},
		stdin = false,
	}
end

formatter.setup({
	logging = false,
	filetype = {
		php = { pcf },
	},
})
