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

# import alias
source $HOME/.dotfiles/alias_rc

# ssh like ping complement
compdef ping=ssh

precmd() {
vcs_info
}
