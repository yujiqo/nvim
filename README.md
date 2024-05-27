# Main plugins

- [`lazy.nvim`](https://github.com/folke/lazy.nvim) as a plugin manager
- [`telescope.nvim`](https://github.com/nvim-telescope/telescope.nvim) as an in-project file, diagnostic, todo, etc search
- [`trouble.nvim`](https://github.com/folke/trouble.nvim) as a workspace diagnostic and todo search
- [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter) as a syntax highlighter
- [`mason.nvim`](https://github.com/williamboman/mason.nvim) as a lsp, formatter, linter manager
- [`nvim-cmp`](https://github.com/hrsh7th/nvim-cmp) as a completion engine

and others for other cool functionality :D


<br>


# How to add a language support
## 1. Go to `./lua/utils.lua`

## 2. Add parser. You can find parser name [here](https://github.com/nvim-treesitter/nvim-treesitter)
![image](https://github.com/yujiqo/nvim/assets/92727678/4909a174-4918-4fe6-b792-19d0c6b504a2)

## 3. Add language server. You can find server name [here](https://github.com/williamboman/mason.nvim)
![image](https://github.com/yujiqo/nvim/assets/92727678/a7f9daf7-b4d9-4d19-8068-fe7bf25dd674)

### You can add server config as well. it's not necessary though so if you don't, server will get a default config - {}
![image](https://github.com/yujiqo/nvim/assets/92727678/981210d0-d1d2-487d-a8c3-0680a304220d)

### 4. Add one or more formatters and linters (optional). You can find formatter name [here](https://github.com/stevearc/conform.nvim) and linter name [here](https://github.com/mfussenegger/nvim-lint)
![image](https://github.com/yujiqo/nvim/assets/92727678/f15bab63-1ea1-4c7f-9070-70240fe22f18)

### Don't forget to specify formatter/linter to a filetype there: `./lua/configs/lsp.lua`!
![image](https://github.com/yujiqo/nvim/assets/92727678/f021e926-9098-478c-a332-4fbebb248cc8)
![image](https://github.com/yujiqo/nvim/assets/92727678/6025979e-31ed-43f1-916a-7df32a752adb)


<br>


# Instalation
- Backup your config if you have
- Clone rep to `~/.config/` by following command:
```
git -C ~/.config/ clone https://github.com/yujiqo/nvim.git
```
- Run nvim and wait until all of plugins are installed then restart nvim

That's it!
