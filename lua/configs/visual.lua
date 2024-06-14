local M = {}

M.devicons = function()
  local devicons = require "nvim-web-devicons"

  devicons.setup {
    override = {
      js = { icon = "󰌞", color = "#FFE801", name = "Js" },
      ts = { icon = "󰛦", color = "#037ffc", name = "Ts" },
      rs = { icon = "", color = "#ff6b6b", name = "Rs" }
    }
  }
end

M.indent = function()
  local indent = require "ibl"

  indent.setup {
    indent = { char = "▏", highlight = "LineNr" },
    scope = { enabled = false }
  }
end

M.tint = function()
  local tint = require "tint"

  tint.setup { tint = -30, saturation = 0.3 }
end

M.twilight = function()
  local twilight = require "twilight"

  twilight.setup {
    dimming = {
      alpha = 0.50,
      color = { "Normal", "#ffffff" },
      term_bg = "#000000",
      inactive = true,
    },
    context = 5,
    treesitter = true,
    expand = {
      "function",
      "method",
      "table",
      "if_statement",
    },
    exclude = {}
  }
end

M.zen_mode = function()
  local zen_mode = require "zen-mode"

  zen_mode.setup {
    window = { backdrop = 0.90, width = 99999, height = 1 },
    plugins = {
      options = {
        enabled = false,
        ruler = false,
        showcmd = false
      },
      twilight = { enabled = true },
      gitsigns = { enabled = false },
      tmux = { enabled = false }
    },
  }
end

M.staline = function()
  local staline = require "staline"
  local signs = require "utils".diagnostic_signs

  staline.setup {
    defaults = {
      true_colors = true, line_column = " [%l/%L] :%c  " },
      mode_colors = {
        n = "#cccccc",
        i = "#ffb900",
        c = "#ff6b6b",
        v = "#6b6bff",
        V = "#6b6bff"
      },
      sections = {
        left = { 'file_name', ' ', 'lsp', ' ', 'branch' },
        mid = {},
        right = { 'line_column' }
      },
      inactive_sections = {
        left = { 'file_name' },
        mid = {},
        right = {}
      },
      lsp_symbols = {
        Error = signs.Error,
        Info = signs.Info,
        Warn = signs.Warn,
        Hint = signs.Hint,
      }
    }
  end

  return M
