local M = {
  "bab014/nordplus.nvim",
  branch = "main",
  lazy = false,
  priority = 1000,
}

function M.config()
  vim.g.nord_contrast = true
  vim.g.nord_borders = true
  vim.g.nord_italic = false
  vim.cmd[[colorscheme nord]]
end

return M
