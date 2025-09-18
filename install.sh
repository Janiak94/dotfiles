# Install xCode cli tools
echo "Installing commandline tools..."
xcode-select --install

# Homebrew
## Install
echo "Installing brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

## Taps
echo "Tapping brew..."
brew tap koekeishiya/formulae
brew tap sambadevi/powerlevel9k
brew tap homebrew/cask-fonts
brew tap mhaeuser/mhaeuser

## Formulae
echo "Installing brew formulae..."
### Essentials
brew install cmake
brew install xz
brew install skhd
brew install yabai
brew install ripgrep
brew install pyenv
brew install starship
brew install rustup-init
brew install npm
brew install bash
brew install bc
brew install coreutils
brew install gawk
brew install gh
brew install glab
brew install gsed
brew install jq

### Terminal
brew install zsh-autosuggestions
brew install zsh-fast-syntax-highlighting
brew install zoxide
brew install powerlevel9k
brew install fzf
brew install fd
brew install bat
brew install eza

### Nice to have
brew install git-delta
brew install luarocks
# TODO

## Casks
echo "Installing brew casks..."
brew install --cask docker && brew install docker-compose

### Nice to have
brew install --cask visual-studio-code
brew install --cask spotify

### Fonts
brew install --cask sf-symbols
brew install --cask font-hack-nerd-font
brew install --cask font-jetbrains-mono
brew install --cask font-fira-code
brew install --cask font-monaspace-nerd-font
brew install --cask font-noto-sans-symbols-2

# Installing Fonts
git clone git@github.com:shaunsingh/SFMono-Nerd-Font-Ligaturized.git /tmp/SFMono_Nerd_Font
mv /tmp/SFMono_Nerd_Font/* $HOME/Library/Fonts
rm -rf /tmp/SFMono_Nerd_Font/

# Tmux
## Plugin manager
echo "Installing tmux plugin manager..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Nvchad
echo "Installing nvchad..."
git clone https://github.com/NvChad/starter ~/.config/nvim

# Battery-toolkit
echo "Installing Battery-Toolkit"
brew install battery-toolkit

source $HOME/.zshrc

echo "Installation complete...\n"
