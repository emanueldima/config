export GPG_TTY=$TTY

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
compdef _gnu_generic delta
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git virtualenv)

# User configuration

formatxml () { xmllint --format $1 > $1.formatted; mv $1.formatted $1; }
lumina() { m1ddc display 1 set luminance "${1}0"; m1ddc display 1 set luminance "${1}0" }
hl() { grep --color=always "$1\|$" }

#kill zoomus local server
#lsof -i :19421 | grep ZoomOp | cut -f2 -d' ' | xargs kill -9

alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
alias dc='SSH_AUTH_SOCK="/run/host-services/ssh-auth.sock" docker compose '
alias mc='mc --nosubshell'
alias gcce='gcloud compute'

export BAT_PAGER=""
export BAT_STYLE=changes,rule,numbers,snip
alias cat="bat --theme=OneHalfDark"
#alias cat="bat --theme=GitHub"

export DOCKER_BUILDKIT=1
export JAVA_HOME=`/usr/libexec/java_home -v 11`
export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib"

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/opt/homebrew/bin:/usr/local/bin"
export PATH="$PATH:$HOME/.cargo/bin:$HOME/go/bin"

ssh-add --apple-use-keychain 2>/dev/null

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR='vim'

export DFT_TAB_WIDTH=4
export DFT_DISPLAY=side-by-side-show-both

#source /Users/edima/.venv-global/bin/activate

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /Users/edima/.config/broot/launcher/bash/br

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/edima/.google-cloud-sdk/path.zsh.inc' ]; then . '/Users/edima/.google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/edima/.google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/edima/.google-cloud-sdk/completion.zsh.inc'; fi
