-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
local status_ok, ibl = pcall(require, "ibl")
if not status_ok then
  return
end

ibl.setup {
  scope = {
    enabled = false
  }
}
