local state = require("config.state")
return {
  string.format("%s/%s", state.user, state.theme .. ".nvim"),
  name=state.theme,
  lazy = false,
  priority = 1000,
  config = function()
      vim.cmd("colorscheme " .. state.theme)
  end
}
