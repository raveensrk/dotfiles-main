# BASH ALIASES

set -o vi

# {{{ ENVIRONMENT VARIABLES
# export DISPLAY=:0
export PATH="$HOME/.local/bin:$PATH"
export PATH="~/repos/my_scripts/src:$PATH"
export VISUAL=vim
export EDITOR=vim
# }}}

# {{{ BASH SHOPTS
shopt -s direxpand
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
shopt -s histappend # append to the history file, don't overwrite it
HISTCONTROL= # Use ignoreboth to ingore both duplicated and commands that start with space
HISTSIZE=
HISTFILESIZE=
export HISTTIMEFORMAT="[%F %T] "
export HISTFILE=~/.bash_history # Change the file location because certain bash sessions truncate .bash_history file upon close. # http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND" # Force prompt to write history after every command. http://superuser.com/questions/20900/bash-history-loss
shopt -s checkwinsize # check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
# bind 'TAB':menu-complete # If there are multiple matches for completion, Tab should cycle through them
# set completion-ignore-case on
# bind "set menu-complete-display-prefix on" # Perform partial completion on the first Tab press, only start cycling full results on the second Tab press
# }}}
# {{{ INTERFACE
xset r rate 300 50
xset m 10 1
# }}}
# ALIASES {{{
alias ..="cd .."
alias ,sync="~/repos/my_scripts/src/sync_all_repos.bash ~/repos/"
alias bashal="vim ~/.bash_aliases && source ~/.bash_aliases"
alias cp="cp -vi"
alias dam="sudo !!"
alias date1="date +%Y%m%d%H%M%S"
alias date2="date +%Y-%m-%d_%H:%M:%S"
alias date3="date +%d%b%y"
alias g='grep --color'
alias gr='grep --color -r'
alias h="history"
alias l="ls -a"
alias mkdir="mkdir -v"
alias mv="mv -vi"
alias rm="rm -vi"
alias r='ranger'
alias tmux="tmux -2"
alias t="tmux attach || tmux"
alias tree="tree -C"
alias xo="xdg-open"
alias e="emacs -nw"
alias em="emacs"
alias v="vim"
alias vimrc="vim ~/.vimrc"
ff () {
    find -name "*$1*"
}

convert-softlinks () {
    link_name="$1"
    # Get real path of original file
    orig=$(realpath "$link_name")
    # Remove link
    rm "$link_name"
    # Replace link with original
    cp "$orig" "$link_name"
    unset link_name orig 
}
# }}}
# WSL {{{
alias ,e="explorer.exe ."
# }}}
# {{{ PAGERS
export PAGER='less'
# Less colors
#-------------------
alias less='less --ignore-case'
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# Man colors
#------------------
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
        LESS_TERMCAP_me=$'\e[0m' \
        LESS_TERMCAP_se=$'\e[0m' \
        LESS_TERMCAP_so=$'\e[01;44;33m' \
        LESS_TERMCAP_ue=$'\e[0m' \
        LESS_TERMCAP_us=$'\e[01;32m' \
        command man "$@"
    }
# }}}
# OTHER SOURCES {{{
# MY SCRIPTS
source ~/repos/my_scripts/src/bash_aliases.bash
# PROMPT AND COLORS
source ~/.bash_prompthe
# }}}
# {{{ LOCATE FILES AND DIRS
updatedb_path="~/.local/locate_db"
updatedb_home="$updatedb_path/home.db"
updatedb () {
    [[ ! -d "$updatedb_path" ]] && mkdir -p "$updatedb_path"
    updatedb -l 0 -o "$updatedb_home" -U ~/
}

se () {
    file=$(locate -d "$updatedb_home" .* | fzf)
    vim "$file"
}

sd () {
    dir=$(locate -d "$updatedb_home" .* | fzf)
    pushd "$dir" || exit 1
}

sl () {
    locate -d "$updatedb_home" .* | fzf
}
# }}}
