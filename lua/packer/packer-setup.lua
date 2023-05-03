local utils = require("utils")

local setup_plugin = utils.setup_plugin
local setup_theme = utils.setup_theme


require("packer").startup({
    function(use)
        use { "wbthomason/packer.nvim" }


        --- theme ---
        use { "rose-pine/neovim", as="rose-pine", config=setup_theme("c", "rose_pine") }


        --- ui ---
        use { "MunifTanjim/nui.nvim" }
        use { "xiyaowong/nvim-transparent", config=setup_plugin("d", "transparent") }
        use { "kyazdani42/nvim-web-devicons", config=setup_plugin("c", "devicons", "ui") }
        use { "norcalli/nvim-colorizer.lua", config=setup_plugin("d", "colorizer") }
        use { "levouh/tint.nvim", config=setup_plugin("c", "tint", "ui") }
        use { "folke/twilight.nvim", config=setup_plugin("c", "twilight", "ui") }
        use { "folke/zen-mode.nvim", config=setup_plugin("c", "zen_mode", "ui") }
        use { "nvim-lualine/lualine.nvim", config=setup_plugin("c", "lualine", "ui") }
        use { "CosmicNvim/cosmic-ui", config=setup_plugin("c", "cosmic", "ui") }
        use { "lukas-reineke/indent-blankline.nvim", config=setup_plugin("c", "indent_blankline", "ui") }


        --- misc ---
        use { "lewis6991/gitsigns.nvim", config=setup_plugin("c", "gitsigns", "misc") }
        use { "nvim-treesitter/nvim-treesitter", config=setup_plugin("c", "treesitter", "misc") }

        use { "numToStr/Comment.nvim", config=setup_plugin("d", "Comment") }
        use { "folke/todo-comments.nvim", config=setup_plugin("c", "todo_comments", "misc") }

        use { "nvim-lua/plenary.nvim" }
        use { "akinsho/bufferline.nvim", config=setup_plugin("c", "bufferline", "misc") }
        use { "nvim-telescope/telescope.nvim", config=setup_plugin("c", "telescope", "misc") }
        use { "nvim-telescope/telescope-file-browser.nvim" }

        use { "cappyzawa/trim.nvim", config=setup_plugin("d", "trim") }
        use { "christoomey/vim-tmux-navigator" }
        use { "szw/vim-maximizer" }


        --- lsp ---
        use { "neovim/nvim-lspconfig" }
        use { "williamboman/mason.nvim", config=setup_plugin("d", "mason") }
        use { "williamboman/mason-lspconfig.nvim", config=setup_plugin("c", "lspconfig", "lsp") }

        use { "L3MON4D3/LuaSnip" }
        use { "hrsh7th/nvim-cmp", after={"LuaSnip"}, config=setup_plugin("c", "cmp", "lsp") }
        use { "hrsh7th/cmp-path", after={"nvim-cmp"} }
        use { "hrsh7th/cmp-nvim-lsp", module="cmp_nvim_lsp", after={"nvim-cmp"} }
        use { "hrsh7th/cmp-buffer", after={"nvim-cmp"} }
        use { "hrsh7th/cmp-cmdline", after={"nvim-cmp"} }
        use { "saadparwaiz1/cmp_luasnip", after={"nvim-cmp"} }

        use { "kevinoid/vim-jsonc" }
        use { "maxmellon/vim-jsx-pretty" }
    end
})
