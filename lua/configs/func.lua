local M = {}

M.todo_comments = function()
  local todo = require "todo-comments"
  local icons = require "utils".todo_icons

  todo.setup {
    signs = false,
    keywords = {
      NOTE = { icon = icons.note, color = "hint" },
      TODO = { icon = icons.todo, color = "info" },
      WARN = { icon = icons.warn, color = "warning" },
      FIX = { icon = icons.fix, color = "error" }
    },
    colors = {
      hint = { "DiagnosticHint", "#1aaaaa" },
      info = { "DiagnosticInfo", "#6b6bff" },
      warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
      error = { "DiagnosticError", "ErrorMsg", "#ff6b6b" }
    },
  }
end

M.bufferline = function()
  local bufferline = require "bufferline"
  local common_highlight = { fg = "#858585", bg = "none" }
  local selected_highlight = { fg = "#cccccc", bg = "none" }

  bufferline.setup {
    highlights = {
      fill = common_highlight,
      background = common_highlight,
      tab = common_highlight,
      numbers = common_highlight,
      tab_selected = selected_highlight,
      numbers_selected = selected_highlight,
    },
    options = {
      style_preset = bufferline.style_preset.no_italic,
      mode = "tabs",
      numbers = "none",
      modified_icon = "",
      tab_size = 8,
      diagnostics = "nvim_lsp",
      show_buffer_icons = false,
      show_buffer_close_icons = false,
      show_close_icon = false,
      show_tab_indicators = true,
      show_duplicate_prefix = true,
      separator_style = { "", "" },
      always_show_bufferline = false,
      indicator = { style = "none" },
      over = { enabled = false },
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "center"
        }
      }
    }
  }
end

M.treesitter = function()
  local nvim_treesitter = require "nvim-treesitter.configs"
  local parsers = require "utils".parsers

  nvim_treesitter.setup {
    ensure_installed = parsers,
    highlight = { enable = true },
    autotag = { enable = true }
  }
end

M.telescope = function()
  local telescope = require "telescope"

  telescope.setup {
    defaults = {
      prompt_prefix = "   ", selection_caret = " ",
      sorting_strategy = "ascending",
      layout_config = { prompt_position = "top" }
    },
    extensions = {
      file_browser = {
        hijack_netrw = true,
        git_status = false
      }
    }
  }

  telescope.load_extension "file_browser"
end

M.trouble = function()
  local trouble = require "trouble"

  trouble.setup { icons = false, use_diagnostic_signs = true }
end

M.comment = function()
  local comment = require "Comment"
  local ts_context_commentstring = require "ts_context_commentstring.integrations.comment_nvim"

  comment.setup { pre_hook = ts_context_commentstring.create_pre_hook() }
end

return M
