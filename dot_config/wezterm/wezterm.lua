local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- theme
config.color_scheme = 'tokyonight'
config.hide_tab_bar_if_only_one_tab = true

-- font
config.font = wezterm.font 'Departure Mono'
config.font_size = 22.0

return config
