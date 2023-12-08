local M = {
  "gbprod/nord.nvim",
  lazy = false,
}

function M.config()
  require("nord").setup({})
end

return M
