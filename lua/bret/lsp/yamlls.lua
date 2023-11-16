local default_schemas = nil
local status_ok, jsonls_settings = pcall(require, "nlspsettings.jsonls")
if status_ok then
  default_schemas = jsonls_settings.get_default_schemas()
end

local schemas = {
  {
    description = "Hugo",
    fileMatch = { "config.yaml" },
    url = "https://json.schemastore.org/hugo.json",
  }
}

local function extend(tab1, tab2)
  for _, value in ipairs(tab2 or {}) do
    table.insert(tab1, value)
  end
  return tab1
end

local extended_schemas = extend(schemas, default_schemas)

local opts = {
  settings = {
    yaml = {
      schemas = {
        ["https://www.schemastore.org/api/json/catalog.json"] = "/*config.yaml",
      },
    },
  },
}

return opts
