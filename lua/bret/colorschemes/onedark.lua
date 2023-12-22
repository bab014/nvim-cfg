local M = {
  "navarasu/onedark.nvim",
  lazy = false,
}

function M.config()
  require('onedark').setup {
    -- Main options --
    style = 'deep', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = false,  -- Show/hide background
  }
end

return M
