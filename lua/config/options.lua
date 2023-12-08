local options = {
	number = true,
	relativenumber = true,
	shiftwidth = 4,
	tabstop = 4,
	softtabstop = 4,
	expandtab = true, --use space to make tabs
	swapfile = false, -- no swap file
	backup = false, -- no backup file
	mouse = "a", -- allow mouse
	ignorecase = true, -- ignore sensitive case for searching
	smartcase = true, -- ignore uppercase unless the search term has an uppercase
	hlsearch = false, -- highlight the result of the search term
	breakindent = true, -- preserve the indentation of a virtual line
	clipboard = "unnamedplus", -- use the clipboard register for all operations except yank
	autoindent = true, -- copy indent from current line when starting a new line
	encoding = "utf-8", -- set the char encoding used inside neovim
	fileencoding = "utf-8", -- set the char encoding for the file of the buffer
	title = true, -- show the title on window with the value of titlestring
	wildmenu = true, -- command line completion operates in an enhanced mode
	showcmd = true, -- show partial command in the last line of the screen
	cmdheight = 1, -- more space in the neovim command line for displaying message
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 0, -- so '' show in markdown file
	pumheight = 10, -- pop up menu height
	showmode = false, -- hide status like --INSERT--
	undofile = true, -- enable persistent undo
	signcolumn = "yes", -- always show the sign column , otherwise it would shift the text each time
	scrolloff = 4,
	-- sidescrolloff = 8,
}

vim.opt.shortmess:append("c")

for key, value in pairs(options) do
	vim.opt[key] = value
end
