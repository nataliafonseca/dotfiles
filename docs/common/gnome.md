## Gnome

### Dual monitor login fix

with the correct setup configured:

```sh
sudo cp ~/.config/monitors.xml ~gdm/.config/monitors.xml && \
sudo chown gdm:gdm ~gdm/.config/monitors.xml
```

if this results in `cp: cannot create regular file '~gdm/.config/': No such file or directory` or `chown: invalid user: ‘gdm:gdm’`, that means gdm is version 49 or above, in which case the correct command is:

```sh
sudo cp ~/.config/monitors.xml /etc/xdg/monitors.xml
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
