local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

ts.setup({
  highlight = {
    enable = true,
    additional_vim_regex_hightlighting = {"php"},
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  ensure_installed = {
    "markdown",
    "tsx",
    "typescript",
    "javascript",
    "json",
    "css",
    "html",
    "lua",
    "php",
  },
  rainbow = {
    enable = true,
    disable = {"html"},
    extended_mode = false,
    max_file_lines = nil,
  },
  autotag = {enable = true},
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    }
  },
  indent = {enable = false},
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = {"javascript", "typescript.tsx"}
parser_config.php.filetype_to_parsername = {"php", "php.php"}

-- enable folding (using zo and zc) on function, bracket and class but no default
vim.cmd([[
  set nofoldenable
  set foldmethod=expr
  set foldexpr=nvim_treesitter#foldexpr()
]])
