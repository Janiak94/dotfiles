export PATH=~/.cargo/bin:${PATH}
export PATH=~/.local/share/bob/nvim-bin:${PATH}
export PATH=~/.local/bin/env:${PATH} # uv
export PATH=~/.fzf/bin:${PATH}

eval "$(starship init ${SHELL})"

case $(basename $(which ${SHELL})) in
"bash")
  shell_opt="--bash"
  ;;

"zsh")
  shell_opt="--zsh"
  ;;
*)
  echo "unknown"
  ;;
esac
eval "$(fzf ${shell_opt})"
