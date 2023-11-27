local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
	"                                                                                 ",
	"         ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀    ⠀                      ⠀⣀⣤⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ",
	"⠀⠀⠀⠀         ⠀⠀⠀⠀⠀                  ⠀⠀        ⣠⣾⣿⣿⣿⣿⣿⣿⣆⠀⢀⣀⣀⣤⣤⣤⣶⣦⣤⣤⣄⣀⣀⠀⢠⣾⣿⣿⣿⣿⣿⣷⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀   ",
	" ⠀⠀⠀⠀⠀⠀                           ⠀⠀        ⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀   ",
	"  ⠀⠀⠀⠀⠀⠀                                   ⠀⠀⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⢿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀    ",
	"⠀  ⠀⠀⠀                                   ⠀⠀⠀⠀⢻⣿⣿⣿⣿⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀    ",
	"     ⠀⠀                            ⠀⠀⠀    ⠀⠀⠀⠈⠻⢿⣿⠟⠀⠀⠀⠀⠀⣀⣤⣤⣤⡀⠀⠀⠀⠀⠀⢀⣤⣤⣤⣄⡀⠀⠀⠀⠀⠘⣿⡿⠿⠃⠀⠀⠀⠀⠀⠀⠀⠀   ",
	"          ⠀⠀ ⠀⠀      ⠀  ⠀⠀    ⠀⠀⠀⠀            ⠀⢠⡟⠀⠀⠀⠀⣠⣾⣿⣿⠛⣿⡇⠀⠀⠀⠀⠀⢸⣿⣿⠛⣿⣿⣦⠀⠀⠀⠀⠸⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀    ",
	" ⠀⠀⠀  ⠀⠀           ⠀    ⠀                    ⠀⠀⣼⠁⠀⠀⠀⠀⣿⣿⣿⣿⣿⡟⢠⣶⣾⣿⣿⣷⣤⢹⣿⣿⣿⣿⣿⡇⠀⠀⣀⣤⣿⣷⣴⣶⣦⣀⡀⠀⠀⠀⠀   ",
	" ⠀⠀       ⠀⠀                             ⠀⢀⣠⣤⣤⣤⣇⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⠀⠘⠻⣿⣿⣿⡿⠋⠀⢹⣿⣿⣿⣿⡇⠀⣿⣿⣿⡏⢹⣿⠉⣿⣿⣿⣷⠀⠀⠀   ",
	"                    ⠀                  ⠀⢠⣾⣿⣿⣿⣿⣿⣿⣿⣶⣄⠀⠀⠹⣿⣿⠿⠋⠀⢤⣀⢀⣼⡄⠀⣠⠀⠈⠻⣿⣿⠟⠀⢸⣿⣇⣽⣿⠿⠿⠿⣿⣅⣽⣿⡇⠀⠀   ",
	"⠀                                      ⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠁⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣟⠁⠀⠀⠀⠈⣿⣿⣿⡇⠀⠀⠀  ",
	"                                   ⠛⠛⠛⠛⠛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛",
	"                              ⠀     ⠀⠀⠀⠀⠘⠛⠻⢿⣿⣿⣿⣿⣿⠟⠛⠁⠀⠀▀▀█ █▀▀█ █▀▀▄ █▀▀ █▀▀ █▀▀█ █▀▀▄ █▀▀ ⠀                                   ",
	"                                                      ▄▀─ █▄▄█ █──█ █── █── █──█ █──█ █▀▀  ",
	"                                                      ▀▀▀ ▀──▀ ▀──▀ ▀▀▀ ▀▀▀ ▀▀▀▀ ▀▀▀─ ▀▀▀  ",
}

-- Set menu
dashboard.section.buttons.val = {
	dashboard.button("e", "󱇧  > New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("f", "󰱼  > Find file", ":Telescope find_files<CR>"),
	dashboard.button("r", "󰤘  > Recent", ":SessionManager load_last_session<CR>"),
	dashboard.button("s", "󱑆  > Session", ":SessionManager load_session<CR>"),
	dashboard.button("q", "󰿅  > Quit NVIM", ":qa<CR>"),
}

-- Send config to alpha
local function footer()
	return "NO PAIN NO GAIN!"
end

dashboard.section.footer.val = footer()

alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
