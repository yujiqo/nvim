local ui = {}


ui.devicons = function()
    local devicons = require("nvim-web-devicons")

    devicons.setup({
        override = {
            js = {
                icon = "󰌞",
                color = "#FFE801",
                name = "Js"
            },
            ts = {
                icon = "󰛦",
                color = "#037ffc",
                name = "Ts"
            },
            rs = {
                icon = "",
                color = "#ff6b6b",
                name = "Rs"
            }
        }
    })
end


ui.tint = function()
    local tint = require("tint")

    tint.setup({
        tint = -30,
        saturation = 0.3
    })
end


ui.twilight = function()
    local twilight = require("twilight")

    twilight.setup({
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
    })
end


ui.zen_mode = function()
    local zen_mode = require("zen-mode")

    zen_mode.setup({
        window = {
            backdrop = 0.90,
            width = 99999,
            height = 1
        },
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
    })
end


ui.staline = function()
    local staline = require("staline")
    local signs = require("utils").diagnostic_signs

    staline.setup({
        defaults = {
            true_colors = true
        },
        mode_colors = {
            n = "#cccccc",
            i = "#ffb900",
            c = "#ff6b6b",
            v = "#6b6bff",
            V = "#6b6bff"
        },
        sections = {
            left = { "- ", "-mode", "left_sep_double", "file_name", "file_size" },
            mid = { "lsp" },
            right = { "branch" , "right_sep_double", "-line_column" }
        },
        lsp_symbols = {
            Error = signs.Error,
            Info = signs.Info,
            Warn = signs.Warn,
            Hint = signs.Hint,
        }
    })
end


-- ui.lualine = function()
--     local lualine = require("lualine")
--
--     local colors = {
--         darkgray = "#16162d",
--         gray = "#cccccc",
--         innerbg = nil,
--         outerbg = "#16162D",
--         normal = "#8e9cd8",
--         insert = "#99bb6c",
--         visual = "#ffa067",
--         replace = "#e46877",
--         command = "#e7c384",
--     }
--
--     local diagnostic_signs = require("utils").diagnostic_signs
--
--     lualine.setup({
--         options = {
--             icons_enabled = true,
--             theme = {
--                 inactive = {
--                     a = { fg = colors.gray, bg = colors.outerbg, gui = "bold" },
--                     b = { fg = colors.gray, bg = colors.outerbg },
--                     c = { fg = colors.gray, bg = colors.innerbg },
--                 },
--                 visual = {
--                     a = { fg = colors.darkgray, bg = colors.visual, gui = "bold" },
--                     b = { fg = colors.gray, bg = colors.outerbg },
--                     c = { fg = colors.gray, bg = colors.innerbg },
--                 },
--                 replace = {
--                     a = { fg = colors.darkgray, bg = colors.replace, gui = "bold" },
--                     b = { fg = colors.gray, bg = colors.outerbg },
--                     c = { fg = colors.gray, bg = colors.innerbg },
--                 },
--                 normal = {
--                     a = { fg = colors.darkgray, bg = colors.normal, gui = "bold" },
--                     b = { fg = colors.gray, bg = colors.outerbg },
--                     c = { fg = colors.gray, bg = colors.innerbg },
--                 },
--                 insert = {
--                     a = { fg = colors.darkgray, bg = colors.insert, gui = "bold" },
--                     b = { fg = colors.gray, bg = colors.outerbg },
--                     c = { fg = colors.gray, bg = colors.innerbg },
--                 },
--                 command = {
--                     a = { fg = colors.darkgray, bg = colors.command, gui = "bold" },
--                     b = { fg = colors.gray, bg = colors.outerbg },
--                     c = { fg = colors.gray, bg = colors.innerbg },
--                 },
--             },
--             -- component_separators = { left = "", right = ""},
--             -- section_separators = { left = "", right = ""},
--             component_separators = { left = "", right = ""},
--             section_separators = { left = "", right = ""},
--             disabled_filetypes = {
--                 statusline = {},
--                 winbar = {},
--             },
--             ignore_focus = {},
--             always_divide_middle = true,
--             globalstatus = false,
--             refresh = {
--                 statusline = 1001,
--                 tabline = 1001,
--                 winbar = 1001,
--             }
--         },
--         sections = {
--             lualine_a = {},
--             lualine_b = {},
--             lualine_c = { "filename", {
--                 "diagnostics",
--                 sources = { "nvim_lsp" },
--                 sections = { 'error', 'warn', 'info', 'hint' },
--                 symbols = {
--                     error = diagnostic_signs.Error,
--                     warn = diagnostic_signs.Warn,
--                     info = diagnostic_signs.Info,
--                     hint = diagnostic_signs.Hint
--                 },
--             }, "branch", "diff" },
--             lualine_x = {},
--             lualine_y = {},
--             lualine_z = {}
--         },
--         inactive_sections = {
--             lualine_a = {},
--             lualine_b = {},
--             lualine_c = { "filename" },
--             lualine_x = {},
--             lualine_y = {},
--             lualine_z = {}
--         }
--     })
-- end


return ui
