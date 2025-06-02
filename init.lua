--------------- Bootstrap lazy.nvim ---------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

--------------- Options ---------------

-- Disable NetRW
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Disable Backup/Swap files
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Encoding to UTF-8
vim.opt.encoding = "utf-8"

-- Case insensitive search
vim.opt.smartcase = true
vim.opt.ignorecase = true

-- Disable line wrap
vim.opt.wrap = false

-- Consistent 2 space indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.breakindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Status line
vim.opt.showmode = true
vim.opt.showcmd = true
vim.opt.ruler = true
vim.opt.number = true

-- Sign/Number column
vim.opt.number = true
vim.opt.signcolumn = "yes:1"

-- Remove ~ at the end of files
vim.opt.fillchars = { eob = " " }

-- Hide native menu for nvim-cmp
vim.o.wildmenu = false
vim.opt.completeopt = "menu,menuone,noselect"

-- Yank to Clipboard
vim.opt.clipboard:prepend({ "unnamed", "unnamedplus" }) -- Windows
-- vim.opt.clipboard:append({ "unnamedplus" }) -- UNIX

-- Leader as <Space>
vim.g.mapleader = " "

--------------- Plugins setup ---------------
require("lazy").setup({
  spec = {
    {
      "ntk148v/komau.vim",
      priority = 1000,
      config = function()
        vim.g.komau_italic = 0
        -- vim.cmd("colorscheme komau")
      end
    },
    {
      "rose-pine/neovim",
      name = "rose-pine",
      priority = 1000,
      config = function()
        require("rose-pine").setup({
          bold_vert_split = false,
          dim_nc_background = false,
          disable_background = true,
          disable_float_background = true,
          disable_italics = true
        })

        vim.cmd("colorscheme rose-pine-moon")
      end
    },
    {
      "lewis6991/gitsigns.nvim",
      lazy = true,
      event = { "BufReadPre", "BufNewFile" }
    },
    { "xiyaowong/nvim-transparent" },
    {
      "folke/snacks.nvim",
      priority = 1000,
      opts = {
        dashboard ={
          preset = {
            header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
          },
          sections = {
            { section = "header" },
            { section = "startup" },
          },
        }
      }
    },
    {
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      opts = {
        options = {
          icons_enabled = true,
          component_separators = { left = "", right = ""},
          section_separators = { left = "", right = ""},
          always_divide_middle = true,
          always_show_tabline = false,
          globalstatus = false,
          refresh = { statusline = 100 }
        },
        sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {
            "filename",
            "diagnostics",
            "branch",
            "diff",
          },
          lualine_x = {
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = { fg = "#ff9e64" }
            },
            "location",
            "progress"
          },
          lualine_y = {},
          lualine_z = {}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {}
        },
      }
    },
    {
      "levouh/tint.nvim",
      config = function()
        require("tint").setup({
          tint = -30, saturatiow = 0.3
        })
      end
    },
    {
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl",
      lazy = true,
      event = { "BufReadPre", "BufNewFile" },
      config = function()
        require("ibl").setup({
          indent = { char = "▏", highlight = "LineNr" },
          scope = { enabled = false }
        })
      end
    },
    {
      "nvim-treesitter/nvim-treesitter",
      lazy = true,
      event = { "BufReadPre", "BufNewFile" },
      build = ":TSUpdate",
      branch = "master",
      config = function()
        require("nvim-treesitter.configs").setup({
          ensure_installed = {
            "c", "cpp", "cmake", "rust", "python", "lua",
            "javascript", "typescript", "html", "css",
            "json", "jsonc", "toml", "yaml", "vim",
            "markdown", "markdown_inline"
          },
          highlight = { enable = true },
          indent = { enable = true }
        })
      end
    },
    {
      "numToStr/Comment.nvim",
      lazy = true,
      dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
      config = function()
        require("Comment").setup({
          pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
        })
      end
    },
    {
      "akinsho/bufferline.nvim",
      lazy = true,
      keys = "<leader>te",
      version = "*",
      dependencies = "nvim-tree/nvim-web-devicons",
      config = function()
        local regular = { fg = "#858585", bg = "none" }
        local selected = { fg = "#cccccc", bg = "none" }

        require("bufferline").setup({
          highlights = {
            fill = regular,
            background = regular,
            tab = regular,
            numbers = regular,
            tab_selected = selected,
            numbers_selected = selected
          },
          options = {
            mode = "tabs",
            numbers = "none",
            modified_icon = "+",
            tab_size = 8,
            diagnostics = "nvim_lsp",
            show_buffer_icons = true,
            show_close_icon = false,
            show_tab_indicators = true,
            show_duplicate_prefix = true,
            separator_style = { "", "" },
            always_show_bufferline = false,
            indicator = { style = "none" },
            over = { enabled = false }
          }
        })
      end
    },
    {
      "nvim-telescope/telescope.nvim",
      lazy = true,
      event = "VeryLazy",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "nvim-telescope/telescope-file-browser.nvim"
      },
      config = function()
        local telescope = require("telescope")

        telescope.setup({
          defaults = {
            prompt_prefix = "   ", selection_caret = " ",
            sorting_strategy = "ascending",
            layout_config = { prompt_position = "top" }
          },
          extensions = {
            file_browser = {
              hijack_netrw = false,
              git_status = false
            }
          }
        })

        telescope.load_extension("file_browser")
      end
    },
    {
      "nvim-neo-tree/neo-tree.nvim",
      lazy = false,
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
      },
      opts = {
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
        },
        window = {
          position = "left",
          width = 40,
          mappings = {
            ["<space>"] = { "toggle_node", nowait = false },
            ["<cr>"] = "open",
            ["<esc>"] = "cancel",
            ["a"] = { "add", config = { show_path = "none" } },
            ["A"] = "add_directory",
            ["d"] = "delete",
            ["r"] = "rename",
            ["y"] = "copy_to_clipboard",
            ["x"] = "cut_to_clipboard",
            ["p"] = "paste_from_clipboard",
            ["R"] = "refresh",
          },
          filesystem = {
            filtered_items = {
              visible = false,
              hide_dotfiles = true,
              hide_gitignored = true,
              hide_hidden = true
            },
            group_empty_dirs = false,
            hijack_netrw_behavior = "open_default",
            window = {
              mappings = {
                ["."] = "set_root",
                ["H"] = "toggle_hidden"
              }
            }
          }
        }
      }
    },
    {
      "ggandor/leap.nvim",
      lazy = true,
      keys = "s",
      dependencies = { "tpope/vim-repeat" },
      config = function()
        require("leap").set_default_mappings()
      end
    },
    { "szw/vim-maximizer" },
    {
      "williamboman/mason.nvim",
      opts = {
        ui = {
          border = "rounded",
          backdrop = 100
        }
      }
    },
    {
      "williamboman/mason-lspconfig.nvim",
      dependencies = { "williamboman/mason.nvim" },
      opts = {
        ensure_installed = {
          "clangd", "cmake", "rust_analyzer",
          "pyright", "lua_ls", "marksman",
          "ts_ls", "html", "cssls", "emmet_ls"
        },
        automatic_enable = false,
        automatic_installation = true
      }
    },
    {
      "neovim/nvim-lspconfig",
      lazy = true,
      event = { "BufReadPre", "BufNewFile" },
      dependencies = { "williamboman/mason-lspconfig.nvim" },
      config = function()
        local lspconfig = require("lspconfig")
        local servers = {
          clangd = {},
          cmake = {},
          rust_analyzer = {},
          pyright = {
            settings = {
              python = {
                analysis = {
                  typeCheckingMode = "off"
                }
              }
            }
          },
          lua_ls = {
            settings = {
              Lua = {
                runtime = {
                  version = "LuaJIT",
                },
                diagnostics = {
                  globals = { "vim" },
                },
                workspace = {
                  library = vim.api.nvim_get_runtime_file("", true),
                },
                telemetry = {
                  enable = false,
                },
              },
            },
          },
          marksman = {},
          ts_ls = {},
          html = {},
          cssls = {},
          emmet_ls = {}
        }

        for name, opts in pairs(servers) do
          lspconfig[name].setup(opts)
        end

        local lsp_defaults = require("lspconfig").util.default_config

        lsp_defaults.capabilities = vim.tbl_deep_extend(
          "force", lsp_defaults.capabilities, require "cmp_nvim_lsp".default_capabilities())

        vim.api.nvim_create_autocmd("LspAttach", {
          group = vim.api.nvim_create_augroup("UserLspConfig", {}),
          callback = function(ev)
            local opts = { buffer = ev.buf, silent = true }

            vim.keymap.set("n","gD", vim.lsp.buf.declaration, opts)
            vim.keymap.set("n","gd", ":Telescope lsp_definitions<CR>", opts)
            vim.keymap.set("n","gt", ":Telescope lsp_type_definitions<CR>", opts)
            vim.keymap.set("n","gi", ":Telescope lsp_implementations<CR>", opts)
            vim.keymap.set("n","gr", ":Telescope lsp_references<CR>", opts)
            vim.keymap.set("n", "<leader>D", ":Telescope diagnostics bufnr=0<CR>", opts)
            vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
          end
        })

        require("lspconfig.ui.windows").default_options = { border = "rounded" }

        vim.diagnostic.config({
          virtual_text = true,
          signs = {
            text = {
              [vim.diagnostic.severity.ERROR] = " ",
              [vim.diagnostic.severity.WARN] = " ",
              [vim.diagnostic.severity.HINT] = "󱧢 ",
              [vim.diagnostic.severity.INFO] = " ",
            }
          },
          underline = true,
          update_in_insert = false,
          severity_sort = true,
          float = { border = "rounded" }
        })
      end
    },
    {
      "hrsh7th/nvim-cmp",
      lazy = true,
      event = { "InsertEnter", "CmdlineEnter" },
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "L3MON4D3/LuaSnip"
      },
      config = function()
        local cmp = require("cmp")
        local kind_icons = {
          Text = " ", Method = " ", Function = " ", Constructor = " ", Field = " ",
          Variable = " ", Class = " ", Interface = " ", Module = " ", Property = " ",
          Unit = " ", Value = " ", Enum = " ", Keyword = " ", Snippet = " ",
          Color = " ", File = " ", Reference = " ", Folder = " ", EnumMember = " ",
          Constant = " ", Struct = " ", Event = " ", Operator = " ", TypeParameter = " "
        }

        cmp.setup({
          completion = { autocomplete = false },
          formatting = {
            fields = { "kind", "abbr", "menu" },
            format = function(_, item)
              item.kind = kind_icons[item.kind] or " "
              item.menu = "  "
              return item
            end
          },
          window = {
            completion = { border = "rounded" },
            documentation = { border = "rounded" }
          },
          mapping = cmp.mapping.preset.insert({
            ["<Tab>"] = cmp.mapping.select_next_item(),
            ["<S-Tab>"] = cmp.mapping.select_prev_item(),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
            ["<CR>"] = cmp.mapping.confirm({ select = true })
          }),
          sources = {
            { name = "nvim_lsp" },
            { name = "path" },
            { name = "buffer" },
            { name = "luasnip" }
          },
          snippet = {
            expand = function(args)
              require("luasnip").lsp_expand(args.body)
            end,
          },
        })

        cmp.setup.cmdline(":", {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources(
            { { name = "path" } },
            { { name = "cmdline" } }
          )
        })

        cmp.setup.cmdline({ "/", "?" }, {
          mapping = cmp.mapping.preset.cmdline(),
          sources = {
            { name = "buffer" }
          }
        })
      end
    }
  },
  ui = {
    backdrop = 100,
    border = "rounded"
  },
  install = {
    colorscheme = { "rose-pine-moon" }
  },
  checker = {
    enabled = true,
    notify = false
  }
})

--------------- Keymaps ---------------
-- Select all
vim.keymap.set("n", "<C-a>", "ggVG")

-- Moving
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { silent = true })

-- Do not yank when x/X & p/P
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "X", '"_X')
vim.keymap.set("x", "p", '"_dP')
vim.keymap.set("x", "P", '"_dP')

-- Increment/Decrement
vim.keymap.set("n", "=", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

-- Tab management
vim.keymap.set("n", "<leader>te", ":tabedit<CR>", { silent = true })
vim.keymap.set("n", "<leader>h", ":tabmove -<CR>", { silent = true })
vim.keymap.set("n", "<leader>l", ":tabmove +<CR>", { silent = true })
vim.keymap.set("n", "<TAB>", ":tabnext<CR>", { silent = true })
vim.keymap.set("n", "<S-TAB>", ":tabprev<CR>", { silent = true })

-- Split screen
vim.keymap.set("n", "<leader>sv", "<C-w>v<C-w>w")
vim.keymap.set("n", "<leader>sh", "<C-w>s<C-w>w")
vim.keymap.set("n", "<leader>sh", "<C-w><")
vim.keymap.set("n", "<leader>sl", "<C-w>>")
vim.keymap.set("n", "<leader>sk", "<C-w>+")
vim.keymap.set("n", "<leader>sj", "<C-w>-")
vim.keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", { silent = true })
if vim.fn.has "nvim" == 1 then
  vim.keymap.set("n", "<BS>", "<C-w>h", { silent = true})
else
  vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true})
end
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true})
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true})
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true})

-- Commenting
vim.keymap.set("n", "<leader>/", ":lua require('Comment.api').toggle.linewise.current()<CR>", { silent = true })
vim.keymap.set("v", "<leader>/", ":lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { silent = true })

-- Telescope
vim.keymap.set("n", "<leader>b", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { silent = true })
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { silent = true })
vim.keymap.set("n", "<leader>fd", ":Telescope diagnostics<CR>", { silent = true })
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { silent = true })
vim.keymap.set("n", "<leader>fs", ":Telescope grep_string<CR>", { silent = true })

-- Neotree
vim.keymap.set("n", "<leader>v", ":Neotree toggle<CR>", { silent = true })
