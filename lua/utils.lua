local M = {}

M.parsers = {
  "astro", "bash", "c", "cpp", "cmake", "css",
  "dockerfile", "gitignore", "html",
  "htmldjango", "javascript", "json",
  "jsonc", "lua", "make", "markdown",
  "markdown_inline", "python", "regex",
  "rust", "scss", "sql", "toml", "tsx",
  "typescript", "vim", "yaml"
}

M.servers = {
  "bashls", "clangd", "cmake",
  "cssls", "dockerls", "html",
  "jsonls", "tsserver", "lua_ls",
  "marksman", "pyright", "rust_analyzer",
  "sqlls", "taplo", "tailwindcss",
  "emmet_ls"
}

M.tools = {
  -- formatters
  "clang-format", "autopep8",
  "prettier", "stylua",

  --linters
  "cpplint", "eslint_d", "pylint"
}

M.server_configs = {
  lua_ls = function ()
    return {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim", "api" },
          },
          workspace = {
            library = {
              [vim.fn.expand "$VIMRUNTIME/lua"] = true,
              [vim.fn.stdpath "config" .. "/lua"] = true
            }
          }
        }
      }
    }
  end,
  emmet_ls = function ()
    return {
      filetypes = {
        "html", "typescriptreact" , "javascriptreact",
        "css", "sass", "scss", "less", "astro"
      }
    }
  end
}

M.diagnostic_signs = {
  Error = " ",
  Warn  = " ",
  Hint  = "󱧢 ",
  Info  = " ",
  other = "﫠"
}

M.lsp_icons = {
  Text = " ", Method = " ", Function = " ", Constructor = " ", Field = " ",
  Variable = " ", Class = " ", Interface = " ", Module = " ", Property = " ",
  Unit = " ", Value = " ", Enum = " ", Keyword = " ", Snippet = " ",
  Color = " ", File = " ", Reference = " ", Folder = " ", EnumMember = " ",
  Constant = " ", Struct = " ", Event = " ", Operator = " ", TypeParameter = " "
}

M.todo_icons = {
  note = " ",
  todo = "﫠",
  warn = " ",
  fix = " "
}

return M
