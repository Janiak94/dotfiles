# Source zsh plugins
source $(brew --prefix)/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(pyenv init -)"

# Bob, neovim version manager
export PATH="${PATH}:${HOME}/.local/share/bob/nvim-bin"

# Aliases
alias ssh="TERM=xterm-256color ssh"
alias ll="ls -al"
alias du="du -hs ./*"
alias vim=nvim

# Zsh theme
source /opt/homebrew/opt/powerlevel9k/powerlevel9k.zsh-theme
source $HOME/dotfiles/.powerlevel9k

alias n="nnn"
function nnn () {
  command nnn "$@"

  if [ -f "$NNN_TMPFILE" ]; then
          . "$NNN_TMPFILE"
  fi
}

function kill () {
  command kill -KILL $(pidof "$@")
}

function suyabai () {
  SHA256=$(shasum -a 256 /opt/homebrew/bin/yabai | awk "{print \$1;}")
  if [ -f "/private/etc/sudoers.d/yabai" ]; then
    sudo sed -i '' -e 's/sha256:[[:alnum:]]*/sha256:'${SHA256}'/' /private/etc/sudoers.d/yabai
  else
    echo "sudoers file does not exist yet"
  fi
}

# Color Scheme
export BLACK=0xff181819
export WHITE=0xffe2e2e3
export RED=0xfffc5d7c
export GREEN=0xff9ed072
export BLUE=0xff76cce0
export YELLOW=0xffe7c664
export ORANGE=0xfff39660
export MAGENTA=0xffb39df3
export GREY=0xff7f8490
export TRANSPARENT=0x00000000
export BG0=0xff2c2e34
export BG1=0xff363944
export BG2=0xff414550

source "$HOME/.cargo/env"

export NNN_TMPFILE="$HOME/.config/nnn/.lastd"
export NNN_OPTS="AdHoU"
export NNN_FCOLORS='c1e2272e006033f7c6d6abc4'
export EDITOR="$(which nvim)"
export VISUAL="$(which nvim)"
export MANPAGER="$(which nvim) +Man!"
export XDG_CONFIG_HOME="$HOME/.config"

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

# Created by `pipx` on 2024-07-13 18:04:50
export PATH="$PATH:/Users/jensnilsson/.local/bin"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

