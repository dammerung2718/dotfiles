-- DESCRIPTION
-- Format on save.

return {
  'stevearc/conform.nvim',
  lazy = false,
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      rust = { "rustfmt", lsp_format = "fallback" },
      python = { "black", lsp_format = "fallback" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  }
}
