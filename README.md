## Something about
It's a really simple config that's can be used for small and not small development with help of powerful ⚡ plugins for neovim.

Tested and worked on:
```
Windows 11
WSL Debian distro
Windows Terminal, Tabby, Hyper terminal emulators
Win32Yank as clipboard provider
```

There are in this config:

- [`packer.nvim`](https://github.com/wbthomason/packer.nvim) used as plugin manager
- [`telescope.nvim`](https://github.com/nvim-telescope/telescope.nvim) used as files/stringsInFiles browser
- [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter) used as syntax highlighter
- [`mason.nvim`](https://github.com/williamboman/mason.nvim) used as lsp manager
- [`nvim-cmp`](https://github.com/hrsh7th/nvim-cmp) used as completion engine

and others for some additional functionality :)


<br>


## Config pros and cons
### pros
- Aesthetic appearance ⊙⁠﹏⁠⊙
- Good extensibility without adding new files for setuping
- Not found more yet, but i believe in increasing of pros cuz i have ideas

### cons
- Not common file manager: [`telescope-file-browser.nvim`](https://github.com/nvim-telescope/telescope-file-browser.nvim) instead [`nvim-tree.lua`](https://github.com/nvim-tree/nvim-tree.lua) and similar
- Might be not optimal solutions


<br>


## Instalation
- Backup your config if have
- Install [`git`](https://git-scm.com/downloads) if haven't
- Clone rep to `~/.config/nvim/` by following command:
```
git -C ~/.config/nvim/ clone https://github.com/Imrvrs/nvim.git
```
- Install [`packer.nvim`](https://github.com/wbthomason/packer.nvim)
- In nvim run `:PackerSync` and restart
- In nvim run `:checkhealth` and install some requirements from command output window


<br>


## Can be improved
### #TODO
- Add relative links on sections of README.md
- Add keymaps, full plugin list and showcases here
- Add tabline
- Add plugin for managing /#TODO's and /#FIXME's
- Add centralised lua interface for configuring options, mappings and plugins
- Add lazy loading where possible
- Make an interface more aesthetically😳🛐🛐🛐
- Maybe add .sh that will install neovim😳 & packer😳 if haven't 🛐

### #FIXME
- Fix cmp showing of window with function parameters
- Remove unused parameters from plugins setups
- Classify options by categories
- Maybe do refactoring of plugins setups
- Configure telescope file browser or change to another file browser
