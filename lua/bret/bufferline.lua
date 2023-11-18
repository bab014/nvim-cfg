local M = {
  "akinsho/bufferline.nvim"
}

function M.config()
  require("bufferline").setup({
    options = {
      offsets = {
        {
          filetype = "NvimTree",
          text = function()
            return "NvimTree"
          end,
          text_align = "left",
          separator = true
        }
      }
    }
  })
end

return M
