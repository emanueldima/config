export PS1='--- \[\e[1;30m\][\[\e[0m\]\u\[\e[1;30m\]@\[\e[0m\]\H \[\e[0;31m\]\W\[\e[1;30m\]] \d :: \t ---\n$\[\e[0m\] '

#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_51.jdk/Contents/Home
export JAVA_HOME=`/usr/libexec/java_home`

export GOPATH=$HOME/Projects/Go
export PATH="$JAVA_HOME/bin:/Applications/anaconda/bin:/usr/local/bin:$PATH:$GOPATH/bin"
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

# $(docker-machine env dev)

export PATH="$HOME/.cargo/bin:$PATH"
