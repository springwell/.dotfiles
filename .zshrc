# set language
#export LANG=ja_JP.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# set term
TERM=xterm-256color # enable complement
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -U compinit
compinit -C

# default editor
EDITOR=vim

# enable predicton

#autoload predict-on
#predict-on

#enable colors
autoload -U colors
colors


# history settings

# history
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# ignore same commands
setopt hist_ignore_dups
setopt hist_ignore_all_dups

# ignore when space entered
setopt hist_ignore_space

# disable ?
setopt nonomatch

# history files extended_history
setopt extended_history

# remove space from history
setopt hist_reduce_blanks

# option to share history
setopt share_history

# prediction lineup-settings
setopt list_packed

# show file type in prediction
setopt list_types

# enable to rewrite predicted commands
setopt hist_verify

# enable prediction automaticaly
setopt auto_menu

# cd with directory name
#setopt auto_cd

# push directory stack
setopt auto_pushd
setopt pushd_ignore_dups

# disable beep sound
setopt nolistbeep

# use colors
setopt prompt_subst

# correct command
setopt correct

# set bindkey emacs
bindkey -e

# vcs_info
autoload -Uz vcs_info
#zstyle ':vcs_info:*' formats '(%s)[%b]'
#zstyle ':vcs_info:*' actionformats '(%s)[%b|%a]'
zstyle ':vcs_info:*' formats '(%s:%b)'
zstyle ':vcs_info:*' actionformats '(%s:%b|%a)'
# prompt settings
PROMPT='%n@%m:%d ${vcs_info_msg_0_}
%(!.#.$) '
#RPROMPT="[%d]"
#SPROMPT="correct: %R -> %r ? "

# alias to frequently-used commands
alias cl="clear"
alias sl="ls"
alias ls="ls -alG"

# config alias
alias vimrc="$EDITOR ~/.vim/vimrc"
alias gvimrc="$EDITOR ~/.vim/gvimrc"
alias nvimrc="$EDITOR ~/.config/nvim/init.vim"

alias tmuxconf="$EDITOR ~/.tmux.conf"

alias zshrc="$EDITOR ~/.zshrc && source ~/.zshrc && zcompile ~/.zshrc"
alias zshenv="$EDITOR ~/.zshenv && source ~/.zshenv && zcompile ~/.zshenv"
alias zprofile="$EDITOR ~/.zprofile && source ~/.zprofile && zcompile ~/.zprofile"

alias sshconf="$EDITOR ~/.ssh/config"
alias gitconf="$EDITOR ~/.gitconfig"

# shorten often use commands
# directory
alias l="ls"
alias la="ls -a"
alias lal="ls -al"
alias t="tree"

# vim
alias v="vim"
alias nv="nvim"

# use neovim instead of vim if exists
if hash ls &>/dev/null
then
    alias vim="nvim"
fi

# git
alias g="git"

alias ga="git add"

alias gbr="git branch"
alias gbr='git branch'
alias gbra='git branch -a'
alias gbrr='git branch --remote'
alias gbrd='git branch -d'

alias gcom='git commit -v'
alias gcom!='git commit -v --amend'
alias gcoma='git commit -v -a'
alias gcoma!='git commit -v -a --amend'
alias gcomam='git commit -a -m'
alias gcomsm='git commit -s -m'

alias gch="git checkout"
alias gchm="git checkout master"
alias gchb="git checkout -b"
alias gcha="git commit -m"
alias gcham="git commit -a -m"

alias gdiff="git diff"


# ssh
alias s="ssh"
alias st="ssh -t 'tmux a -d'"
alias ss="ssh -t 'screen -r'"

# network commands
alias p="ping"
alias p8="ping 8.8.8.8"

alias gip="curl inet-ip.info"

alias gw="netstat -nr | grep default | awk '{print \$2}'"
alias pgw="ping `gw`"

alias plist="netstat -an | grep LISTEN "
alias papp="lsof -i -sTCP:LISTEN"

alias tr="traceroute"
alias tr8="traceroute 8.8.8.8"


# misc:w
alias weather="curl wttr.in/Tokyo"

# ssh like ping complement
compdef ping=ssh

precmd() {
vcs_info
}
