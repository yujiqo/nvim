local get_config = function(setup_type, setup_name, plugin_category)
  if setup_type == "d" then
    return load(('require("%s").setup()'):format(setup_name))
  elseif setup_type == "c" and plugin_category then
    return load(('require("configs.%s").%s()'):format(plugin_category, setup_name))
  end
end

local plugins = {
  -- themes
  -- {
  --   "ntk148v/komau.vim",
  --   lazy = false,
  --   priority = 1000,
  --   config = get_config("c", "komau", "themes")
  -- },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = get_config("c", "rose_pine", "themes")
  },

  -- visuals
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = get_config("d", "gitsigns")
  },
  {
    "xiyaowong/nvim-transparent",
    lazy = false,
    config = get_config("d", "transparent")
  },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    config = get_config("d", "dressing")
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = false,
    config = get_config("c", "devicons", "visuals")
  },
  {
    "levouh/tint.nvim",
    lazy = false,
    config = get_config("c", "tint", "visuals")
  },
  {
    "folke/twilight.nvim",
    lazy = false,
    config = get_config("c", "twilight", "visuals")
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = get_config("c", "zen_mode", "visuals")
  },
  {
    "tamton-aquib/staline.nvim",
    lazy = false,
    config = get_config("c", "staline", "visuals")
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPre", "BufNewFile" },
    config = get_config("c", "indent", "visuals")
  },

  -- features
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = { "windwp/nvim-ts-autotag" },
    config = get_config("c", "treesitter", "features")
  },
  {
    "numToStr/Comment.nvim",
    lazy = true,
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    config = get_config("c", "comment", "features")
  },
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = get_config("c", "todo_comments", "features")
  },
  {
    "akinsho/bufferline.nvim",
    keys = "<leader>te",
    config = get_config("c", "bufferline", "features")
  },
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim"
    },
    config = get_config("c", "telescope", "features")
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
    config = get_config("c", "neo-tree", "features")
  },
  {
    "ggandor/lightspeed.nvim",
    dependencies = { "tpope/vim-repeat" }
  },
  {
    "cappyzawa/trim.nvim",
    event = "BufWrite",
    config = get_config("d", "trim")
  },
  { "szw/vim-maximizer" },
  { "Darazaki/indent-o-matic" },

  -- language-support
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "folke/neodev.nvim", opts = {} }
    },
    config = get_config("c", "lspconfig", "lsp")
  },
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim"
    },
    config = get_config("c", "mason", "lsp")
  },
  {
    "L3MON4D3/LuaSnip",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = { "rafamadriz/friendly-snippets" },
    config = get_config("c", "snippets", "lsp")
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
    config = get_config("c", "cmp", "lsp")
  },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = get_config("c", "conform", "lsp")
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = get_config("c", "lint", "lsp")
  }
}


return plugins
