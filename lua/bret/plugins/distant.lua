local status_ok, distant = pcall(require, "distant")
if not status_ok then
  return
end

distant.setup({
  ["*"] = require("distant.settings").chip_default()
})
