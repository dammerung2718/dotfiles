return {
  "supermaven-inc/supermaven-nvim",
  lazy = false,
  config = function()
    local supermaven = require("supermaven-nvim")
    supermaven.setup({
      keymaps = {
        accept_suggestion = "<Tab>",
        clear_suggestion = "<C-]>",
        accept_word = "<C-j>",
      },
    })
  end,
}
