##########################################################################
# User Management
##########################################################################

# make wheel group: (% indicates that we're working with a group)
# %wheel ALL=(ALL) ALL
sudo visudo
useradd --groups {wheel,docker}
# usually one would like to add --encrypt-home (deps encryptfs-utils)
adduser -m -d /home/ibihim -s /bin/bash -G {wheel,docker} ibihim
# use ssh, gnupg confs
mkdir /home/ibihim/.ssh
cd && cp -r {.ssh,.gnupg} /home/ibihim
su ibihim && cd
sudo chown ibihim:wheel -R {.ssh,.gnupg}
chmod -R 700 {.ssh,.gnupg}
chmod -R 600 .ssh/authorized_keys

# update system
sudo apt update -y
sudo apt upgrade -y

# if sudo worked well, disable root command
sudo passwd -l root

##########################################################################
# Install packages
##########################################################################

sudo apt install zsh vim curl git docker.io ufw mosh autojump

##########################################################################
# SSH hardening
##########################################################################
# no password, no root
# #PermitRootLogin no
# #PasswordAuthentication no
sudo vim /etc/ssh/sshd_config
sudo systemctl restart sshd

##########################################################################
# Firewall
##########################################################################
sudo ufw status

# Allow SSH
sudo ufw allow 22/tcp
# Allow mosh
sudo ufw allow 60000:60010/udp

sudo ufw enable
sudo ufw status
# sudo iptables -L # check new rules

##########################################################################
# Personalize
##########################################################################

# download dotfiles
git clone https://github.com/ibihim/dotfiles.git

# vim dotfiles
cp -r dotfiles/vim/{.vim,.vimrc} .

# add oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# add fun
# vim plugin manager
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
# add power to zsh
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# customize zsh
cp dotfiles/zsh/.zshrc .
vim .zshrc
source .zshrc

# check docker, if it fails: log in again, group not updated
docker run hello-world
