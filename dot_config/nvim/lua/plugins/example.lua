return {
  -- I need a black background theme so my eyes are not tortured when coding.
  { "dasupradyumna/midnight.nvim", lazy = false, priority = 1000 },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "midnight",
    },
  },

  -- Disable inlay hints cuz they suck
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = true,
        exclude = { "rust" },
      },
    },
  },
}
