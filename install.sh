# Install xCode cli tools
echo "Installing commandline tools..."
xcode-select --install

# Homebrew
## Install
echo "Installing brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

# Use brewfile next to this one
BREWFILE="$(dirname $0)/Brewfile"
echo "Installing brew bundle from '$BREWFILE'"
brew bundle --file=$BREWFILE

# Tmux
## Plugin manager
echo "Installing tmux plugin manager..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

source $HOME/.zshrc

echo "Installation complete...\n"
