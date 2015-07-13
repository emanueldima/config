export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="edima"


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

svndiff()
{
  svn diff "${@}" | colordiff | less -R
}

export JAVA_HOME=`/usr/libexec/java_home`
export GOPATH=$HOME/Projects/Go
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$JAVA_HOME/bin:/Applications/anaconda/bin:$PATH:$GOPATH/bin:"

export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/edima/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

