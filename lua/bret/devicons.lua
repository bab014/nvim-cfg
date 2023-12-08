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
      },
      ["package.json"] = {
        icon = "󰎙",
        color = "#6cc24a",
        name = "PackageJson"
      },
      ["package-lock.json"] = {
        icon = "󰎙",
        color = "#6cc24a",
        name = "PackageLockJson"
      },
      ["tailwind.config.js"] = {
        icon = "󱏿",
        color = "#06b6d4",
        name = "Tailwind"
      },
      js = {
        icon = "",
        color = "#f0db4f",
        name = "Js"
      },
      json = {
        icon = "󰘦",
        color = "#f0db4f",
        name = "Json"
      }
    }
  }
}

return M
