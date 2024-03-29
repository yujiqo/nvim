local configs = {}


configs.rose_pine = function()
    local rose_pine = require("rose-pine");

    rose_pine.setup {
        bold_vert_split = false,
        dim_nc_background = false,
        disable_background = true,
        disable_float_background = true,
        disable_italics = true,
    }
end


configs.catppuccin = function()
    local catppuccin = require("catppuccin")

    catppuccin.setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = {
            light = "latte",
            dark = "mocha",
        },
        transparent_background = true,
        no_italic = true,
        color_overrides = {},
        custom_highlights = {},
        integrations = {
            cmp = true,
            gitsigns = true,
            nvimtree = true,
            telescope = true,
            notify = false,
            mini = false,
        }
    })
end


return configs
