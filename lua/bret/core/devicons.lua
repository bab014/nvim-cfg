local status_ok, devicons = pcall(require, "nvim-web-devicons")
if not status_ok then
  return
end

devicons.setup {
 override = {
    -- Golang
    go = {
      icon = "",
      color = "#00ADD8",
      name = "Go",
    },
    ["go.mod"] = {
      icon = "",
      color = "#CE3262",
      name = "GoMod",
    },
    ["go.sum"] = {
      icon = "",
      color = "#CE3262",
      name = "GoMod",
    },
    gohtml = {
      icon = "ﳑ",
      color = "#5DC9E2",
      name = "GoHtml",
    },
    -- ReadMe
    ["README.md"] = {
      icon = "",
      color = "#3468ff",
      name = "ReadMe",
    },
    -- Markdown
    md = {
      icon = "",
      color = "#3468ff",
      name = "Markdown",
    },
    -- Yaml
    yaml = {
      icon = "",
      color = "#ff7081",
      name = "Yaml",
    },
    -- Sql
    sql = {
      icon = "",
      color = "#ffe300",
      name = "Sql",
    },
    -- Git
    [".gitignore"] = {
      icon = "",
      color = "#F1502F",
      name = "GitIgnore",
    },
    [".git"] = {
      icon = "",
      color = "#F1502F",
      name = "GitConfig",
    },
  }
}
