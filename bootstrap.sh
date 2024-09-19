#! /usr/bin/env bash

echo "You need to manually install:"

echo "iterm2: https://iterm2.com/downloads.html (Note: You also need to manually install the tokyo-nights theme)"

echo "Docker Desktop: https://www.docker.com/products/docker-desktop/"

echo "Arc: https://arc.net/"

read -p "Did you install the packages above? [y/n] " RESP

if [ "$RESP" = "y" ]; then
	echo "Great! Starting setup.."
else
	echo "Please install before trying again"
	exit 1
fi

## Necessary paths
echo "Creating folders.."

mkdir -p ~/.config/zsh
mkdir -p ~/.config/nvim
mkdir -p ~/.config/bat/themes
mkdir -p ~/projects/personal

## System tools
echo "Installing system tools.."

### brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

### zsh
brew install zsh

### oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

### neovim
brew install neovim

## Developer tools
echo "Installing developer tools.."

### nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

### latest note
source ~/.zshrc

nvm install node

### pnpm
corepack enable pnpm

### packages
brew install font-hack-nerd-font
brew install eza
brew install bat
brew install zoxide
brew install fzf
brew install git-delta
brew install thefuck

## Configs
echo "Installing custom configs.."

### zsh powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

cp ./config/zsh/p10k.zsh ~/.p10k.zsh

### bat theme
cp ./config/bat/tokyonight_night.tmTheme ~/.config/bat/themes/

bat cache --build

### .zshrc
cp ./config/zsh/zshrc ~/.zshrc

### git configs
cp ./config/git/gitconfig ~/.gitconfig
cp ./config/git/gitconfig_personal ~/projects/.gitconfig_personal

### neovim config
cp ./config/nvim/init.lua ~/.config/nvim/
