

#CONFIG_DIR=/home/tshull226/Documents/SideHustle
CONFIG_DIR=$PWD

rm ~/.bashrc
ln -s ${CONFIG_DIR}/bash/linux/.bashrc ~/.bashrc

rm ~/.git-completion.bash
ln -s ${CONFIG_DIR}/git/.git-completion.bash ~/.git-completion.bash

rm ~/.gitconfig
ln -s ${CONFIG_DIR}/git/.gitconfig ~/.gitconfig


#tmux
rm ~/.tmux.conf
ln -s ${CONFIG_DIR}/tmux/linux/.tmux.conf ~/.tmux.conf

#vimrc
rm ~/.vimrc
ln -s ${CONFIG_DIR}/vim/.vimrc ~/.vimrc

#bin
rm ~/bin
ln -s ${CONFIG_DIR}/bin/linux ~/bin

#to create trashit dir
mkdir ~/.local/share/Trash

#need to create tmp vim buffer
mkdir ~/tmp
