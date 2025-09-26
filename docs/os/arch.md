# Arch Linux

## Initial requirements

```sh
sudo pacman -S --needed --noconfirm git base-devel curl wget zsh bat eza micro fzf imagemagick xclip samba ntfs-3g less && \
git clone https://aur.archlinux.org/yay.git && \
cd yay && makepkg -si && \
cd .. && rm -rf yay && \
yay -Y --gendb && \
yay -Syu --devel && \
yay -Y --devel --save
```

--8<-- "./docs/common/dotfiles.md"

--8<-- "./docs/common/ssh.md"

## Installations

```sh title="official repos"
sudo pacman -S --needed --noconfirm github-cli direnv nvm docker docker-compose uv flatpak firefox fastfetch gnome-tweaks gnome-browser-connector gtk-engine-murrine dnsutils jq refind
```

```sh title="AUR"
yay -S --needed --noconfirm visual-studio-code-bin snipaste claude-code opcode-bin gemini-cli-bin openai-codex-bin sublime-text-4 1password 1password-cli upnote-appimage telegram-desktop-bin zapzap
```

```sh title="nerd fonts"
tag=$(curl -fsSL https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | jq -r '.tag_name') && \
install-font "https://github.com/ryanoasis/nerd-fonts/releases/download/${tag}/JetBrainsMono.zip" && \
install-font "https://github.com/ryanoasis/nerd-fonts/releases/download/${tag}/IBMPlexMono.zip"
```

```sh title="node"
nvm install 'lts/*' && \
nvm use 'lts/*' && \
nvm alias default 'lts/*' && \
corepack enable
```

```sh title="docker"
sudo systemctl enable --now docker && \
sudo usermod -aG docker $USER && \
newgrp docker
```

```sh title="flatpaks"
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo && \
sudo flatpak install flathub com.microsoft.Edge # try aur's microsoft-edge-stable-bin first, if it doesn't break with the theme, use that
```

--8<-- "./docs/common/storage.md"

--8<-- "./docs/common/gnome.md"
