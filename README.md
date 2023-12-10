## Main plugins

- [`lazy.nvim`](https://github.com/folke/lazy.nvim) used as plugin manager
- [`telescope.nvim`](https://github.com/nvim-telescope/telescope.nvim) used as inproject search
- [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter) used as syntax highlighter
- [`mason.nvim`](https://github.com/williamboman/mason.nvim) used as lsp manager
- [`nvim-cmp`](https://github.com/hrsh7th/nvim-cmp) used as completion engine

and others for some additional functionality :)


<br>


## How to add language support
### 1. Go to ./lua/utils.lua
![Screenshot_50](https://github.com/yujiqo/nvim/assets/92727678/c46a6081-b418-435d-a1da-529929cdd681)

### 2. Add parser. Find parser name [there](https://github.com/nvim-treesitter/nvim-treesitter)
![Screenshot_46](https://github.com/yujiqo/nvim/assets/92727678/5c56131b-1866-432e-b467-a51ada2b4591)

### 3. Add language server. Find server name [there](https://github.com/williamboman/mason.nvim)
![Screenshot_48](https://github.com/yujiqo/nvim/assets/92727678/f499fea0-d9ea-4cdc-9a39-ae7a9c9c3518)

### 4. Add config for language server (optional) if you don't, server will get default config - {}
![Screenshot_49](https://github.com/yujiqo/nvim/assets/92727678/1451690e-0247-46a0-84c7-94e9563cd462)


<br>


## Instalation
- Backup your config if have
- Install [`git`](https://git-scm.com/downloads) if haven't
- Clone rep to `~/.config/` by following command:
```
git -C ~/.config/ clone https://github.com/yujiqo/nvim.git
```
- Run nvim and after plugin installing restart it

That's it!
