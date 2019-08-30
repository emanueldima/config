export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="edima"


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

#kill zoomus local server
lsof -i :19421 | grep ZoomOp | cut -f2 -d' ' | xargs kill -9

svndiff()
{
  svn diff "${@}" | colordiff | less -R
}

cdgl()
{
  cd "$HOME/Projects/gitlab.wl/${@}"
}

cdgh()
{
  cd "$HOME/Projects/github.com/${@}"
}

lr()
{
	for f in $*; do
		echo;
		echo --- $f;
		grep --color=always -E 'pub\s|impl\s' $f | sed s/{//;
	done
}


export JAVA_HOME=`/usr/libexec/java_home 2>/dev/null`
export GOPATH=$HOME/Projects/Go
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$HOME/.cargo/bin:/usr/local/opt/ruby/bin:$PATH"
#export PATH="$JAVA_HOME/bin:$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin"
export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib"
export PYTHONSTARTUP=~/.dotfiles/python-startup.py

# $(docker-machine env dev)

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi
