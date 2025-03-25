# dotfiles

Sensible and easily replicable setup for a macbook.

### Includes

The following will be installed:

- apps
    - [ghostty](https://ghostty.org/)
    - [Arc](https://arc.net/)
        - [React Developer Tools](https://chromewebstore.google.com/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi?hl=en)
        - [Apollo Client Devtools](https://chromewebstore.google.com/detail/apollo-client-devtools/jdkknkkbebbapilgoeccciglkfbmbnfm)
    - [Docker Desktop](https://www.docker.com/products/docker-desktop/)
    - [Raycast](https://raycast.com)
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

_Note: You need to manually install Arc, Docker Desktop and Raycast_

### nvim config variables Further vim customisation

- Enable / disable formatting files on save - `DOTFILES_NVIM_PLUGINS_CONFORM_FORMAT_ON_SAVE`

TODO:
- [ ] Improve telescope file search (FileName.tsx -> /src/.../...)
- [ ] Unify git configs in ~/.gitconfigs/...
- [ ] Clean nvim config (remove unused parts)
