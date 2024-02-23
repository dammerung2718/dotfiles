vim.cmd([[
  set cc=80
]])

return {
  -- theme
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      styles = {
        bold = true,
        italic = true,
        transparency = false,
      },
    },
  },

  -- load theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },

  -- language servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rust_analyzer = {},
        gopls = {},
        clangd = {
          cmd = { "clangd", "--offset-encoding=utf-16" },
        },
      },
    },
  },
}
