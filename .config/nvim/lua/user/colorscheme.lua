vim.g.gruvbox_italic = 1

local colorscheme = "gruvbox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
