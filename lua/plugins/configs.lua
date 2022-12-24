local M = {}


M.tokyonight = function()
    vim.cmd([[colorscheme tokyonight-storm]])
end


M.dashboard = function()
    local dashboard = require("dashboard")

    dashboard.custom_header = {
        "                                                   ",
        "                                                   ",
        "                                                   ",
        "                                                   ",
        "                                                   ",
        "                                                   ",
        "                                                   ",
        " ██▓ ███▄ ▄███▓ ██▀███   ██▒   █▓ ██▀███    ██████ ",
        "▓██▒▓██▒▀█▀ ██▒▓██ ▒ ██▒▓██░   █▒▓██ ▒ ██▒▒██    ▒ ",
        "▒██▒▓██    ▓██░▓██ ░▄█ ▒ ▓██  █▒░▓██ ░▄█ ▒░ ▓██▄   ",
        "▒██▒▓██    ▓██░▓██ ░▄█ ▒ ▓██  █▒░▓██ ░▄█ ▒░ ▓██▄   ",
        "░██░▒██    ▒██ ▒██▀▀█▄    ▒██ █░░▒██▀▀█▄    ▒   ██▒",
        "░██░▒██▒   ░██▒░██▓ ▒██▒   ▒▀█░  ░██▓ ▒██▒▒██████▒▒",
        "░▓  ░ ▒░   ░  ░░ ▒▓ ░▒▓░   ░ ▐░  ░ ▒▓ ░▒▓░▒ ▒▓▒ ▒ ░",
        " ▒ ░░  ░      ░  ░▒ ░ ▒░   ░ ░░    ░▒ ░ ▒░░ ░▒  ░ ░",
        " ▒ ░░      ░     ░░   ░      ░░    ░░   ░ ░  ░  ░  ",
        " ░         ░      ░           ░     ░           ░  ",
        "                             ░                     "
    }

    dashboard.custom_center = {
        {icon = ' ',
        desc = ' ',
        action = 'qa',
        shortcut = ' '},
    }
end


M.transparent = function()
    local transparent = require("transparent")

    transparent.setup {
        enable = true
    }
end


M.devicons = function()
    local devicons = require("nvim-web-devicons")

    devicons.setup({
        override = {}
    })
end


M.staline = function()
    local staline = require("staline")

    staline.setup({
        defaults = {
            true_colors = true,
            line_column = " [%l/%L] :%c  ",
            branch_symbol = " ",
            left_separator = "",
            right_separator = "",
        },
        mode_colors = {
            n = "#6b6bff",
            i = "#ff6b6b",
            c = "#FF855D",
            v = "#ABFF4B",
        },
        sections = {
            left = { '- ', '-mode', 'left_sep_double', 'file_name', ' ', 'branch' },
            mid  = { 'lsp' },
            right = { 'right_sep_double', '-line_column' },
        }
    })
end


M.bufferline = function()
    local bufferline = require("bufferline")

    bufferline.setup {
        options = {
            mode = "tabs",
            numbers = "none",
            indicator = {
                style = "underline"
            },
            buffer_close_icon = '',
            modified_icon = '●',
            close_icon = '',
            left_trunc_marker = '',
            right_trunc_marker = '',
            tab_size = 20,
            diagnostics = "nvim_lsp",
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    text_align = "center",
                }
            },
            show_buffer_close_icons = false,
            show_close_icon = false,
            show_tab_indicators = true,
            show_duplicate_prefix = true,
            separator_style = "slant",
            always_show_bufferline = false,
            hover = {
                enabled = false
            }
        }
    }
end


M.nvim_tree = function()
    local nvim_tree = require("nvim-tree")

    nvim_tree.setup {
        auto_reload_on_write = true,
        renderer = {
            indent_markers = {
                enable = true,
                icons = {
                    corner = "└",
                    edge = "│",
                    item = "│",
                    bottom = "─",
                    none = " ",
                },
            },
            icons = {
                webdev_colors = true,
                git_placement = "after",
                padding = " ",
                symlink_arrow = " ➛ ",
                show = {
                    file = true,
                    folder = true,
                    folder_arrow = false,
                    git = true,
                },
                glyphs = {
                    default = "",
                    symlink = "",
                    bookmark = "",
                    folder = {
                        arrow_closed = "",
                        arrow_open = "",
                        default = "",
                        open = "",
                        empty = "",
                        empty_open = "",
                        symlink = "",
                        symlink_open = "",
                    },
                    git = {
                        unstaged = "U",
                        staged = "A",
                        unmerged = "M",
                        renamed = "R",
                        untracked = "U",
                        deleted = "D",
                        ignored = "",
                    },
                }
            },
        },
        actions = {
            open_file = {
                quit_on_open = true
            }
        },
    }
end


M.treesitter = function()
    local nvim_treesitter = require("nvim-treesitter.configs")

    nvim_treesitter.setup {
        ensure_installed = require("langsupport").parsers
    }
end


M.telescope = function()
    local telescope = require("telescope")

    telescope.setup {
        defaults = {
            prompt_prefix = "   ", selection_caret = " ",
            sorting_strategy = "ascending",
            layout_config = { prompt_position = "top" },
        },
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        }
    } 

    telescope.load_extension("fzf")
end


M.icon_picker = function()
    local icon_picker = require("icon-picker")

    icon_picker.setup {
        disable_legacy_commands = true
    }
end


M.lspconfig = function()
    local borders = {
        { "╒", "═", "╕", "│", "╛", "═", "╘", "│" },
        { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" }
    }

    local border = borders[0]

    local signs = { Error = "", Warn  = "", Hint  = "", Info  = "", other = "﫠" }

    for name, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. name
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
    end

    vim.lsp.handlers["textDocument/hover"] =  vim.lsp.with( vim.lsp.handlers.hover, {border = border})
    vim.lsp.handlers["textDocument/signatureHelp"] =  vim.lsp.with( vim.lsp.handlers.signature_help, {border = border})

    vim.diagnostic.config {
        virtual_text = false,
        underline = {Error=true},
        float = {
            border = border,
            header = { "  Diagnostics", "String" },
            focusable = false,
            prefix = function(_, _, _) return "  " , "String" end, -- icons:        ﬌  
            suffix = ''
        }
    } 
end


M.lspconfig_w_mason = function()
    require("neodev").setup()

    local lspconfig = require("lspconfig")
    local lsp_defaults = lspconfig.util.default_config

    lsp_defaults.capabilities = vim.tbl_deep_extend(
        "force",
        lsp_defaults.capabilities,
        require("cmp_nvim_lsp").default_capabilities()
    )

    local mason_lspconfig = require("mason-lspconfig")

    mason_lspconfig.setup {
        ensure_installed = require("langsupport").servers,
        automatic_installation = true
    }

    mason_lspconfig.setup_handlers {
        function(server)
            lspconfig[server].setup({})
        end,
    }
end


M.cmp = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    local source_names = { nvim_lsp = "[LSP]", emoji = "[Emoji]", path = "[Path]", luasnip = "[Snippet]", buffer = "[Buffer]", nvim_lsp_signature_help = "[sig_help]" }
    local kind_icons = {
        Text = ' ', Method = ' ', Function = ' ', Constructor = ' ', Field = ' ', Variable = ' ', Class = ' ', Interface = ' ',
        Module = ' ', Property = ' ', Unit = ' ', Value = ' ', Enum = ' ', Keyword = ' ', Snippet = ' ', Color = ' ', File = ' ',
        Reference = ' ', Folder = ' ', EnumMember = ' ', Constant = ' ', Struct = ' ', Event = ' ', Operator = ' ', TypeParameter = ' ',
    }

    cmp.setup {
        completion = {
            autocomplete = false
        },
        formatting = {
            fields = { 'kind', 'abbr', 'menu' },
            format = function(entry, item)
                item.kind = kind_icons[item.kind] or " "
                item.menu = source_names[entry.source.name] or " "
                return item
            end
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered()
        },

        snippet = {
            expand = function(args) luasnip.lsp_expand(args.body) end,
        },

        mapping = cmp.mapping.preset.insert {
            ["<Tab>"] = cmp.mapping.select_next_item(),
            ["<S-Tab>"] = cmp.mapping.select_prev_item(),
            ["<C-b>"] = cmp.mapping.scroll_docs(-1),
            ["<C-f>"] = cmp.mapping.scroll_docs(1),
            ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
        },

        sources = cmp.config.sources {
            { name = "path" },
            { name = "nvim_lsp" },
            { name = "buffer" },
            { name = "luasnip" },
            { name = "emoji" }
        },

        experimental = { ghost_text = true }
    }

    cmp.setup.cmdline(':', { mapping=cmp.mapping.preset.cmdline(), sources = {{name="cmdline", keyword_length=3}} })
end


return M
