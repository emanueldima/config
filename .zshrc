export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/oh-my-zsh.sh
compdef _gnu_generic delta

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git virtualenv)

# User configuration

formatxml () { xmllint --format $1 > $1.formatted; mv $1.formatted $1; }
lumina() { m1ddc display 1 set luminance "${1}0"; m1ddc display 1 set luminance "${1}0" }
hl() { grep --color=always "$1\|$" }
docker-run-figlocal() { docker run --rm -it -v "`pwd`:/app:cached"    -v /run/host-services/ssh-auth.sock:/run/host-services/ssh-auth.sock -e SSH_AUTH_SOCK="/run/host-services/ssh-auth.sock"    "local/figshare/$1:$2" bash }

#kill zoomus local server
#lsof -i :19421 | grep ZoomOp | cut -f2 -d' ' | xargs kill -9

alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
alias dc='SSH_AUTH_SOCK="/run/host-services/ssh-auth.sock" docker compose '

export BAT_PAGER=""
export BAT_STYLE=changes,rule,numbers,snip
alias cat='bat --theme "Monokai Extended Bright"'

export DOCKER_BUILDKIT=1
export JAVA_HOME=`/usr/libexec/java_home -v 11`
export GPG_TTY=$(tty)
export GOPATH=$HOME/Projects/Go
export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib"

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/opt/homebrew/bin:/usr/local/bin"
export PATH="$PATH:$HOME/.cargo/bin:/opt/homebrew/opt/mysql-client@5.7/bin"

ssh-add --apple-use-keychain 2>/dev/null

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR='vim'

#source /Users/edima/.venv-global/bin/activate

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
