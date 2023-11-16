local M = {
  "navarasu/onedark.nvim",
  lazy = false,
  priority = 1000,
}

function M.config()
  require('onedark').setup {
    -- Main options --
    style = 'deep', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = false,  -- Show/hide background
  }
  vim.cmd([[colorscheme onedark]])
end

return M
