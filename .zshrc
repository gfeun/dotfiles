# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:"$HOME"/.local/bin:$PATH
#export TERM=xterm-256color

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

export FZF_COMPLETION_TRIGGER='€€'
export GOPATH=$HOME/go

# Brew
export HOMEBREW_NO_ANALYTICS=1
# Reverse search path to look for brew bin last
# eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew";
export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar";
export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew";
export PATH="${PATH:+$PATH:}/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin";
export MANPATH="$(manpath -g):/home/linuxbrew/.linuxbrew/share/man";
export INFOPATH="${INFOPATH:+$INFOPATH:}/home/linuxbrew/.linuxbrew/share/info";

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

# Krew
export PATH="${PATH}:${HOME}/.krew/bin"

export PATH="$HOME/.cargo/bin:$PATH" # Cargo install
export PATH="$HOME/go/bin:$PATH"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="pygmalion"
ZSH_THEME="powerlevel10k/powerlevel10k"

source ~/.oh-my-zsh/custom/plugins/fzf-tab/fzf-tab.plugin.zsh

DISABLE_AUTO_UPDATE="true"

plugins=(
  autojump
  git
  gh
  vi-mode
  sudo
  docker
  kubectl
  kube-ps1
  golang
  bgnotify
  rust
  pip
  fzf
  systemd
  minikube
  taskwarrior
  terraform
)

source $ZSH/oh-my-zsh.sh

HISTSIZE=10000000
SAVEHIST=10000000

unsetopt BEEP
source <(fzf --zsh)

export EDITOR='nvim'
bindkey -M viins 'jk' vi-cmd-mode
bindkey "^[b" backward-word
bindkey "^[f" forward-word


# Make less display 5 lines of context before search match
export LESS=-j5
export DOCKER_BUILDKIT=1

# aliases
alias apl='sudo -E apt update && sudo apt list --upgradable'
alias apu='sudo -E apt upgrade'
alias api='sudo -E apt install'
alias aps='sudo -E apt search'
alias wiki='vim -c VimwikiIndex'
alias yga='yadm add'
alias ygc='yadm commit'
alias ygp='yadm push'
alias ygst='yadm status'
alias tz='task project:zenika'

alias icat='kitty +kitten icat'
alias plantuml='docker run -i --rm plantuml-docker plantuml'

alias vim='nvim'
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

WT() {
  while true;
  do
    $*
  done
}

WTS() {
  local SLEEP=$1
  shift
  while true;
  do
    $*
    sleep $SLEEP
  done
}



PATH="/home/gfeun/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/gfeun/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
#PERL_LOCAL_LIB_ROOT="/home/gfeun/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
#PERL_MB_OPT="--install_base \"/home/gfeun/perl5\""; export PERL_MB_OPT;
#PERL_MM_OPT="INSTALL_BASE=/home/gfeun/perl5"; export PERL_MM_OPT;

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=/home/gfeun/google-cloud-sdk/bin/:$PATH
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/gfeun/google-cloud-sdk/path.zsh.inc' ]; then . '/home/gfeun/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/gfeun/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/gfeun/google-cloud-sdk/completion.zsh.inc'; fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
