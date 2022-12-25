local M = {}


M.gruvbox = function()
    local g = vim.g

    g.gruvbox_material_background = "hard"
    g.gruvbox_material_foreground = "hard"
    g.gruvbox_material_disable_italic_comment = 1
    g.gruvbox_material_enable_bold = 1
    g.gruvbox_material_better_performance = 1

    vim.cmd[[colorscheme gruvbox-material]]
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
        {
            icon = " ",
            desc = " ",
            action = "qa",
            shortcut = " "
        }
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
        override = {} -- TODO: add icons ovverride
    })
end


M.staline = function()
    local staline = require("staline")

    staline.setup({
        defaults = {
            true_colors = true,
            line_column = " [%l/%L] :%c  ",
            branch_symbol = " ",
            left_separator = "",
            right_separator = ""
        },

        mode_colors = {
            n = "#cccccc",
            i = "#ff6b6b",
            c = "#f8ff60",
            v = "#6b6bff"
        },

        sections = {
            left = { "- ", "-mode", "left_sep_double", " ", "file_name", " ", "lsp", "branch" },
            mid  = {},
            right = { "right_sep_double", "-line_column" }
        }
    })
end


M.todo_comments = function()
    local todo = require("todo-comments")

    todo.setup({
        signs = false,
        keywords = {
            NOTE = { icon = " ", color = "hint" },
            TODO = { icon = " ", color = "info" },
            WARN = { icon = " ", color = "warning" },
            FIX = { icon = " ", color = "error" }
        },
        colors = {
            hint = { "DiagnosticHint", "#10B981" },
            info = { "DiagnosticInfo", "#6b6bff" },
            warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
            error = { "DiagnosticError", "ErrorMsg", "#ff6b6b" }
        },
    })
end


M.bufferline = function()
    local bufferline = require("bufferline")

    bufferline.setup {
        options = {
            mode = "buffers",
            numbers = "none",
            modified_icon = "●",
            tab_size = 18,
            diagnostics = "nvim_lsp",
            show_buffer_close_icons = false,
            show_close_icon = false,
            show_tab_indicators = false,
            show_duplicate_prefix = true,
            separator_style = "slant",
            always_show_bufferline = false,

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
    }
end


M.nvim_tree = function()
    local nvim_tree = require("nvim-tree")

    nvim_tree.setup({
        filters = {
            dotfiles = false
        },
        disable_netrw = true,
        hijack_netrw = true,
        open_on_setup = false,
        ignore_ft_on_setup = { "alpha" },
        hijack_cursor = true,
        hijack_unnamed_buffer_when_opening = false,
        update_cwd = true,

        update_focused_file = {
            enable = true,
            update_cwd = false,
        },

        view = {
            adaptive_size = true,
            side = "left",
            width = 25,
            hide_root_folder = true,
        },

        git = {
            enable = false,
            ignore = true,
        },

        filesystem_watchers = {
            enable = true,
        },

        actions = {
            open_file = {
                quit_on_open = true,
                resize_window = true
            },
        },

        renderer = {
            highlight_git = false,
            highlight_opened_files = "none",

            indent_markers = {
                enable = false,
            },

            icons = {
                show = {
                    file = false,
                    folder = false,
                    folder_arrow = true,
                    git = false
                }
            }
        }
    })
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
            layout_config = { prompt_position = "top" }
        },

        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case"
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
    local signs = { Error = "", Warn  = "", Hint  = "", Info  = "", other = "﫠" }

    for name, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. name

        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
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
        end
    }
end


M.cmp = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    local source_names = {
        nvim_lsp = "[LSP]",
        path = "[Path]",
        luasnip = "[Snippet]",
        buffer = "[Buffer]"
    }

    local kind_icons = {
        Text = " ", Method = ' ', Function = ' ', Constructor = ' ', Field = ' ',
        Variable = ' ', Class = ' ', Interface = ' ', Module = ' ', Property = ' ',
        Unit = ' ', Value = ' ', Enum = ' ', Keyword = ' ', Snippet = ' ',
        Color = ' ', File = ' ', Reference = ' ', Folder = ' ', EnumMember = ' ',
        Constant = ' ', Struct = ' ', Event = ' ', Operator = ' ', TypeParameter = ' '
    }

    cmp.setup {
        completion = {
            autocomplete = false
        },

        formatting = {
            fields = { 'abbr', 'kind' },
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
            ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
            ["<CR>"] = cmp.mapping.confirm({ select = true })
        },

        sources = cmp.config.sources {
            { name = "path" },
            { name = "nvim_lsp" },
            { name = "buffer" },
            { name = "luasnip" },
        }
    }

    cmp.setup.cmdline(
        ":",
        {
            mapping=cmp.mapping.preset.cmdline(),
            sources = {
                {
                    name="cmdline",
                    keyword_length=3
                }
            }
        }
    )
end


return M
