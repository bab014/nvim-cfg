require("bret.me.colors").setup()

local M = {}

local function filepath()
  local fpath = vim.fn.fnamemodify(vim.fn.expand "%", ":~:.:h")
  if fpath == "" or fpath == "." then
    return " "
  end

  return string.format(" %%<%s/", fpath)
end

local function filename()
  local fname = vim.fn.expand "%:t"
  if fname == "" then
      return ""
  end
  return fname .. " "
end

local function getFileType()
  local ftype = vim.bo.filetype
  if not require("nvim-web-devicons").has_loaded() then
    require("nvim-web-devicons").setup()
  end

  local icon, icolor = require("nvim-web-devicons").get_icon_color_by_filetype(ftype, {})
  if icon == nil then
    return ""
  end
  vim.api.nvim_set_hl(0, "StatusIconColor", { fg = icolor, bg = "#2a324a" })

  return "%#StatusIconColor#" .. icon .. " " .. ftype .. "%#StatusLineBase#"
end

local function getMode()
  local modes = {
    ["n"] = { "NORMAL", "%#StAccent#" },
    ["no"] = { "NORMAL", "%#StAccent#" },
    ["v"] = {"VISUAL", "%#StVisAccent#"},
    ["V"] = {"VISUAL LINE", "%#StVisAccent#"},
    ["CTRL-V"] = {"VISUAL BLOCK", "%#StVisAccent#"},
    ["s"] = {"SELECT", "%#StSelAccent#"},
    ["S"] = {"SELECT LINE", "%#StSelAccent#"},
    ["CTRL-S"] = {"SELECT BLOCK", "%#StSelAccent#"},
    ["i"] = {"INSERT", "%#StInsAccent#"},
    ["ic"] = {"INSERT", "%#StInsAccent#"},
    ["R"] = {"REPLACE", "%#StAccent#"},
    ["Rv"] = {"VISUAL REPLACE", "%#StAccent#"},
    ["c"] = {"COMMAND", "%#StComAccent#"},
    ["cv"] = {"VIM EX", "%#StComAccent#"},
    ["ce"] = {"EX", "%#StComAccent#"},
    ["r"] = {"PROMPT", "%#StAccent#"},
    ["rm"] = {"MOAR", "%#StAccent#"},
    ["r?"] = {"CONFIRM", "%#StAccent#"},
    ["!"] = {"SHELL", "%#StAccent#"},
    ["t"] = {"TERMINAL", "%#StAccent#"},
  }
  local mode = vim.api.nvim_get_mode()["mode"]
  return modes[mode][2] .. " " .. modes[mode][1]
end

local function lineinfo()
  if vim.bo.filetype == "alpha" then
    return ""
  end
  return " %p%% ln:%l col:%c "
end

function M.statusline()
  local parts = { 
    -- left
    getMode(),
    "%#StatusLineBase#",
    -- middle
    "%M",
    "%=",
    "%f",
    -- right
    "%=",
    getFileType(),
    lineinfo()
  }

  return table.concat(parts, " ")
end

return M
