## Something about
It's a really simple config that's can be used for small and not small development with help of powerful ⚡ plugins for neovim.

<br>

![](https://user-images.githubusercontent.com/92727678/209987213-9ba9ee77-ae2e-47eb-b1cc-96f0c8b9ab96.png)

![](https://user-images.githubusercontent.com/92727678/209987617-827c995f-f68a-4418-a79a-e7aca5c24e2e.png)

### Main plugins

- [`lazy.nvim`](https://github.com/folke/lazy.nvim) used as plugin manager
- [`telescope.nvim`](https://github.com/nvim-telescope/telescope.nvim) used as inproject search
- [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter) used as syntax highlighter
- [`mason.nvim`](https://github.com/williamboman/mason.nvim) used as lsp manager
- [`nvim-cmp`](https://github.com/hrsh7th/nvim-cmp) used as completion engine

and others for some additional functionality :)


<br>


## Instalation
- Backup your config if have
- Install [`git`](https://git-scm.com/downloads) if haven't
- Clone rep to `~/.config/nvim/` by following command:
```
git -C ~/.config/nvim/ clone https://github.com/Imrvrs/nvim.git
```
- Install [`lazy.nvim`](https://github.com/folke/lazy.nvim)
- In nvim run `:Lazy sync` and restart
- In nvim run `:checkhealth` and install some requirements from command output window
