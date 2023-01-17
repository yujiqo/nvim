local configs = {}


configs.dashboard = function()
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

    vim.cmd[[au BufEnter * silent! set laststatus=2]]
end


configs.transparent = function()
    local transparent = require("transparent")

    transparent.setup {
        enable = true
    }
end


configs.devicons = function()
    local devicons = require("nvim-web-devicons")

    devicons.setup {
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
    }
end


configs.staline = function()
    local staline = require("staline")

    staline.setup {
        defaults = {
            true_colors = true,
            line_column = " [%l/%L] :%c  ",
            branch_symbol = " ",
            left_separator = "",
            right_separator = ""
        },

        mode_colors = {
            n = "#cccccc",
            i = "#ff2055",
            c = "#ffbc62",
            v = "#6b6bff"
        },

        sections = {
            left = { "- ", "-mode", "left_sep_double", " ", "file_name", " ", "lsp", "branch" },
            mid  = {},
            right = { "right_sep_double", "-line_column" }
        }
    }
end


configs.indent_blankline = function()
    local indent_blankline = require("indent_blankline");

    indent_blankline.setup {
        -- char = "▏"
    }
end


configs.todo_comments = function()
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


configs.bufferline = function()
    local bufferline = require("bufferline")

    bufferline.setup {
        highlights = {
            fill = {
                fg = "#cccccc"
            },
            background = {
                fg = "#cccccc"
            },
            tab = {
                fg = "#cccccc"
            },
            buffer_selected = {
                fg = "#ff2055",
                italic = false
            },
            numbers_selected = {
                fg = "#ff2055",
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
            mode = "buffers",
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
    }
end


configs.treesitter = function()
    local nvim_treesitter = require("nvim-treesitter.configs")

    nvim_treesitter.setup {
        ensure_installed = require("langsupport").parsers,
        auto_install = true,

        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false
        },
    }
end


configs.telescope = function()
    local telescope = require("telescope")

    telescope.setup {
        defaults = {
            prompt_prefix = "   ", selection_caret = " ",
            sorting_strategy = "ascending",
            layout_config = { prompt_position = "top" }
        }
    }

    telescope.load_extension("file_browser")
end


configs.lspconfig = function()
    vim.diagnostic.config({
        -- virtual_text = {
        --     prefix = ""
        -- },
        virtual_text = false,
        underline = {Error=true},
        float = {
            header = "",
            focusable = false,
            prefix = function(_, _, _) return "" , "String" end,
            suffix = ""
        }
    })

    local signs = { Error = "", Warn  = "", Hint  = "", Info  = "", other = "﫠" }

    for name, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. name

        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
end


configs.lspconfig_w_mason = function()
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


configs.cmp = function()
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
            { name = "nvim_lsp" },
            { name = "nvim_lsp_signature_help" },
            { name = "path" },
            { name = "buffer" },
            { name = "luasnip" }
        },

        -- experimental = {
        --     ghost_text = true
        -- }
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


-- configs.nvim_tree = function()
--     local nvim_tree = require("nvim-tree")
--
--     nvim_tree.setup {
--         filters = {
--             dotfiles = false
--         },
--
--         disable_netrw = true,
--         hijack_netrw = true,
--         open_on_setup = false,
--         ignore_ft_on_setup = { "alpha" },
--         hijack_cursor = true,
--         hijack_unnamed_buffer_when_opening = false,
--         update_cwd = true,
--
--         update_focused_file = {
--             enable = true,
--             update_cwd = false
--         },
--
--         view = {
--             adaptive_size = true,
--             side = "left",
--             width = 25,
--             hide_root_folder = true,
--             signcolumn = "no"
--         },
--
--         git = {
--             enable = true,
--             ignore = false
--         },
--
--         filesystem_watchers = {
--             enable = true
--         },
--
--         actions = {
--             open_file = {
--                 quit_on_open = true,
--                 resize_window = true
--             },
--         },
--
--         renderer = {
--             highlight_git = false,
--             highlight_opened_files = "none",
--             add_trailing = false,
--             group_empty = false,
--             full_name = false,
--             indent_width = 2,
--
--             indent_markers = {
--                 enable = true,
--                 inline_arrows = false,
--
--                 icons = {
--                     corner = "└",
--                     edge = "│",
--                     item = "│",
--                     bottom = "─",
--                     none = " "
--                 }
--             },
--
--             icons = {
--                 git_placement = "after",
--                 padding = " ",
--
--                 show = {
--                     file = false,
--                     folder = true,
--                     folder_arrow = false,
--                     git = true
--                 },
--
--                 glyphs = {
--                     git = {
--                         unstaged = "M",
--                         staged = "A",
--                         unmerged = "",
--                         renamed = "R",
--                         untracked = "U",
--                         deleted = "D",
--                         ignored = ""
--                     }
--                 }
--             }
--         }
--     }
-- end


return configs
