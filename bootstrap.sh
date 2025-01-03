#! /usr/bin/env bash

## Manual part
echo "You need to manually install:"

echo "Docker Desktop: https://www.docker.com/products/docker-desktop/"

echo "Arc: https://arc.net/"

read -p "Did you install the packages above? [y/n] " RESP

### Manual settings
echo "[macos] Settings -> Appearance -> Dark mode"
echo "[macos] Settings -> Trackpad -> Enable Tap to click"
echo "[macos] Settings -> Trackpad -> Secondary click = Click in Bottom Right Corner"
echo "[macos] Settings -> Trackpad -> Disable Natural scrolling"

echo "[arc] Settings -> Shortcuts -> Remove 'New Window' shortcut"
echo "[arc] Settings -> Shortcuts -> Remove 'New Little Arc Window' shortcut"

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
mkdir -p ~/projects/personal

## System tools
echo "Installing system tools.."

### brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update

### packages
brew install ghostty zsh neovim font-hack-nerd-font bat zoxide fzf git-delta ripgrep watch zsh-autosuggestions n jq eza

## Developer tools
echo "Installing developer tools.."

### latest note
n lts

### reload zsh
source ~/.zshrc

### pnpm
corepack enable pnpm

## Configs
echo "Installing custom configs.."

### .zshrc
cp ./config/zsh/zshrc ~/.zshrc

### git configs
cp ./config/git/gitconfig ~/.gitconfig
cp ./config/git/gitconfig_personal ~/projects/.gitconfig_personal

### neovim config
cp ./config/nvim/init.lua ~/.config/nvim/

### mac specific
defaults write -g ApplePressAndHoldEnabled -bool false
