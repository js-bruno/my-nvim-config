local status_ok, blankline = pcall(require, "ibl")
if not status_ok then
  return
end


blankline.setup {
  char = '│',
  space_char_blankline = ' ',
  show_current_context = true,
  show_current_context_start = false,
  use_treesitter = true,
  buftype_exclude = { "terminal" },
  filetype_exclude = { "alpha", "NvimTree", "packer" }
}
