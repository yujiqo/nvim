local misc = {}


misc.todo_comments = function()
    local todo = require("todo-comments")
    local icons = require("utils").todo_icons

    todo.setup({
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
    })
end


misc.bufferline = function()
    local bufferline = require("bufferline")

    bufferline.setup({
        highlights = {
            fill = {
                fg = "#4c4c4c"
            },
            background = {
                fg = "#4c4c4c"
            },
            tab = {
                fg = "#4c4c4c"
            },
            buffer_selected = {
                fg = "#cccccc",
                italic = false
            },
            numbers_selected = {
                fg = "#cccccc",
                italic = false
            },
            diagnostic_selected = {
                italic = false
            },
            hint_selected = {
                italic = false
            },
            hint_diagnostic_selected = {
                italic = false
            },
            info_selected = {
                italic = false
            },
            info_diagnostic_selected = {
                italic = false
            },
            warning_selected = {
                italic = false
            },
            warning_diagnostic_selected = {
                italic = false
            },
            error_selected = {
                italic = false
            },
            error_diagnostic_selected = {
                italic = false
            },
        },
        options = {
            mode = "tabs",
            numbers = "none",
            modified_icon = "●",
            tab_size = 8,
            diagnostics = "nvim_lsp",
            show_buffer_icons = true,
            show_buffer_close_icons = false,
            show_close_icon = false,
            show_tab_indicators = true,
            show_duplicate_prefix = true,
            separator_style = { "", "" },
            always_show_bufferline = false,

            indicator = {
                style = "none"
            },

            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    text_align = "center"
                }
            },

            hover = {
                enabled = false
            }
        }
    })
end


misc.gitsigns = function()
    local gitsigns = require("gitsigns")

    gitsigns.setup({
        signcolumn = false
    })
end


misc.treesitter = function()
    local nvim_treesitter = require("nvim-treesitter.configs")

    nvim_treesitter.setup({
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false
        }
    })
end


misc.telescope = function()
    local telescope = require("telescope")

    telescope.setup({
        defaults = {
            prompt_prefix = "   ", selection_caret = " ",
            sorting_strategy = "ascending",
            layout_config = { prompt_position = "top" }
        },
        extensions = {
            file_browser = {
                hijack_netrw = true
            }
        }
    })

    telescope.load_extension("file_browser")
end


return misc
