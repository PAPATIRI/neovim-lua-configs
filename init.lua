require("config.options")
require("config.mappings")
require("config.plugins")
-- colorscheme config
local themeStatus, kanagawa = pcall(require, "tokyonight")
if themeStatus then
	vim.cmd("colorscheme tokyonight")
else
	return
end
