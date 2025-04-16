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

M.neotree = function()
  local neotree = require "neo-tree"

  neotree.setup({
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,
    default_component_configs = {
      indent = {
        indent_size = 2,
        padding = 1,
        with_markers = true,
        indent_marker = "│",
        last_indent_marker = "└",
        with_expanders = nil,
        expander_collapsed = "",
        expander_expanded = "",
      },
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "󰜌",
      },
      -- git_status = {
      --   symbols = {
      --     -- Change type
      --     added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
      --     modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
      --     deleted = "✖", -- this can only be used in the git_status source
      --     renamed = "󰁕", -- this can only be used in the git_status source
      --     -- Status type
      --     untracked = "",
      --     ignored = "",
      --     unstaged = "󰄱",
      --     staged = "",
      --     conflict = "",
      --   },
      -- },
      file_size = {
        enabled = true,
        width = 12, -- width of the column
        required_width = 64, -- min width of window required to show this column
      },
      type = {
        enabled = true,
        width = 10, -- width of the column
        required_width = 122, -- min width of window required to show this column
      },
      last_modified = {
        enabled = false,
        width = 20, -- width of the column
        required_width = 88, -- min width of window required to show this column
      },
      created = {
        enabled = false,
        width = 20, -- width of the column
        required_width = 110, -- min width of window required to show this column
      },
    },
    window = {
      position = "left",
      width = 40,
      mapping_options = {
        noremap = true,
        nowait = true,
      },
      mappings = {
        ["<space>"] = {
          "toggle_node",
          nowait = false,
        },
        ["<cr>"] = "open",
        ["<esc>"] = "cancel", -- close preview or floating neo-tree window
        ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
        ["a"] = {
          "add",
          config = {
            show_path = "none", -- "none", "relative", "absolute"
          },
        },
        ["A"] = "add_directory",
        ["d"] = "delete",
        ["r"] = "rename",
        ["y"] = "copy_to_clipboard",
        ["x"] = "cut_to_clipboard",
        ["p"] = "paste_from_clipboard",
        ["q"] = "close_window",
        ["R"] = "refresh",
        ["?"] = "show_help",
        ["<"] = "prev_source",
        [">"] = "next_source",
        ["i"] = "show_file_details",
      },
      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = true,
          hide_gitignored = true,
          hide_hidden = true,
          hide_by_name = {
            --"node_modules"
          },
          hide_by_pattern = {
            --"*.meta",
            --"*/src/*/tsconfig.json",
          },
          always_show = {
            --".gitignored",
          },
          always_show_by_pattern = {
            --".env*",
          },
          never_show = {
            --".DS_Store",
            --"thumbs.db"
          },
          never_show_by_pattern = {
            --".null-ls_*",
          },
        },
        follow_current_file = {
          leave_dirs_open = false,
        },
        group_empty_dirs = false,
        hijack_netrw_behavior = "open_default",
        use_libuv_file_watcher = false,
        window = {
          mappings = {
            ["."] = "set_root",
            ["H"] = "toggle_hidden",
            ["/"] = "fuzzy_finder",
            ["D"] = "fuzzy_finder_directory",
          },
          fuzzy_finder_mappings = {
            ["<down>"] = "move_cursor_down",
            ["<C-n>"] = "move_cursor_down",
            ["<up>"] = "move_cursor_up",
            ["<C-p>"] = "move_cursor_up",
            ["<esc>"] = "close",
          },
        },
      },
    }})
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
