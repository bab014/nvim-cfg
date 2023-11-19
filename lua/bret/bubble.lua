local M = {
  dir = "~/repos/neovim_plugins/bubble.nvim",
}

function M.config()
  require("bubble").setup({})
end

return M
