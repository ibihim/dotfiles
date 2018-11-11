#!/usr/bin/env bash

sudo apt update
sudo apt upgrade -y
sudo apt install mosh zsh docker git curl vim
sudo ufw allow ssh
sudo ufw allow 60000:60020/udp
sudo ufw enable

# create user
useradd -G docker -m -d /home/ibihim -s /bin/zsh ibihim
echo "add the next line, seperated by tabs"
echo "ibihim    ALL=(ALL)   ALL"
EDITOR=vim sudo visudo

echo "set passwd for ibihim"
passwd ibihim
su ibihim
cd

# prepare zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# get dotfiles
git clone https://github.com/ibihim/dotfiles.git

# prepare vim
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
cp dotfiles/vim/.vimrc .
cp -r dotfiles/vim/.vim .
echo "install bundles"
vim

# setup fancy zsh
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
cp dotfiles/zsh/.zshrc .

echo "remove root login"
echo "remove password logn"
sudo vim /etc/ssh/sshd_config

# emacs?
sudo apt install emacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
cp dotfiles/spacemacs/.spacemacs .

