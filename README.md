## Something about
It's a really simple config that's can be used for small and not small development with help of powerful ⚡ plugins for neovim.

Tested and worked on:
```
Windows 11
WSL Debian distro
Alacritty terminal emulator
Win32Yank as clipboard provider
```

There are in this config:

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


<br>


## Can be improved
### #TODO
- Add relative links on sections of README.md
- Add keymaps, full plugin list and showcases here
- Add centralised lua interface for configuring options, mappings and plugins
- Maybe add .sh that will install neovim😳 & packer😳 if haven't 🛐

### #FIXME
- Classify options by categories
