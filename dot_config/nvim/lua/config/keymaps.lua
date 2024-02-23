-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local mapll = function(mode, keys, cmd, desc)
  vim.keymap.set(mode, "<localleader>" .. keys, cmd, { desc = desc })
end

mapll("n", "s", "vip:sort<cr>", "Sort Paragraph")
mapll("n", "t", "!!date<cr>", "Insert Date")
