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
#alias grep="grep --color=always"
alias tags='ctags -R --exclude="node_modules" --exclude="*.js" --exclude="var" --exclude="translations" --exclude="templates" --exclude="public" .'

