vim.cmd([[
  set cc=80
]])

return {
  -- theme
  {
    "craftzdog/solarized-osaka.nvim",
    opts = {
      transparent = true,
    },
  },

  -- load theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "solarized-osaka",
    },
  },
}
