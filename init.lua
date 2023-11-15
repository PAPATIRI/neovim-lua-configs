require("config.options")
require("config.mappings")
require("config.plugins")
-- colorscheme config
local themeStatus, kanagawa = pcall(require, "kanagawa")
if themeStatus then
  vim.cmd("colorscheme kanagawa")
else
  return
end
