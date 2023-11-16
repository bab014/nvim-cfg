local M = {}

local highlights = {
  { "StatusLineBase", { bg = "#2a324a", fg = "#93a4c3", ctermbg = 15 }},
  { "StAccent", { bg = "#6c7d9c", fg = "#0c0e15", bold = true, ctermfg = 1, ctermbg = 15 }},
  { "StVisAccent", { bg = "#41a7fc", fg = "#141b24", bold = true, ctermfg = 1, ctermbg = 15 }},
  { "StInsAccent", { bg = "#8bcd5b", fg = "#27341c", bold = true, ctermfg = 1, ctermbg = 15 }},
  { "StSelAccent", { bg = "#dd9046", fg = "#8f610d", bold = true, ctermfg = 1, ctermbg = 15 }},
  { "StComAccent", { bg = "#f65866", fg = "#992525", bold = true, ctermfg = 1, ctermbg = 15 }},
}


M.setup = function()
  for _, highlight in ipairs(highlights) do
    vim.api.nvim_set_hl(0, highlight[1], highlight[2])
  end
end

return M
