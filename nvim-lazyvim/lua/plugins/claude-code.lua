local toggle_key = "<M-,>"
return {
  "coder/claudecode.nvim",
  keys = { { toggle_key, "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude", mode = { "n", "v" } } },
  opts = function(_, opts)
    opts.terminal = {
      ---@module "snacks"
      ---@type snacks.win.Config|{}
      snacks_win_opts = {
        position = "float",
        width = 0.9,
        height = 0.9,
        keys = {
          claude_hide = {
            toggle_key,
            function(self)
              self:hide()
            end,
            mode = "t",
            desc = "Hide",
          },
        },
      },
    }
  end,
}
