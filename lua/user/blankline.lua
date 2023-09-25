local status_ok, blankline = pcall(require, "indent_blankline")
if not status_ok then
  return
end


blankline.setup {
  -- example, context is off by default, use this to turn it on
  show_end_of_line = true,
  space_char_blankline = " ",
  buftype_exclude = { "terminal" },
  filetype_exclude = { "alpha", "NvimTree", "packer" }
}
