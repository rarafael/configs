PROMPT='%F{green}%n%f@%F{green}%m%f %F{blue}%B%~%b%f %# '
autoload -U colors && colors
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
_comp_options+=(globdots)
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
setopt autocd
unsetopt beep
autoload -Uz run-help
(( ${+aliases[run-help]} )) && unalias run-help
alias help=run-help
bindkey -v

alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -v'
alias ln='ln -v'
alias vi='vim'
alias nvim='vim'
alias ls='ls -Ahl --color=auto'
alias sl='ls -Ahl --color=auto'
alias exiit='exit'
alias tar-unpack='tar -xvf'
alias tar-create='tar -cvf'
alias tar-pack='tar -cvf'
alias wttr='curl -s wttr.in | grep -v "Follow"'
alias sxiv='sxiv -a'
alias du='du -h'
alias uptime='uptime -p'
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
