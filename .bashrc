export PS1='--- \[\e[1;30m\][\[\e[0m\]\u@\h \[\e[0;31m\]\W\[\e[1;30m\]] \d :: \t ---\n$\[\e[0m\] '

export GOROOT=/usr/local/Cellar/go/1.1
export PATH=$PATH:$GOROOT/bin
export GOPATH=$HOME/Projects/GoProjects

alias ll='ls -Gl'

svndiff()
{
  svn diff "${@}" | colordiff
}
