local utils = {}


utils.parsers = {
    "astro", "bash", "c", "cpp", "cmake", "css",
    "dockerfile", "gitignore", "html",
    "htmldjango", "javascript", "json",
    "jsonc", "lua", "make", "markdown",
    "markdown_inline", "python", "regex",
    "rust", "scss", "sql", "toml", "tsx",
    "typescript", "vim", "yaml"
}

utils.servers = {
    "bashls", "clangd", "cmake",
    "cssls", "dockerls", "html",
    "jsonls", "tsserver", "lua_ls",
    "marksman", "pyright", "rust_analyzer",
    "sqlls", "taplo", "tailwindcss",
    "emmet_ls"
}

utils.server_configs = {
    lua_ls = function ()
        return {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true
                        }
                    }
                }
            }
        }
    end,
    emmet_ls = function ()
        return {
            filetypes = {
                "html", "typescriptreact" , "javascriptreact",
                "css", "sass", "scss", "less", "astro"
            }
        }
    end
}


utils.colorschemes = {
    light = "rose-pine-dawn",
    dark = "rose-pine-moon"
}


utils.load_colorschemes = function()
    local json = require("libs.json")
    local file = io.open("/home/yujiqo/.config/nvim/lua/__colorscheme__.json", "r")

    if file then
        local data = json.decode(file:read("*l"))

        io.close(file)

        vim.cmd(("colorscheme %s"):format(data.colorscheme))
    else
        file = io.open("/home/yujiqo/.config/nvim/lua/__colorscheme__.json", "w")

        local data = json.encode({
            colorscheme = utils.colorschemes.dark
        })

        if file then
            file:write(data)
        end

        io.close(file)

        vim.cmd(("colorscheme %s"):format(utils.colorschemes.dark))
    end
end


utils.toggle_colorscheme = function()
    local json = require("libs.json")
    local file = io.open("/home/yujiqo/.config/nvim/lua/__colorscheme__.json", "r")

    if file then
        local data = json.decode(file:read("*l"))

        io.close(file)

        if data.colorscheme == utils.colorschemes.dark then
            data.colorscheme = utils.colorschemes.light
        else
            data.colorscheme = utils.colorschemes.dark
        end

        file = io.open("/home/yujiqo/.config/nvim/lua/__colorscheme__.json", "w")

        if file then
            file:write(json.encode(data))
            io.close(file)
        end

        vim.cmd(("colorscheme %s"):format(data.colorscheme))
    end
end


utils.setup_plugin = function(setup_type, setup_name, plugin_category)
    if setup_type == "d" then
        return load(('require("%s").setup()'):format(setup_name))
    elseif setup_type == "c" and plugin_category then
        return load(('require("configs.%s").%s()'):format(plugin_category, setup_name))
    end
end


utils.alpha = function()
    return string.format("%x", math.floor(255 * vim.g.neovide_transparency or 0.9))
end


utils.diagnostic_signs = {
    Error = " ",
    Warn  = " ",
    Hint  = " ",
    Info  = " ",
    other = "﫠"
}


utils.lsp_icons = {
    Text = " ", Method = " ", Function = " ", Constructor = " ", Field = " ",
    Variable = " ", Class = " ", Interface = " ", Module = " ", Property = " ",
    Unit = " ", Value = " ", Enum = " ", Keyword = " ", Snippet = " ",
    Color = " ", File = " ", Reference = " ", Folder = " ", EnumMember = " ",
    Constant = " ", Struct = " ", Event = " ", Operator = " ", TypeParameter = " "
}


utils.todo_icons = {
    note = " ",
    todo = "﫠",
    warn = " ",
    fix = " "
}


utils.set_borders_color = function ()
    local set_hl = vim.api.nvim_set_hl

    set_hl(0, "FloatBorder", { bg="none", fg="#787878" })
    set_hl(0, "NormalFloat", { bg="none", fg="#787878" })
    set_hl(0, "TelescopeBorder", { bg="none", fg="#787878" })
end


utils.set_neovide_options = function ()
    local g = vim.g
    local o = vim.o
    local map = vim.keymap.set

    if g.neovide then
        o.guifont = "SFMono Nerd Font:h16"

        g.neovide_transparency = 0.9
        g.neovide_scale_factor = 1.0

        local change_scale_factor = function(delta)
            g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
        end

        map("n", "<C-=>", function() change_scale_factor(2.25) end)
        map("n", "<C-->", function() change_scale_factor(2/1.25) end)
    end
end


return utils
