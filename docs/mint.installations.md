```sh
sudo add-apt-repository main &&\
sudo add-apt-repository universe &&\
sudo add-apt-repository ppa:git-core/ppa &&\
sudo apt update &&\
sudo apt upgrade -y

sudo apt install -y zsh git gpg fzf bat imagemagick xclip
chsh -s $(which zsh)

git clone https://github.com/nataliafonseca/dotfiles.git ~/.dot &&\
echo ". ~/.dot/zsh/.zshenv" > ~/.zshenv &&\
exec zsh

# eza
sudo mkdir -p /etc/apt/keyrings &&\
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg &&\
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list &&\
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list &&\
sudo apt update &&\
sudo apt install -y eza

# nerd fonts
install-font https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip &&\
install-font https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/IBMPlexMono.zip

# ghostty
sudo apt install libonig5 && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mkasberg/ghostty-ubuntu/HEAD/install.sh)"
# sudo update-alternatives --config x-terminal-emulator
# for cinnamon, settings > prefered applications
gsettings set org.gnome.desktop.default-applications.terminal exec /usr/bin/ghostty
gsettings set org.gnome.desktop.default-applications.terminal exec-arg "-x"
gsettings set org.cinnamon.desktop.default-applications.terminal exec /usr/bin/ghostty
gsettings set org.cinnamon.desktop.default-applications.terminal exec-arg "-x"


# catpuccin
curl -L https://raw.githubusercontent.com/catppuccin/gnome-terminal/v1.0.0/install.py | python3 -
```