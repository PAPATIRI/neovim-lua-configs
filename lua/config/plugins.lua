-- automatically run :PackageCompile
vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("PACKER", {clear=true}),
  pattern = "plugins.lua",
  command = "source <afile> | PackerCompile",
})

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim") -- packer
  use("nvim-lua/plenary.nvim") -- common utilities
  use("nvim-tree/nvim-web-devicons") -- icons
  use("rebelot/kanagawa.nvim") -- colorscheme
  use({ -- statusline
    "nvim-lualine/lualine.nvim",
    event = "BufEnter",
    config = function()
      require("config.plugin-lualine")
    end,
    requires = {"nvim-web-devicons"},
  })
  use({ -- telescope
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    requires = {{"nvim-lua/plenary.nvim"}},
  })
  use({ -- file manager
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  })
  use({ -- show colors
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({"*"})
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
  use({ --transparent bg
    "xiyaowong/nvim-transparent",
    config = function()
      require("transparent").setup({
        extra_groups = {
          "BufferLineTabClose",
          "BufferLineBufferSelected",
          "BufferLineBackground",
          "BufferLineSeparator",
          "BufferLineIndicatorSelected",
        },
        exclude_groups = {},
      })
    end,
  })
  use { -- dashboard alpha
    'goolord/alpha-nvim',
    config = function ()
        require("config.plugin-dashboard")
    end
  }
  use{ -- comment in nvim
    "numToStr/Comment.nvim", 
    config = function()
      require('Comment').setup()
    end
  }
  use { -- bufferline
    'akinsho/bufferline.nvim',
    tag = "*", 
    requires = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("config.plugin-bufferline")
    end
  }
  --------------------------------------
  -- LANGUAGE SERVER AND AUTO COMPLETION
  --------------------------------------
  use({ -- treesitter
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({with_sync = true})
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
    event = "InsertEnter",
    rquires = {
      "onsails/lspkind-nvim",     -- Icons on the popups
      "hrsh7th/cmp-nvim-lsp",     -- LSP source for nvim-cmp
      "saadparwaiz1/cmp_luasnip", -- Snippets source
      "L3MON4D3/LuaSnip",         -- Snippet engine
    },
    config = function()
      require("config.plugin-cmp")
    end,
  })
  use({"hrsh7th/cmp-nvim-lsp"})
  use({"hrsh7th/cmp-path", after = "nvim-cmp"})
  use({"hrsh7th/cmp-buffer", after = "nvim-cmp"})
  -- LSP diagnostic, code actions, and more via lua
  use({ -- null ls
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("config.plugin-null-ls")
    end,
    requires = { "nvim-lua/plenary.nvim" },
  })
  use({ -- mason : portabel package manager
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  })
  use({
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("config.plugin-mason-lsp")
    end,
  })
end)

