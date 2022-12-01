# disable greeting message
set fish_greeting

# set editor
set -x EDITOR vim

# ls
#alias ls="ls -al"

# core commands
abbr -a v vim
abbr -a s ssh
abbr -a p ping
abbr -a p8 ping 8.8.8.8
#abbr -a cat bat --style=plain

# application
abbr -a sshconf $EDITOR ~/.ssh/config
abbr -a gitconf $EDITOR ~/.gitconfig
abbr -a fishconf $EDITOR ~/.config/fish/config

# source
abbr -a s source

# git
abbr -a g      git
abbr -a gd     git diff
abbr -a gss    git status
abbr -a gst    git stash
abbr -a gl     git log --graph --all
abbr -a gf     git fetch
abbr -a gfm    git fetch origin master:master
abbr -a gpl    git pull
abbr -a gps    git push
abbr -a gpso   git push -u origin HEAD
abbr -a gpsoh  git push -u origin HEAD
abbr -a ga     git add
abbr -a gau    git add -u
abbr -a gbr    git branch
abbr -a gbra   git branch -a
abbr -a gbrm   git branch -m
abbr -a gbrd   git branch -d
abbr -a gcm    git commit
abbr -a gcma   git commit -v --amend
abbr -a gcl    git clone
abbr -a gch    git checkout
abbr -a gchb   git checkout -b \"\"
abbr -a gchm   git checkout master
abbr -a gch-   git checkout -
abbr -a grb    git rebase
abbr -a grbi   git rebase -i
abbr -a grbm   git rebase master
abbr -a gr     git reset

# kubernetes
abbr -a k    kubectl --kubeconfig \~/kubeconfig/
abbr -a kg   kubectl --kubeconfig \~/kubeconfig/ get -o wide -n
abbr -a kd   kubectl --kubeconfig \~/kubeconfig/ describe -n
abbr -a kgp  kubectl --kubeconfig \~/kubeconfig/ get -o wide -n pods
abbr -a kdp  kubectl --kubeconfig \~/kubeconfig/ describe -n pods
abbr -a kga  kubectl --kubeconfig \~/kubeconfig/ get -o wide -A
abbr -a kgap kubectl --kubeconfig \~/kubeconfig/ get -o wide -A pods
abbr -a kdap kubectl --kubeconfig \~/kubeconfig/ describe -A pods
abbr -a kgpa kubectl --kubeconfig \~/kubeconfig/ get -o wide -A pods
abbr -a kdpa kubectl --kubeconfig \~/kubeconfig/ describe -A pods

# history
abbr -a hdel history delete

# aws
abbr -a a   aws
abbr -a auk aws eks update-kubeconfig --kubeconfig \~/kubeconfig/ --name
