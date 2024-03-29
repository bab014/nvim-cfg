local M = {
  "ray-x/go.nvim",
  dependencies = {  -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  event = {"CmdlineEnter", "BufEnter *.gohtmltmpl"},
  ft = { "go", "gomod", "gohtmltmpl" },
  build = ':lua require("go.install").update_all_sync()'
}

function M.config()
  require("go").setup()
end

return M
