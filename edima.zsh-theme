local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
PROMPT='%{$fg[yellow]%} %T %{$fg[cyan]%}%n%{$fg[black]%}@%{$fg[blue]%}%M %{$fg[cyan]%}%~ %{$fg_bold[blue]%}$(git_prompt_info)
${ret_status} %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"


function tabc() {
  NAME=$1; if [ -z "$NAME" ]; then NAME="Default"; fi
  # if you have trouble with this, change
  # "Default" to the name of your default theme
  echo -e "\033]50;SetProfile=$NAME\a"
}

function tab-reset() {
    NAME="Default"
    echo -e "\033]50;SetProfile=$NAME\a"
}

function colorssh() {
    if [[ -n "$ITERM_SESSION_ID" ]]; then
        trap "tab-reset" INT EXIT
        tabc SSHSession
#        if [[ "$*" =~ "production*" ]]; then
#            tabc Production
#        elif [[ "$*" =~ "staging*" ]]; then
#            tabc Staging
#        else
#            tabc Other
#        fi
    fi
    ssh $*
}
compdef _ssh tabc=ssh

alias ssh="colorssh"