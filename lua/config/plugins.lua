-- automatically run :PackageCompile
vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
	pattern = "plugins.lua",
	command = "source <afile> | PackerCompile",
})

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- packer
	use("nvim-lua/plenary.nvim") -- common utilities
	use("nvim-tree/nvim-web-devicons") -- icons
	use("rebelot/kanagawa.nvim") -- colorscheme
	use("folke/tokyonight.nvim") --colorscheme
	use("marko-cerovac/material.nvim") -- colorscheme
	use("EdenEast/nightfox.nvim") -- colorscheme
	use("navarasu/onedark.nvim") --colorscheme

	use({ -- transparent bg
		"xiyaowong/transparent.nvim",
		config = function()
			require("config.plugin-transparent")
		end,
	})

	use({ -- statusline
		"nvim-lualine/lualine.nvim",
		event = "BufEnter",
		config = function()
			require("config.plugin-lualine")
		end,
		requires = { "nvim-web-devicons" },
	})

	use({ -- flash navigate on window
		"folke/flash.nvim",
	})

	use({ -- telescope
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("config.plugin-telescope")
		end,
	})

	use({ -- file manager
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("config.plugin-neotree")
		end,
	})

	use({ -- show colors
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ "*" })
		end,
	})

	use({ -- terminal
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("config.plugin-toggleterm")
		end,
	})

	use({ -- git
		"lewis6991/gitsigns.nvim",
		config = function()
			require("config.plugin-gitsigns")
		end,
	})

	use({ -- auto pairs
		"windwp/nvim-autopairs",
		config = function()
			require("config.plugin-autopairs")
		end,
	})

	use({ -- dashboard alpha
		"goolord/alpha-nvim",
		config = function()
			require("config.plugin-dashboard")
		end,
	})

	use({ -- comment in nvim
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	use({ -- bufferline
		"akinsho/bufferline.nvim",
		tag = "*",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("config.plugin-bufferline")
		end,
	})

	use({ -- surround neovim
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	})

	use({ -- session manager
		"shatur/neovim-session-manager",
		tag = "*",
		config = function()
			require("session_manager").setup({
				autoload_mode = require("session_manager.config").AutoloadMode.Disabled,
			})
		end,
	})

	use({ -- comment todo
		"folke/todo-comments.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = {},
	})

	use({ -- indent colorizer
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("config.plugin-indentblankline")
		end,
	})
	--------------------------------------
	-- LANGUAGE SERVER AND AUTO COMPLETION
	--------------------------------------
	use({ -- treesitter
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			require("config.plugin-treesitter")
		end,
	})

	use({ -- auto tag in html
		"windwp/nvim-ts-autotag",
		after = "nvim-treesitter",
	})

	use({ -- LSP
		"neovim/nvim-lspconfig",
		config = function()
			require("config.plugin-lsp")
		end,
	})

	use("onsails/lspkind-nvim") -- vscode like pictogram for lsp

	use({ -- snippet
		"L3MON4D3/LuaSnip",
		--follow latest release
		tag = "v2.*",
	})

	use({ -- CMP : autocomplete
		"hrsh7th/nvim-cmp",
		-- event = "InsertEnter",
		requires = {
			"onsails/lspkind-nvim", -- Icons on the popups
			"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
			{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" }, -- Snippets source
			"L3MON4D3/LuaSnip", -- Snippet engine
		},
		config = function()
			require("config.plugin-cmp")
		end,
	})

	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })

	-- LSP diagnostic, code actions, and more via lua
	use({ -- mason : portabel package manager
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	})

	use({ -- mason lsp manager
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("config.plugin-mason-lsp")
		end,
	})

	use({ -- new formatter
		"stevearc/conform.nvim",
		config = function()
			require("config.plugin-conform")
		end,
		event = { "BufReadPre", "BufNewFile" },
	})

	use({ -- new linter
		"mfussenegger/nvim-lint",
		config = function()
			require("config.plugin-linter")
		end,
		event = { "BufReadPre", "BufNewFile" },
	})
end)
