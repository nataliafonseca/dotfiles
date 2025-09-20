## rEFInd

### Installation

=== "Arch Linux"

```sh
sudo pacman -S refind
```

=== "Ubuntu/Debian"

```sh
sudo apt-add-repository ppa:rodsmith/refind && \
sudo apt update && \
sudo apt install refind
```

```sh
refind-install
```

### Theme

```sh
sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/bobafetthotmail/refind-theme-regular/master/install.sh)" # (1)!
```

1. Installation folder on Arch is probably /boot/EFI/refind
