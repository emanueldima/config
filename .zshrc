export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="edima"


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

formatxml () { xmllint --format $1 > $1.formatted; mv $1.formatted $1; }

#kill zoomus local server
lsof -i :19421 | grep ZoomOp | cut -f2 -d' ' | xargs kill -9

export PYTHONSTARTUP="$HOME/.dotfiles/python-startup.py"
export JAVA_HOME=`/usr/libexec/java_home -v 11`
export GPG_TTY=$(tty);
export GOPATH=$HOME/Projects/Go
export PATH="$HOME/.cargo/bin:/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib"

# $(docker-machine env dev)

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi
