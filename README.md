# dotfiles

Sensible and easily replicable setup for a macbook.

### Includes

The following will be installed:

- apps
    - [iTerm2](https://iterm2.com/)
    - [Arc](https://arc.net/)
    - [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- zsh
- neovim
    - based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
    - gitsigns
    - [typescript-tools](https://github.com/pmizio/typescript-tools.nvim)
    - [tokyonight theme](https://github.com/folke/tokyonight.nvim)
    - custom bindings
        - jump to definition in split window
- terminal tools
    - [eza](https://github.com/eza-community/eza) (better `ls`)
    - [bat](https://github.com/sharkdp/bat) (better `cat`)
    - [zoxide](https://github.com/ajeetdsouza/zoxide) (better `cd`)
    - [fzf](https://github.com/junegunn/fzf)
    - [git-delta](https://github.com/dandavison/delta) (better `git diff`)

### Getting started

To get started, you can run:

```sh
chmod +x ./bootstrap.sh

./bootstrap.sh
```

_Note: You need to manually install iTerm2, Arc and Docker Desktop_

TODO:
- [ ] Unify git configs in ~/.gitconfigs/...
- [ ] Fetch theme files directly from github repos instead of having them as files
- [ ] Clean nvim config (remove unused parts)
- [ ] List needed Arc extensions

