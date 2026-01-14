return {
  "folke/snacks.nvim",
  opts = {
    terminal = {
      win = {
        position = "float",
        border = "rounded",
        width = 0.9,
        height = 0.9,
      },
    },
    ---@module "Snacks"
    ---@type snacks.picker.Config
    picker = {
      -- ui_select = false,
      sources = {
        -- The explorer is a floating window
        -- explorer = {
        --   layout = {
        --     { preview = true },
        --     layout = {
        --       box = "horizontal",
        --       width = 0.8,
        --       height = 0.8,
        --       {
        --         box = "vertical",
        --         border = "rounded",
        --         title = "{source} {live} {flags}",
        --         title_pos = "center",
        --         { win = "input", height = 1, border = "bottom" },
        --         { win = "list", border = "none" },
        --       },
        --       { win = "preview", border = "rounded", width = 0.7, title = "{preview}" },
        --     },
        --   },
        -- },
        -- Right sidebar
        -- explorer = {
        -- layout = {
        --   preset = "sidebar",
        --   preview = "main",
        --   layout = { position = "right" },
        -- },
        explorer = {
          on_show = function(picker)
            local show = false
            local gap = 1
            local clamp_width = function(value)
              return math.max(20, math.min(100, value))
            end
            --
            local position = picker.resolved_layout.layout.position
            local rel = picker.layout.root
            local update = function(win) ---@param win snacks.win
              local border = win:border_size().left + win:border_size().right
              win.opts.row = vim.api.nvim_win_get_position(rel.win)[1]
              win.opts.height = 0.8
              if position == "left" then
                win.opts.col = vim.api.nvim_win_get_width(rel.win) + gap
                win.opts.width = clamp_width(vim.o.columns - border - win.opts.col)
              end
              if position == "right" then
                win.opts.col = -vim.api.nvim_win_get_width(rel.win) - gap
                win.opts.width = clamp_width(vim.o.columns - border + win.opts.col)
              end
              win:update()
            end
            local preview_win = Snacks.win.new({
              relative = "editor",
              external = false,
              focusable = false,
              border = "rounded",
              backdrop = false,
              show = show,
              bo = {
                filetype = "snacks_float_preview",
                buftype = "nofile",
                buflisted = false,
                swapfile = false,
                undofile = false,
              },
              on_win = function(win)
                update(win)
                picker:show_preview()
              end,
            })
            rel:on("WinLeave", function()
              vim.schedule(function()
                if not picker:is_focused() then
                  picker.preview.win:close()
                end
              end)
            end)
            rel:on("WinResized", function()
              update(preview_win)
            end)
            picker.preview.win = preview_win
            picker.main = preview_win.win
          end,
          on_close = function(picker)
            picker.preview.win:close()
          end,
          layout = {
            preset = "sidebar",
            preview = false, ---@diagnostic disable-line
            layout = { position = "right" },
          },
          actions = {
            -- `<A-p>`
            toggle_preview = function(picker) --[[Override]]
              picker.preview.win:toggle()
            end,
          },
        },
      },
    },
  },
}
