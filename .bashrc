export PATH=~/.cargo/bin:${PATH}
export PATH=~/.local/share/bob/nvim-bin:${PATH}
export PATH=~/.local/bin/env:${PATH} # uv
export PATH=~/.fzf/bin:${PATH}

eval "$(starship init ${SHELL})"
eval "$(fzf --bash)"
