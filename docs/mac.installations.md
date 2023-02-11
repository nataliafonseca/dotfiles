# MacOS

My initial setup guide for MacOS

## Homebrew / XCode cli stuff / Rosetta

```sh
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
eval $(/opt/homebrew/bin/brew shellenv)
sudo softwareupdate --install-rosetta
```

## Initial programs to make the macbook usable

```sh
brew install --cask scroll-reverser rectangle firefox visual-studio-code 1password 1password-cli snipaste raycast
```

## SSH configuration

Create `$HOME/.ssh` directory if it doesn't exist

```sh
mkdir $HOME/.ssh
```

Create `id_ed25519` and `id_ed25519.pub`.

```sh
ssh-keygen -t ed25519 -C Oracle
cat ~/.ssh/id_ed25519.pub
```

(alternatively, retrieve and place in `$HOME/.ssh/`)

```sh
nano id_ed25519
nano id_ed25519.pub
```

Then setup authorized keys and allowed signers

```sh
curl -o ~/.ssh/authorized_keys --create-dirs https://github.com/nataliafonseca.keys
(echo -n '* '; cat ~/.ssh/id_ed25519.pub) > ~/.ssh/allowed_signers
sudo chown -R natalia ~/.ssh
sudo chmod 700 ~/.ssh
sudo chmod 600 ~/.ssh/authorized_keys
sudo chmod 600 ~/.ssh/allowed_signers
sudo chmod 600 ~/.ssh/id_ed25519
sudo chmod 644 ~/.ssh/id_ed25519.pub
```

Finally, add to ssh agent

```sh
eval "$(ssh-agent -s)"
ssh-add
```

## Git, github and dotfiles

```sh
brew install git gh bat exa micro
git clone https://github.com/nataliafonseca/dotfiles.git ~/.dot
echo ". ~/.dot/zsh/.zshenv" > ~/.zshenv
exec zsh
```

## NVM and Node

```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
nvm install 'lts/\*'
corepack enable
nvm install node
corepack enable
nvm install 14
corepack enable
nvm alias default 'lts/\*'
```

## Fonts

```sh
brew tap homebrew/cask-fonts
brew install font-blex-mono-nerd-font font-jetbrains-mono-nerd-font
```

## iTerm2

```sh
brew tap homebrew/cask-versions
brew install iterm2-beta
```

## Docker

```sh
brew install colima docker docker-compose docker-credential-helper
mkdir -p ~/.docker/cli-plugins
ln -sfn /opt/homebrew/opt/docker-compose/bin/docker-compose ~/.docker/cli-plugins/docker-compose
colima start
```

Add colima-start to login items

## Python

```sh
brew install pipx
curl https://pyenv.run | bash
pyenv install 2
pyenv install 3
pyenv global 3 2
pipx ensurepath
curl -sSL https://install.python-poetry.org | python3 -
poetry config virtualenvs.in-project true
```

## Java

```sh
brew install openjdk@11
sudo ln -sfn $(brew --prefix)/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk
```

## Development packages and tools

```sh
brew install cocoapods
brew install watchman
brew install wget
brew install imagemagick
brew install graphicsmagick
brew install --cask beekeeper-studio
brew install --cask postman
brew install --cask insomnia
```

XCode initialization:

```sh
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch
```

## Work

```sh
brew install --cask microsoft-teams
brew install --cask slack
brew install --cask keybase
```

## Homebrew Apps

```sh
brew install --cask sanesidebuttons
brew install --cask obsidian
brew install --cask bartender
brew install --cask cleanshot
brew install --cask discord
brew install --cask iina
brew install --cask imageoptim
brew install --cask kawa
brew install --cask notion
brew install --cask qbittorrent
brew install --cask telegram
brew install --cask google-chrome
brew install --cask sublime-text
```

## AppStore Apps

```sh
brew install mas
mas install 1176895641 # Spark
mas install 1278508951 # Trello
mas install 824171161 # Affinity Designer
mas install 824183456 # Affinity Photo
mas install 1528890965 # TextSniper
mas install 411643860 # DaisyDisk
mas install 457622435 # Yoink
mas install 462054704 # Word
mas install 462058435 # Excel
mas install 462062816 # PowerPoint
mas install 414030210 # LimeChat
mas install 425424353 # The Unarchiver
```

# Configs and instructions

To repeat keypresses, but disables special keys on hold:

```sh
defaults write -g ApplePressAndHoldEnabled -bool false
```

Epson Printer: https://epson.com.br/Suporte/Impressoras/Impressoras-multifuncionais/Epson-L/Epson-L395/s/SPT_C11CF46301?review-filter=macOS+12.x
