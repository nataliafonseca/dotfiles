# MacOS

## Initial requirements

Homebrew / XCode cli / Rosetta

```sh
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
eval $(/opt/homebrew/bin/brew shellenv)
sudo softwareupdate --install-rosetta
```

Essentials

```sh
brew install --cask scroll-reverser rectangle iterm2 firefox 1password 1password-cli git gh bat exa micro jq
```

--8<-- "./docs/common/bootstrap.md"

--8<-- "./docs/common/ssh.md"

## NVM and Node

```sh
curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/$(curl -fsSL https://api.github.com/repos/nvm-sh/nvm/releases/latest | jq -r '.tag_name')/install.sh" | bash
nvm install node
corepack enable
nvm install 'lts/*'
corepack enable
nvm alias default 'lts/*'
```

## Fonts

```sh
brew tap homebrew/cask-fonts
brew install font-blex-mono-nerd-font font-jetbrains-mono-nerd-font
```

## Docker

```sh
brew install colima docker docker-compose docker-credential-helper
mkdir -p ~/.docker/cli-plugins
ln -sfn /opt/homebrew/opt/docker-compose/bin/docker-compose ~/.docker/cli-plugins/docker-compose
colima start
```

Add colima-start to login items

## Installations

homebrew:

```sh
brew install cocoapods watchman wget imagemagick graphicsmagick mas
brew install --cask beekeeper-studio insomnia obsidian bartender cleanshot discord iina imageoptim notion qbittorrent telegram google-chrome sublime-text alt-tab
```

appstore:

- Whatsapp Desktop
- Affinity Designer
- Affinity Photo
- TextSniper
- DaisyDisk
- Yoink
- Word
- Excel
- PowerPoint
- Pixelmator Pro
- LanguageTool
- Presentify
- The Unarchiver
- LimeChat
- NordVPN

## Configs and instructions

### Keyboard

To repeat keypresses (but disables special keys on hold):

```sh
defaults write -g ApplePressAndHoldEnabled -bool false
```

Swap `cmd` and `ctrl`:

```plain
System settings -> Keyboard -> Keyboard Shortcuts -> Modifier Keys -> (Select keyboard on top) -> ctrl > cmd / cmd > ctrl
```

Use default Function Keys:

```plain
System settings -> Keyboard -> Keyboard Shortcuts -> Function Keys -> Use F1, F2, etc. keys as standard function keys
```

### EURKey

```sh
sudo npx degit sonicdoe/EurKEY/EurKEY.bundle '/Library/Keyboard Layouts/EurKEY.bundle'
```

## Epson L395 Printer

Install [drivers](https://epson.com.br/Suporte/Impressoras/Impressoras-multifuncionais/Epson-L/Epson-L395/s/SPT_C11CF46301?review-filter=macOS+13.x)
