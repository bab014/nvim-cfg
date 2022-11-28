local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local hl_str = function(str, hl)
  return "%#" .. hl .. "#" .. str .. "%*"
end

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = " ", warn = " " },
  colored = false,
  update_in_insert = false,
  always_visible = true,
}

local diff = {
  "diff",
  colored = true,
  symbols = { added = " ", modified = " ", removed = " " },
  cond = hide_in_width,
}

local mode = {
  "mode",
  fmt = function(str)
    return "-- " .. str .. " --"
  end,
}

local filetype = {
  "filetype",
  icons_enabled = false,
  icon = nil,
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = "",
}

local location = {
  "location",
  padding = 0,
}

local go_version = {
  function ()
    if vim.bo.filetype == "go" then
      return vim.fn.system("go version | awk '{print $3}' | tr '\t' ' '")
    else
      return ""
    end
  end,
  padding = 0,
}

local language_server = {
  function()
    local ignore_clients = { "null-ls", "copilot" }
    local clients = vim.lsp.buf_get_clients()
    local client_names = {}

    for _, client in ipairs(clients) do
      if client.name ~= "copilot" then
        table.insert(client_names, client.name)
      end
    end

    local client_names_str = table.concat(client_names, ", ")
    local client_names_str_len = string.len(client_names_str)

    if client_names_str_len == 0 then
      return "nothing"
    else
      local formatted_return = " " .. client_names_str
      return formatted_return
    end

  end,
  padding = 1,
}


local progress = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
	return chars[index]
end

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "|" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "Outline", "Lexplore" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { branch, diagnostics },
		lualine_c = { diff },
		-- lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_x = { { "filetype", icon_only = true }, language_server, { "copilot", color = { fg = "#8bcd5b"} } },
		lualine_y = { location },
		lualine_z = {},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
