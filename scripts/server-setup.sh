##########################################################################
# User Management
##########################################################################

passwd

##########################################################################
# Install packages
##########################################################################

add-apt-repository ppa:wireguard/wireguard
apt update -y
apt upgrade -y

sudo apt install zsh tmux vim curl git docker.io ufw mosh autojump fail2ban unattended-upgrades nmap wireguard resolvconf linux-headers-generic

##########################################################################
# Install packages
##########################################################################

# usually one would like to add --encrypt-home (deps encryptfs-utils)
adduser -m -d /home/ibihim -s /bin/bash -G sudo,docker ibihim
# use ssh, gnupg confs
mkdir /home/ibihim/.ssh
cd && cp -r {.ssh,.gnupg} /home/ibihim
chown -R ibihim:ibihim /home/ibihim/{.ssh,.gnupg}
su ibihim && cd
# test
sudo ls

# if sudo worked well, disable root command
sudo passwd -l root

##########################################################################
# SSH hardening
##########################################################################
# no password, no root
# PermitRootLogin no
# PasswordAuthentication no
# AllowUsers ibihim
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

# check ports
nmap -v -sT localhost

##########################################################################
# Security Updates
##########################################################################

# add
# APT::Periodic::Update-Package-Lists "1";
# APT::Periodic::Download-Upgradeable-Packages "1";
# APT::Periodic::AutocleanInterval "7";
# APT::Periodic::Unattended-Upgrade "1";

sudo nvim /etc/apt/apt.conf.d/10periodic

##########################################################################
# Personalize
##########################################################################

# download dotfiles
git clone https://github.com/ibihim/dotfiles.git

# vim dotfiles
cp -r dotfiles/vim/{.vim,.vimrc} .

# add oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# customize zsh
cp dotfiles/zsh/.zshrc .
vim .zshrc
source .zshrc

# add fun
# vim plugin manager
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
# add power to zsh
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# check docker, if it fails: log in again, group not updated
docker run hello-world
