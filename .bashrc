export PS1='--- \[\e[1;30m\][\[\e[0m\]\u\[\e[1;30m\]@\[\e[0m\]\H \[\e[0;31m\]\W\[\e[1;30m\]] \d :: \t ---\n$\[\e[0m\] '

export PATH="/Applications/anaconda/bin:/usr/local/bin:$PATH"
export GOPATH=$HOME/Projects/GoProjects

alias ll='ls -Ghl'

svndiff()
{
  svn diff "${@}" | colordiff | less -R
}

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

shopt -s histappend
export HISTIGNORE="&:exit"
export HISTFILESIZE=5000
export HISTSIZE=5000

