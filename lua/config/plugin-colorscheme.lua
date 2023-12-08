local status_kanagawa, kanagawa = pcall(require, "kanagawa")
if not status_kanagawa then
	return
end
local status_tokyo, tokyonight = pcall(require, "tokyonight")
if not status_tokyo then
	return
end
local status_material, material = pcall(require, "material")
if not status_material then
	return
end
local status_nightfox, nightfox = pcall(require, "nightfox")
if not status_nightfox then
	return
end
local status_onedark, onedark = pcall(require, "onedark")
if not status_onedark then
	return
end

onedark.setup({
	style = "darker",
})
onedark.load()

nightfox.setup({
	options = {
		styles = {
			comments = "italic",
			keywords = "bold",
			types = "italic,bold",
		},
	},
})

material.setup({
	contrast = {
		terminal = false, -- Enable contrast for the built-in terminal
		sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
		floating_windows = false, -- Enable contrast for floating windows
		cursor_line = false, -- Enable darker background for the cursor line
		non_current_windows = false, -- Enable contrasted background for non-current windows
		filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
	},

	styles = { -- Give comments style such as bold, italic, underline etc.
		comments = { --[[ italic = true ]]
		},
		strings = { --[[ bold = true ]]
		},
		keywords = { --[[ underline = true ]]
		},
		functions = { --[[ bold = true, undercurl = true ]]
		},
		variables = {},
		operators = {},
		types = {},
	},

	plugins = { -- Uncomment the plugins that you use to highlight them
		-- Available plugins:
		-- "dap",
		-- "dashboard",
		-- "eyeliner",
		-- "fidget"
		-- "flash"
		"gitsigns",
		-- "harpoon",
		-- "hop",
		-- "illuminate",
		"indent-blankline",
		-- "lspsaga",
		-- "mini",
		-- "neogit",
		-- "neotest",
		-- "neorg",
		-- "noice"
		"nvim-cmp",
		-- "nvim-navic",
		"nvim-tree",
		"nvim-web-devicons",
		-- "rainbow-delimiters",
		-- "sneak",
		"telescope",
		-- "trouble",
		-- "which-key",
	},

	disable = {
		colored_cursor = false, -- Disable the colored cursor
		borders = false, -- Disable borders between verticaly split windows
		background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
		term_colors = false, -- Prevent the theme from setting terminal colors
		eob_lines = false, -- Hide the end-of-buffer lines
	},

	high_visibility = {
		lighter = false, -- Enable higher contrast text for lighter style
		darker = false, -- Enable higher contrast text for darker style
	},
	lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )
	async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)
	custom_colors = nil, -- If you want to override the default colors, set this to a function
	custom_highlights = {}, -- Overwrite highlights with your own
})

kanagawa.setup({
	undercurl = true, -- enable undercurls
	commentStyle = { italic = true },
	functionStyle = {},
	keywordStyle = { italic = true },
	statementStyle = { bold = true },
	typeStyle = {},
	variablebuiltinStyle = { italic = true },
	specialReturn = true, -- special highlight for the return keyword
	specialException = true, -- special highlight for exception handling keywords
	transparent = false, -- do not set background color
	dimInactive = false, -- dim inactive window `:h hl-NormalNC`
	globalStatus = false, -- adjust window separators highlight for laststatus=3
	terminalColors = true, -- define vim.g.terminal_color_{0,17}
	colors = {},
	overrides = {},
	theme = "wave", -- Load "default" theme or the experimental "light" theme
	background = {
		dark = "dragon",
		ligth = "lotus",
	},
})

tokyonight.setup({
	style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
	light_style = "day", -- The theme is used when the background is set to light
	transparent = false, -- Enable this to disable setting the background color
	terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
		-- Background styles. Can be "dark", "transparent" or "normal"
		sidebars = "dark", -- style for sidebars, see below
		floats = "dark", -- style for floating windows
	},
	sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
	day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
	hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
})
