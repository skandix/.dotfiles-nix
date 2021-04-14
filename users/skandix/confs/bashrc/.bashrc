[[ $- == *i* ]] || return

# Dircolors
export LS_OPTIONS='--color=auto'

# Alias
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"
alias ..="cd .."
alias ls='ls --color'
alias ip='ip -c'
alias pressmd='reveal-md --theme solarized --highlight-theme solarized-dark '

# Auto complete
# [[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion
# source <(kubectl completion bash)

neofetch

export PS1="[\t] \u@\h λ "