local utils = require("utils")

local plugin = utils.setup_plugin
local theme = utils.setup_theme

local lazy = require("lazy")

lazy.setup({
    --- theme ---
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        config = theme("c", "rose_pine")
    },


    --- ui ---
    {
        "xiyaowong/nvim-transparent",
        lazy = false,
        config = plugin("d", "transparent")
    },
    {
        "kyazdani42/nvim-web-devicons",
        lazy = true,
        config = plugin("c", "devicons", "ui")
    },
    {
        "norcalli/nvim-colorizer.lua",
        event = "BufRead",
        config = plugin("d", "colorizer")
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
        lazy = false,
        config = plugin("c", "lualine", "ui")
    },
    {
        "CosmicNvim/cosmic-ui",
        event = "BufRead",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim"
        },
        config = plugin("c", "cosmic", "ui")
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
        config = plugin("d", "indent_blankline")
    },


    --- misc ---
    {
        "lewis6991/gitsigns.nvim",
        event = "BufRead",
        config = plugin("c", "gitsigns", "misc")
    },
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        config = plugin("c", "treesitter", "misc")
    },
    {
        "numToStr/Comment.nvim",
        lazy = true,
        config = plugin("d", "Comment")
    },
    {
        "folke/todo-comments.nvim",
        event = "BufEnter",
        config = plugin("c", "todo_comments", "misc")
    },
    {
        "akinsho/bufferline.nvim",
        event = "BufNew",
        config = plugin("c", "bufferline", "misc")
    },
    {
        "nvim-telescope/telescope.nvim",
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-file-browser.nvim"
        },
        config = plugin("c", "telescope", "misc")
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
        "williamboman/mason.nvim",
        cmd = "Mason",
        dependencies = {
            "neovim/nvim-lspconfig"
        },
        config = plugin("d", "mason")
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        dependencies = {
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim"
        },
        config = plugin("c", "lspconfig", "lsp")
    },
    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            "L3MON4D3/LuaSnip",
            "hrsh7th/cmp-path",
            { "hrsh7th/cmp-nvim-lsp", module="cmp_nvim_lsp" },
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip"
        },
        config = plugin("c", "cmp", "lsp")
    },
    { "kevinoid/vim-jsonc" },
    { "maxmellon/vim-jsx-pretty" }
})
