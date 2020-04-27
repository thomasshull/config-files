#!/bin/bash

CONFIG_DIR=$PWD

rm ~/.bashrc
ln -s ${CONFIG_DIR}/bash/linux/.bashrc ~/.bashrc

rm ~/.git-completion.bash
ln -s ${CONFIG_DIR}/git/.git-completion.bash ~/.git-completion.bash

rm ~/.gitconfig
ln -s ${CONFIG_DIR}/git/.gitconfig ~/.gitconfig

#fish
rm ~/.config/fish/completions
ln -s ${CONFIG_DIR}/fish/completions ~/.config/fish/completions
rm ~/.config/fish/functions
ln -s ${CONFIG_DIR}/fish/functions ~/.config/fish/functions
rm ~/.config/fish/config.fish
ln -s ${CONFIG_DIR}/fish/config.fish ~/.config/fish/config.fish

#tmux
rm ~/.tmux.conf
ln -s ${CONFIG_DIR}/tmux/linux/.tmux.conf ~/.tmux.conf

#vimrc
rm ~/.vimrc
ln -s ${CONFIG_DIR}/vim/.vimrc ~/.vimrc

#bin
rm ~/bin
ln -s ${CONFIG_DIR}/bin/linux ~/bin

#ack-grep
rm ~/.ackrc
ln -s ${CONFIG_DIR}/ack/.ackrc ~/.ackrc

rm ~/.vrapperrc
ln -s ${CONFIG_DIR}/vrapper/.vrapperrc ~/.vrapperrc

#to create trashit dir
mkdir ~/.local/share/Trash

#need to create tmp vim buffer
mkdir ~/tmp
