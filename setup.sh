#!/bin/bash

# set alias
ln -s $HOME/.dotfiles/.tmux.conf $HOME/.tmux.conf;

rm -rf $HOME/.vim;
ln -s $HOME/.dotfiles/.vim $HOME/.vim;

mkdir -p $HOME/.config/nvim/;
ln -s $HOME/.dotfiles/.vim/vimrc $HOME/.config/nvim/init.vim;

# set zsh for default shell
#echo "(which zsh 1>/dev/null 2>&1 && zsh || ~/local/bin/zsh) && exit" >> $HOME/.bashrc
#echo "SHELL=/bin/zsh" >> $HOME/.bashrc
#ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# add bashrc configuration
cat bashrc.append >> $HOME/.bashrc

# install pyenv
git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv
git clone https://github.com/pyenv/pyenv-virtualenv.git $HOME/.pyenv/plugins/pyenv-virtualenv

export PYENV_ROOT="\$HOME/.pyenv"
export PATH="\$PYENV_ROOT/bin:\$PATH"

cat << END >>  $HOME/.bashrc
export PYENV_ROOT="\$HOME/.pyenv"
export PATH="\$PYENV_ROOT/bin:\$PATH"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
eval "\$(pyenv virtualenv-init -)"
eval "\$(pyenv init -)"
END

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


# create virtualenv for neovim
for PYTHON_VERSION in 2 3
do
    PYTHON_PACKAGE_NAME=$(pyenv install --list | tr -d ' ' | grep -v "dev" | grep ^$PYTHON_VERSION | tail -n 1);
    pyenv install $PYTHON_PACKAGE_NAME;
    pyenv virtualenv $PYTHON_PACKAGE_NAME neovim$PYTHON_VERSION;
    pyenv activate neovim$PYTHON_VERSION;
    pip install neovim;
done;

pyenv local neovim2 neovim3
