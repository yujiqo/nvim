local lsp = {}


lsp.mason = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    local servers = require("utils").servers
    local tools = require("utils").tools

    mason.setup({
        ui = {
            border = "rounded"
        }
    })

    mason_lspconfig.setup({
        ensure_installed = servers
    })

    mason_tool_installer.setup({
        ensure_installed = tools
    })
end


lsp.lspconfig = function()
    local lspconfig = require("lspconfig")

    require("lspconfig.ui.windows").default_options = {
        border = "rounded"
    }

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover,
        {
            border = "rounded"
        }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help,
        {
            border = "rounded"
        }
    )

    vim.cmd[[highlight FloatBorder ctermfg=NONE ctermbg=NONE cterm=NONE]]

    vim.diagnostic.config({
        -- virtual_text = {
        --     prefix = ""
        -- },
        virtual_text = true,
        underline = {Error=true},
        float = {
            border = "rounded",
            header = "",
            focusable = false,
            prefix = function(_, _, _) return "" , "String" end,
            suffix = ""
        }
    })

    local signs = require("utils").diagnostic_signs

    for name, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. name

        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    local lsp_defaults = lspconfig.util.default_config

    lsp_defaults.capabilities = vim.tbl_deep_extend(
        "force",
        lsp_defaults.capabilities,
        require("cmp_nvim_lsp").default_capabilities()
    )

    local map = vim.keymap.set

    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
            local opts = { buffer = ev.buf, silent = true }

            map("n","gD", vim.lsp.buf.declaration, opts)
            map("n","gt", ":Telescope lsp_definitions<CR>", opts)
            map("n","gt", ":Telescope lsp_type_definitions<CR>", opts)
            map("n","gi", ":Telescope lsp_implementations<CR>", opts)
            map("n","gr", ":Telescope lsp_references<CR>", opts)
            map("n", "<leader>D", ":Telescope diagnostics bufnr=0<CR>", opts)
            map("n", "<leader>d", vim.diagnostic.open_float, opts)
            map("n", "[e", vim.diagnostic.goto_prev, opts)
            map("n", "]e", vim.diagnostic.goto_next, opts)
            map("n", "K", vim.lsp.buf.hover, opts)
            map("n", "<leader>rn", vim.lsp.buf.rename, opts)
            map("n", "<leader>rs", ":LspRestart<CR>", opts)
        end
    })

    local mason_lspconfig = require("mason-lspconfig")
    local server_configs = require("utils").server_configs

    mason_lspconfig.setup_handlers({
        function(server)
            if server_configs[server] == nil then
                lspconfig[server].setup({})
            else
                lspconfig[server].setup(server_configs[server]())
            end
        end
    })
end


lsp.cmp = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local kind_icons = require("utils").lsp_icons


    cmp.setup({
        completion = {
            autocomplete = false
        },
        formatting = {
            fields = { "kind", "abbr", "menu" },
            format = function(_, item)
                item.kind = kind_icons[item.kind] or " "
                item.menu = "  "
                return item
            end
        },
        window = {
            completion = {
                border = "rounded",
            },
            documentation = {
                border = "rounded",
            }
        },
        snippet = {
            expand = function(args) luasnip.lsp_expand(args.body) end,
        },
        mapping = cmp.mapping.preset.insert {
            ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
            ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
            ["<C-b>"] = cmp.mapping.scroll_docs(-1),
            ["<C-f>"] = cmp.mapping.scroll_docs(1),
            ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
        },
        sources = cmp.config.sources {
            { name = "nvim_lsp" },
            { name = "path" },
            { name = "buffer" },
            { name = "luasnip" }
        },
        experimental = {
            ghost_text = true
        }
    })
    cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources(
            {{ name = "path" }},
            {{ name = "cmdline" }}
        )
    })
end


lsp.snippets = function ()
    local vscode_loader = require("luasnip/loaders/from_vscode")

    vscode_loader.lazy_load()
end


lsp.conform = function()
    local conform = require("conform")

    conform.setup({
        rust = { "rustfmt" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        lua = { "stylua" },
        python = { "autopep8" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" }
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
        conform.format({
            lsp_fallback = true,
            async = false,
            timeout_ms = 1000
        })
    end)
end


lsp.lint = function()
    local lint = require("lint")

    lint.linters_by_ft = {
        cpp = { "cpplint" },
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        python = { "pylint" }
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
            lint.try_lint()
        end
    })

    vim.keymap.set("n", "<leader>l", function()
        lint.try_lint()
    end)
end


return lsp
