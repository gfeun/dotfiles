# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/home/dev/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/dev/.oh-my-zsh
export FZF_BASE=~/.fzf/


# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="pygmalion"
ZSH_THEME="powerlevel9k/powerlevel9k"

setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS

DISABLE_AUTO_UPDATE="true"

plugins=(
  git
  vi-mode
  sudo
  kubectl
  kube-ps1
  golang
  bgnotify
  cargo
  rust
  pip
  fzf
  systemd
  minikube
)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export EDITOR='vim'
bindkey -M viins 'jk' vi-cmd-mode

export PATH="$HOME/.cargo/bin:$PATH" # Cargo install

export PATH="$PATH:/usr/local/go/bin"
export GOBIN=/home/dev/go/bin/
export PATH=$PATH:$GOBIN
export GOPATH=/home/dev/go
export GOROOT=/usr/local/go

# aliases
alias apl='sudo -E apt update && sudo apt list --upgradable'
alias apu='sudo -E apt upgrade'
alias api='sudo -E apt install'
alias aps='sudo -E apt search'
alias wiki='vim -c VimwikiIndex'

# functions
reset_vpn() {
  sudo pkill openvpn
  sudo pkill orange-vpn-watc
  sudo nmcli device delete tap5
}

# Background command notification format. Plugin bgnotify
function bgnotify_formatted {
  ## $1=exit_status, $2=command, $3=elapsed_time
  bgnotify "$2 returned $1 after $3 s";
}

enable_secondary_screen() {
  if [[ $1 == "only" ]]; then
    xrandr --output eDP-1 --off --output DP-1 --auto
  else
    xrandr --output eDP-1 --auto --output DP-1 --auto --right-of eDP-1
  fi
}

disable_secondary_screen() {
  xrandr --output  eDP-1 --primary --auto --output DP-1 --off
}

search_and_replace() {
  matched_files=$(grep -R "$1" -l)

  declare -a matched_files_array
  while read -r file
  do
    matched_files_array+=($file)
  done <<< "$matched_files"

  for file in $matched_files_array; do
    echo "$file"
    # Start vim without plugins in search/replace mode
    vim -u NONE -c "%s/$1/$2/gc" -c "wq" "$file";
  done
}

vp() {
  file=$(fzf --preview 'bat --style=numbers --color=always {}')
  if [[ $file != "" ]]; then
    vim $file
  fi
}
