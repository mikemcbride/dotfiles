-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
  return
end

indent_blankline.setup {
  show_trailing_blankline_indent = false,
  show_end_of_line = false,
}
