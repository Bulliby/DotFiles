HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
# History timestamps
setopt EXTENDED_HISTORY

export EDITOR="nvim"
alias gt="git status"
alias gl="git log --graph --oneline --decorate --all"
alias bip="echo -e '\a'"
alias vi="nvim"
alias vim="nvim"
alias glar='grep -rn --exclude-dir="vendor" --exclude-dir="node_module" --exclude="tags"'
alias ls="ls --color=always"
#alias grep="grep --color=always"
alias tags='ctags -R --exclude="node_modules" --exclude="*.js" --exclude="var" --exclude="translations" --exclude="templates" --exclude="public" .'

# Avoid Ctrl-S, stop automatic scroll, when no pager was available
stty -ixon

bindkey ^R history-incremental-search-backward
# Need stty -ixon
bindkey ^S history-incremental-search-forward

# Git infos
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b'

setopt PROMPT_SUBST
PROMPT='%F{%(#|red|blue)}%B%m%b%(#|%-1d.%1d|%~)%f %F{red}${vcs_info_msg_0_}%f %% '
