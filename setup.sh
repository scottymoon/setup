#!/bin/bash

###
# Setup
# Get yo computer setup, bruh.
###
echo "Running Setup - Base..."

echo "Homebrew - package manager for macOS"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade

echo "Harvest - timetracking"
brew cask install harvest

echo "Slack - communication"
brew cask install slack

echo "git - version control"
brew install git

# echo "Alacritty - better terminal application"
# brew cask install alacritty

# echo "tmux - terminal multiplexer"
# brew install tmux

echo "zsh - alternative shell, like bash but more awesome"
brew install zsh zsh-completions

echo "zsh - changing the default shell to zsh"
sudo -s 'echo /usr/local/bin/zsh >> /etc/shells' && chsh -s /usr/local/bin/zsh

echo "ohmyzsh - plugins and themes for zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed '/\s*env\s\s*zsh\s*/d')"

echo "nvm - node version manager and installer"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

echo "nvm - downloading latest node lts"
nvm install --lts

echo "Visual Studio Code - default code editor"
brew cask install visual-studio-code

echo "Finishing Setup - restart for changes to take effect"
osascript -e 'tell app "loginwindow" to «event aevtrrst»'
