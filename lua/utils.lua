local utils = {}


utils.setup_theme = function(setup_type, setup_name)
    if setup_type == "d" then
        return load(('vim.cmd[[colorscheme %s]]'):format(setup_name))
    elseif setup_type == "c" then
        return load(('require("configs.theme").%s()'):format(setup_name))
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


return utils
