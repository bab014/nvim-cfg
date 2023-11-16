local M = {
  "nvim-tree/nvim-web-devicons",
  lazy = false,
  priority = 1000,
  opts = {
    override = {
      -- Golang
      go = {
        icon = "",
        color = "#00ADD8",
        name = "Go",
      },
      ["go.mod"] = {
        icon = "",
        color = "#CE3262",
        name = "GoMod",
      },
      ["go.sum"] = {
        icon = "",
        color = "#CE3262",
        name = "GoMod",
      },
      gohtml = {
        icon = "",
        color = "#5DC9E2",
        name = "GoHtml",
      },
      java = {
        icon = "󰅶",
        color = "#cc0000",
        name = "Java",
      },
      class = {
        icon = "󰅶",
        color = "#4361ee",
        name = "Class",
      },
      [".gitignore"] = {
        icon = "",
        color = "#f1502f",
        name = "Git"
      }
    }
  }
}

return M
