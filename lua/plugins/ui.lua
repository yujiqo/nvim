local ui = {}


ui.transparent = function()
    local transparent = require("transparent")

    transparent.setup({
        enable = true
    })
end


ui.devicons = function()
    local devicons = require("nvim-web-devicons")

    devicons.setup({
        override = {
            js = {
                icon = "",
                color = "#FFE800",
                name = "Js"
            },
            ts = {
                icon = "ﯤ",
                color = "#519aba",
                name = "Ts"
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
            tmux = { enabled = true }
        },
    })
end


ui.lualine = function()
    local lualine = require("lualine")

    lualine.setup({
        options = {
            icons_enabled = true,
            theme = "auto",
            component_separators = { left = "", right = ""},
            section_separators = { left = "", right = ""},
            disabled_filetypes = {
                statusline = {},
                winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = false,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            }
        },
        sections = {
            lualine_a = {},
            lualine_b = {"mode", "branch", "diff", "diagnostics"},
            lualine_c = {"filename"},
            lualine_x = {"searchcount", "filetype"},
            lualine_y = {"location"},
            lualine_z = {}
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {"filename", "filetype"},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {}
        }
    })
end


ui.cosmic = function()
    local cosmic = require("cosmic-ui")

    cosmic.setup({
        rename = {
            border = {
                highlight = "FloatBorder",
                style = "rounded",
                title = " Rename ",
                title_align = "left",
                title_hl = "FloatBorder",
            },
            prompt = " ",
            prompt_hl = "Comment"
        }
    })
end


return ui
