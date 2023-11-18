local M = {
  "NvChad/nvim-colorizer.lua",
  event = { "BufReadPost", "BufNewFile" },
}

function M.config()
  require("colorizer").setup {
    filetypes = {
      "python",
      "typescript",
      "javascript",
      "css",
      "html",
      "lua"
    },
    user_default_options = {
      names = false,
      rgb_fn = true,
      tailwind = "both",
    },
    buftypes = {}
  }
end

return M
