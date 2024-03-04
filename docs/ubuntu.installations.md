# main repos
sudo add-apt-repository main
sudo add-apt-repository universe

## git
sudo add-apt-repository ppa:git-core/ppa
sudo apt update && \
sudo apt upgrade -y && \
sudo apt install -y git

# utilities and dependencies
sudo apt install -y curl unrar xclip imagemagick apt-transport-https p7zip-full p7zip-rar dconf-editor kolourpaint flameshot build-essential pkg-config libvlccore-dev libvlc-dev gnome-tweaks timeshift libev-dev libx11-dev libxi-dev gpick fzf

## zsh
sudo apt install zsh
chsh -s $(which zsh)

# node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
nvm install --lts
corepack enable

# keybase
curl --remote-name https://prerelease.keybase.io/keybase_amd64.deb
sudo apt install ./keybase_amd64.deb

# sublime
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null && \
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list && \
sudo apt-get update && \
sudo apt-get install sublime-text

## docker
curl -fsSL https://get.docker.com | bash  
sudo groupadd docker  
sudo usermod -aG docker $USER  
newgrp docker  
docker run hello-world  
