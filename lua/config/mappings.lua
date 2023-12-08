--function untuk memperpendek membuat keymap
local function map(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { silent = true })
end

vim.g.mapleader = ","
-- map leader+w to save current file
map("n", "<leader>w", ":w<CR>")
map("n", "<leader>s", ":so %<CR>")
map("i", "jj", "<ESC>")
map("i", "jk", "<ESC>")

-- telescope
local status, telescope = pcall(require, "telescope.builtin")
if status then
	map("n", "<leader>ff", telescope.find_files)
	map("n", "<leader>fg", telescope.live_grep)
	map("n", "<leader>fb", telescope.buffers)
	map("n", "<leader>fh", telescope.help_tags)
	map("n", "<leader>fs", telescope.git_status)
	map("n", "<leader>fc", telescope.git_commits)
else
	print("Telescope not found")
end

-- flash mapping
local status_flash, flash = pcall(require, "flash")
if status_flash then
	-- flash navigation
	vim.keymap.set({ "n", "x", "o" }, "f", function()
		flash.jump()
	end, { desc = "search jump" })

	vim.keymap.set({ "n", "x", "o" }, "F", function()
		flash.treesitter()
	end, { desc = "search tressitter" })

	vim.keymap.set({ "o" }, "r", function()
		flash.remote()
	end, { desc = "search remote" })

	vim.keymap.set({ "x", "o" }, "R", function()
		flash.treesitter_search()
	end, { desc = "search remote" })

	map("c", "<c-s>", function()
		flash.toggle()
	end)
else
	print("flash not found")
end

-- neo tree
map("n", "<leader>e", "<CMD>Neotree toggle<CR>")
map("n", "<leader>o", "<CMD>NeoTreeFocusToggle<CR>")
map("n", "<leader>nf", "<CMD>NeoTreeFloatToggle<CR>")

-- buffer navigation
map("n", "<TAB>", "<CMD>bnext<CR>")
map("n", "<S-TAB>", "<CMD>bprevious<CR>")
map("n", "db", "<CMD>bdelete<CR>")

-- terminal toggleterm
map("n", "<leader>th", "<CMD>ToggleTerm size=10 direction=horizontal<CR>")
map("n", "<leader>tv", "<CMD>ToggleTerm size=80 direction=vertical<CR>")

-- Window Navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

-- transparent mapping
map("n", "<leader>tb", "<CMD>TransparentToggle<CR>")

-- session manager mapping
map("n", "<leader>ls", "<CMD>SessionManager load_session<CR>")
map("n", "<leader>ds", "<CMD>SessionManager delete_session<CR>")
map("n", "<leader>ss", "<CMD>SessionManager save_current_session<CR>")

-- Resize Windows
map("n", "<C-Left>", "<C-w><")
map("n", "<C-Right>", "<C-w>>")
map("n", "<C-Up>", "<C-w>+")
map("n", "<C-Down>", "<C-w>-")

-- Move line up and down with J/K
map("x", "J", ":move '>+1<CR>gv-gv")
map("x", "K", ":move '<-2<CR>gv-gv")

-- Keep search matches in the middle of the window
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- mapping format for php file
-- map("n", "<leader>5", "<cmd>!php-cs-fixer --rules=@Symfony --using-cache=no fix %<CR>")
-- map("n", "<leader>5", "<cmd>!php-cs-fixer --rules=@PSR12 --using-cache=no fix %<CR>")
