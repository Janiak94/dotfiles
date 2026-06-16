-- return {
--   "https://codeberg.org/esensar/nvim-dev-container",
--   dependencies = "nvim-treesitter/nvim-treesitter",
--   opts = {
--     container_runtime = "/Applications/Docker.app/Contents/Resources/bin/docker",
--   },
-- }

return {
  "https://codeberg.org/esensar/nvim-dev-container",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {
    attach_mounts = {
      neovim_config = {
        enabled = true,
        options = { "readonly" },
      },
      neovim_data = {
        enabled = true,
        options = {},
      },
    },
  },
}
