require("config.options")
require("config.mappings")
require("config.plugins")
-- colorscheme config
-- local kanagawaStatus, kanagawa = pcall(require, "kanagawa")
local tokyoStatus, tokyonight = pcall(require, "tokyonight")

if tokyoStatus then
	vim.cmd("colorscheme tokyonight")
else
	return
end
