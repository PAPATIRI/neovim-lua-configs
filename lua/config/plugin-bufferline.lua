local status, bufferline = pcall(require, "bufferline")
if not status then
  return
end

bufferline.setup{
  options = {
    indicator = {
        icon = '|', -- this should be omitted if indicator style is not 'icon'
        style = 'underline', -- | 'icon' | 'none',
    },
    max_name_length = 13,
    max_prefix_length = 8,
    diagnostics = "nvim_lsp",
    separator_style = "thin",
    offsets = {
        {
            filetype = "neo-tree",
            text = "File Explorer",
            text_align = "center",
            separator = true,
        }
    },
  }
}
