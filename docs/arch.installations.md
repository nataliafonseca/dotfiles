# Arch Linux

## Initial requirements

```sh
sudo pacman -S --needed --noconfirm git base-devel curl zsh bat eza micro fzf imagemagick xclip samba ntfs-3g less && \
git clone https://aur.archlinux.org/yay.git && \
cd yay && makepkg -si && \
cd .. && rm -rf yay && \
yay -Y --gendb && \
yay -Syu --devel && \
yay -Y --devel --save
```

## Dotfiles and zsh

cloning dotfiles and starting zsh:

```sh
git clone https://github.com/nataliafonseca/dotfiles.git ~/.dot && \
echo ". ~/.dot/zsh/.zshenv" > ~/.zshenv && exec zsh
```

setting zsh as default:

```sh
chsh -s $(which zsh) # might require a reboot for terminal emulators to adjust
```

## SSH configuration

creating keys:

```sh
ssh-keygen -t ed25519 # or retrieve id_ed25519 and id_ed25519.pub and place in $HOME/.ssh/
cat ~/.ssh/id_ed25519.pub # add to github if not there already
```

getting authorized_keys and fixing any permissions:

```sh
curl -o ~/.ssh/authorized_keys --create-dirs https://github.com/nataliafonseca.keys && \
(echo -n '* '; cat ~/.ssh/id_ed25519.pub) > ~/.ssh/allowed_signers && \
sudo chown -R $USER:$USER ~/.ssh && \
sudo chmod 700 ~/.ssh && \
sudo chmod 600 ~/.ssh/authorized_keys && \
sudo chmod 600 ~/.ssh/allowed_signers && \
sudo chmod 600 ~/.ssh/id_ed25519 && \
sudo chmod 644 ~/.ssh/id_ed25519.pub
```

adding key to agent:

```sh
eval "$(ssh-agent -s)"
ssh-add
```

enabling ssh server:

```sh
sudo sed -i '/^#\?PasswordAuthentication/c\PasswordAuthentication no' /etc/ssh/sshd_config && \
sudo systemctl restart sshd && \
systemctl enable --now sshd
```

## Installations

installing packages:

```sh
yay -S --needed --noconfirm github-cli direnv nvm docker docker-compose uv code gnome-terminal flatpak firefox zen-browser-bin snipaste claude-code gemini-cli sublime-text-4 fastfetch gnome-browser-connector gtk-engine-murrine dnsutils && \
sudo pacman -R gnome-console
```

nerd fonts:

```sh
install-font https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip && \
install-font https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/IBMPlexMono.zip
```

node:

```sh
nvm install --lts && \
corepack enable
```

docker:

```sh
sudo systemctl enable --now docker && \
sudo usermod -aG docker $USER && \
newgrp docker
```

flatpaks:

```sh
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo && \
flatpak install flathub com.microsoft.Edge # try aur's microsoft-edge-stable-bin first, if it doesn't break with the theme, use that
```

## Mounting external drives

find the partitions uuids:

```sh
lsblk -f
```

add at the end of /etc/fstab:

```sh
# Optional mounts that won't block boot if unavailable
UUID=XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX	/hdd	ext4	nofail,user	0 0
UUID=XXXXXXXXXXXXXXXX	/data	ntfs-3g	nofail,user,permissions	0 0
```

to mount immediately:

```sh
sudo systemctl daemon-reload && \
sudo mkdir -p /hdd /data && \
sudo chown $USER:$USER /hdd /data && \
sudo mount /hdd && \
sudo mount /data
```

## SMB share

creating smb.conf from template:

```sh
sudo cp $DOTDIR/docs/templates/smb.conf /etc/samba/smb.conf
```

creating smb credentials:

```sh
sudo smbpasswd -a $USER
```

enabling the services and allowing if firewall ufw:

```sh
sudo systemctl enable --now smb nmb && \
sudo ufw allow samba # if this errors cause no ufw that's fine
```

configuring services to wait until internet is on:

```sh
sudo mkdir -p /etc/systemd/system/smb.service.d && \
sudo mkdir -p /etc/systemd/system/nmb.service.d && \
sudo cp $DOTDIR/docs/templates/smb-network-wait.conf /etc/systemd/system/smb.service.d/network-wait.conf && \
sudo cp $DOTDIR/docs/templates/nmb-network-wait.conf /etc/systemd/system/nmb.service.d/network-wait.conf && \
sudo systemctl daemon-reload
```

## Gnome

### Dual monitor login fix

with the correct setup configured:

```sh
sudo cp ~/.config/monitors.xml ~gdm/.config/ && \
sudo chown gdm:gdm ~gdm/.config/monitors.xml
```

### Eurkeys

1. Tweaks (`gnome-tweaks` package) > Keyboard & Mouse > enable 'Show Extended Input Sources' or, on the terminal:

```sh
gsettings set org.gnome.desktop.input-sources show-all-sources true
```

2. Reboot
3. Settings > Keyboard > Input Sources > Add Input Source > English > EurKEY (US)

### Other settings to remember

- Settings > Power > Power Button Behavior: Power Off
- Settings > Power > Automatic suspend: disable
- Settings > Multitasking > Hot Corner: disable
- Settings > Privacy & Security > Automatic Screen Lock: disable
- Tweaks > Windows: enable maximize and minimize and move to the left;
- Tweaks > Mouse & Touchpad > Middle Click Paste: disable;
- Tweaks > Startup Applications: add Snipaste;

### Shortcuts

Settings > Keyboard > View and Customize Shortcuts:

- System > Show the notification list: disable (super+v will be used for clipboard history)
- Custom Shortcuts > Snipaste snip - F1
- Custom Shortcuts > Snipaste paste - F4

### Extensions

- [Clipboard Indicator](https://extensions.gnome.org/extension/779/clipboard-indicator/)
  - Settings > Shortcuts > Toggle the menu: super+v
- [AppIndicator and KStatusNotifierItem Support](https://extensions.gnome.org/extension/615/appindicator-support/)
- [User Themes](https://extensions.gnome.org/extension/19/user-themes/)
- [Dash to Dock](https://extensions.gnome.org/extension/307/dash-to-dock/)
  - Settings > Appearance > Show overview on startup: disable

### Themes

#### GTK

[Catppuccin](https://github.com/Fausto-Korpsvart/Catppuccin-GTK-Theme)

```sh
degit https://github.com/Fausto-Korpsvart/Catppuccin-GTK-Theme && \
cd Catppuccin-GTK-Theme/themes && \
./install.sh -l -c dark -t lavender --tweaks frappe && \
cd ... && rm -rf Catppuccin-GTK-Theme
```

applying on flatpaks:

```sh
sudo flatpak override --filesystem=$HOME/.themes && \
sudo flatpak override --filesystem=$HOME/.icons && \
sudo flatpak override --filesystem=xdg-config/gtk-4.0 && \
flatpak override --user --filesystem=xdg-config/gtk-4.0
```

#### Icons

- [Mignon-Pastel Icon Theme](https://github.com/IgorFerreiraMoraes/Mignon-icon-theme)
- [Colloid-pastel Icon Theme](https://github.com/SueDonham/Colloid-pastel-icons)

#### Terminal

installing catppuccin:

```sh
curl -L https://raw.githubusercontent.com/catppuccin/gnome-terminal/v1.0.0/install.py | python3 -
```

changing the font (useful since ui doesn't allow font weight selection):

```sh
for profile in $(dconf list /org/gnome/terminal/legacy/profiles:/ | grep -E '^:.*/$' | tr -d ':/'); do
  dconf write /org/gnome/terminal/legacy/profiles:/:$profile/font "'JetBrainsMono Nerd Font ExtraLight 13'"
done
```

adding some padding:

```sh
mkdir -p ~/.config/gtk-3.0 && echo 'vte-terminal { padding: 4px; }' > ~/.config/gtk-3.0/gtk.css
```

#### Zen Browser

- [Docs](https://docs.zen-browser.app/guides/live-editing) on how to apply themes
- [Catppuccin](https://github.com/catppuccin/zen-browser)
