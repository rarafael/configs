# ~/.bashrc
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
shopt -s autocd
stty -ixon

export EDITOR='vim'
export VISUAL='vim'
export LESSHISTFILE='-'
export GNUPGHOME='$XDG_DATA_HOME/gnupg'

alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -v'
alias vi='vim'
alias nvim='vim'
alias ls='ls -Ahl --color=auto'
alias sl='ls -Ahl --color=auto'
alias tar-unpack='tar -zxvf'
alias tar-create='tar -cvf'
alias tar-pack='tar -cvf'
alias sxiv='sxiv -a'
PS1='\[\e[0;32m\]\u\[\e[0m\]@\[\e[0;32m\]\h \[\e[0;94m\]\W \[\e[0m\]\$ \[\e[0m\]' 
