#! /usr/bin/env bash

## Manual part
echo "You need to manually install:"

echo "Docker Desktop: https://www.docker.com/products/docker-desktop/"
echo "Arc: https://arc.net/"
echo "Raycast: https://www.raycast.com/"

read -p "Did you install the packages above? [y/n] " RESP

### Manual settings
echo "[arc] Settings -> Shortcuts -> Remove 'New Window' shortcut"
echo "[arc] Settings -> Shortcuts -> Remove 'New Little Arc Window' shortcut"

echo "[macos] System Preferences -> Keyboard -> Shortcuts -> Show Spotlight search -> Disable"
echo "[raycast] Raycast Settings -> General -> Raycast Hotkey -> cmd + space"
echo "[raycast] Raycast Settings -> Extensions -> Applications -> Arc -> option + a"
echo "[raycast] Raycast Settings -> Extensions -> Applications -> Ghostty -> option + g"
echo "[raycast] Raycast Settings -> Extensions -> Applications -> Notes -> option + n"
echo "[raycast] Raycast Settings -> Extensions -> Applications -> Slack -> option + s"
echo "[raycast] Raycast Settings -> Extensions -> Applications -> Spotify -> option + y"
echo "[raycast] Raycast Settings -> Extensions -> Applications -> Teams -> option + t"
echo "[raycast] Raycast Settings -> Extensions -> Applications -> Raycast Notes -> option + z"

if [ "$RESP" = "y" ]; then
	echo "Great! Starting setup.."
else
	echo "Please install before trying again"
	exit 1
fi

## Necessary paths
echo "Creating folders.."

mkdir -p ~/.config/{zsh,nvim,ghostty}
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

### .zshrc
cp ./config/zsh/zshrc ~/.zshrc

source ~/.zshrc

### latest note
n lts

### pnpm
corepack enable pnpm

## Configs
echo "Installing custom configs.."

### SSH key
ssh-keygen -t ed25519 -C "email"

### git configs
cp ./config/git/gitconfig ~/.gitconfig
cp ./config/git/gitconfig_personal ~/projects/.gitconfig_personal

### neovim config
cp ./config/nvim/init.lua ~/.config/nvim/init.lua

### ghostty config
cp ./config/ghostty/config ~/.config/ghostty/config

### mac specific

### Close System settings to prevent overrides
osascript -e 'tell application "System Preferences" to quit'

#### Dark mode
defaults write NSGlobalDomain AppleInterfaceStyle Dark

#### Enable tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

#### Right corner right click
defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1

#### Disable natural scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

#### Minimize to application
defaults write com.apple.dock minimize-to-application -bool true

#### Do not show recents in Dock
defaults write com.apple.dock show-recents -bool false

#### Disable key hold
defaults write -g ApplePressAndHoldEnabled -bool false

#### Disable text correction
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticTextCompletionEnabled -bool false

#### Finder
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder FXPreferredViewStyle Nlsv
defaults write com.apple.finder QuitMenuItem -bool true
