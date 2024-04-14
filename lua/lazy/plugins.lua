local utils = require("utils")

local plugin = utils.setup_plugin

local plugins = {
    --- theme ---
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        config = plugin("c", "rose_pine", "theme")
    },

    --- ui ---
    {
        "xiyaowong/nvim-transparent",
        lazy = false,
        config = plugin("d", "transparent")
    },
    {
        "levouh/tint.nvim",
        event = "BufRead",
        config = plugin("c", "tint", "ui")
    },
    {
        "folke/twilight.nvim",
        lazy = true,
        config = plugin("c", "twilight", "ui")
    },
    {
        "folke/zen-mode.nvim",
        event = "BufEnter",
        config = plugin("c", "zen_mode", "ui")
    },
    {
        "nvim-lualine/lualine.nvim",
        config = plugin("c", "lualine", "ui")
    },
    {
      "stevearc/dressing.nvim",
      event = "VeryLazy",
      config = plugin("d", "dressing")
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = { "BufReadPre", "BufNewFile" },
        config = plugin("c", "indent", "misc")
    },

    --- misc ---
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = plugin("d", "gitsigns")
    },
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",
        dependencies = {
            "windwp/nvim-ts-autotag"
        },
        config = plugin("c", "treesitter", "misc")
    },
    {
        "numToStr/Comment.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring"
        },
        config = plugin("c", "comment", "misc")
    },
    {
        "folke/todo-comments.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "nvim-lua/plenary.nvim" },
        config = plugin("c", "todo_comments", "misc")
    },
    {
        "akinsho/bufferline.nvim",
        config = plugin("c", "bufferline", "misc")
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
        },
        config = plugin("c", "telescope", "misc")
    },
    {
        "folke/trouble.nvim",
        dependencies = { "folke/todo-comments.nvim" },
        keys = {
            { "<leader>xx", ":TroubleToggle<CR>" },
            { "<leader>xw", ":TroubleToggle workspace_diagnostics<CR>" },
            { "<leader>xd", ":TroubleToggle document_diagnostics<CR>" },
            { "<leader>xl", ":TroubleToggle loclist<CR>" },
            { "<leader>xt", ":TodoTrouble<CR>" }
        },
        config = plugin("c", "trouble", "misc")
    },
    {
        "ggandor/lightspeed.nvim",
        lazy = false,
        dependencies = {
            "tpope/vim-repeat"
        }
    },
    {
        "cappyzawa/trim.nvim",
        event = "BufWrite",
        config = plugin("d", "trim")
    },
    { "christoomey/vim-tmux-navigator" },
    { "szw/vim-maximizer" },

    --- lsp ---
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            { "folke/neodev.nvim", opts = {} }
        },
        config = plugin("c", "lspconfig", "lsp")
    },
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim"
        },
        config = plugin("c", "mason", "lsp")
    },
    {
        "L3MON4D3/LuaSnip",
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = { "rafamadriz/friendly-snippets" },
        config = plugin("c", "snippets", "lsp")
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip"
        },
        config = plugin("c", "cmp", "lsp")
    },
    {
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = plugin("c", "conform", "lsp")
    },
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = plugin("c", "lint", "lsp")
    }
}


return plugins
