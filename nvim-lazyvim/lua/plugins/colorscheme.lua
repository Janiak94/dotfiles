return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      -- transparent_background = true,
      flavour = "mocha",
      dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      no_italic = true,
      float = {
        transparent = true,
      },
      -- term_colors = true,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
      transparent = true,
    },
  },
}
