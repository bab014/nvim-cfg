local M = {
  "ellisonleao/gruvbox.nvim",
}

function M.config()
  require("gruvbox").setup({
    italic = {
      strings = false,
    }
  })
end

return M
