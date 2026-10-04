# load zinit plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh" &> /dev/null

zinit light trapd00r/LS_COLORS

## Plugins ##
zinit wait lucid for \
  atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
    zsh-users/zsh-history-substring-search \
  zdharma-continuum/history-search-multi-word

## KEY ##
bindkey -e

bindkey '^[[H'    beginning-of-line   # Home (normal mode)
bindkey '^[OH'    beginning-of-line   # Home (application mode)
bindkey '^[[1~'   beginning-of-line   # Home (tmux)
bindkey '^[[7~'   beginning-of-line   # Home (rxvt)
bindkey '^[[F'    end-of-line         # End (normal mode)
bindkey '^[OF'    end-of-line         # End (application mode)
bindkey '^[[4~'   end-of-line         # End (tmux)
bindkey '^[[8~'   end-of-line         # End (rxvt)

bindkey '^[[3~'   delete-char         # Delete
bindkey '^[[1;5C' forward-word        # Ctrl+Right
bindkey '^[[1;5D' backward-word       # Ctrl+Left

## NAVIGATION ##
typeset -U path
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt AUTO_CD
setopt CORRECT

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
alias gname="head -c 100 /dev/urandom | md5sum"
alias gg="lazygit"

### HISTORY ###
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward

## EXPORT ##
export REPORTTIME=10
export COLORTERM=truecolor
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

_host_colors=(196 202 208 214 118 46 48 51 45 39 33 27 87 123)
_sum=0
for _c in ${(s::)HOST}; do (( _sum += #_c )); done
_host_color=${_host_colors[$(( _sum % ${#_host_colors} + 1 ))]}
unset _sum _c

PS1="%F{#ff10f0}%n%F{yellow}@%F{${_host_color}}%m %B%F{#cc00ff}λ%f%b "
