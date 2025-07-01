# load zinit plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh" &> /dev/null
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
compinit

## Plugins ##
zinit light trapd00r/LS_COLORS
zinit load zdharma-continuum/history-search-multi-word
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit load marzocchi/zsh-notify

## COLORS ##
#(cat ~/.cache/wal/sequences &) &>/dev/null
#source ~/.cache/wal/colors-tty.sh &>/dev/null

## KEY ##
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char

## VIM MODE ##
bindkey -v

## NAVIGATION ##
typeset -U path
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt AUTO_CD
setopt CORRECT
setopt CORRECT_ALL

## TAB COMP ##
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

## HISTORY ##
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt share_history

## ALIAS ##
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ..="cd .."

### COLORS ###
alias ip="ip -c"
alias ls="ls --color"
alias sl="ls --color"
alias cat="bat --decorations never"
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

### SRE ###
alias k="kubecolor"
alias o="openstack"
alias t="talosctl"
alias tf="tofu"
alias dc="docker compose"

### MISC ###
alias nf="cd $HOME/.dotfiles-nix && nvim . && cd -"
alias gname="head -c 100 /dev/urandom | md5sum"

## BINDKEY ###
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

### NAVIGATION ###
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^F' forward-char
bindkey '^B' backward-char
bindkey '^[f' forward-word
bindkey '^[b' backward-word

### EDITING ###
bindkey '^D' delete-char
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char
bindkey '^W' backward-kill-word
bindkey '^U' backward-kill-line
bindkey '^K' kill-line

### HISTORY ###
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward


## EXPORT ##
export TERM=xterm-256color
export REPORTTIME=10
export COLORTERM=truecolor
PS1='%F{pink}%n@%m %F{green}%~%f %F{purple}λ%f '
#PS1="%n@%m λ " # shell prompt
