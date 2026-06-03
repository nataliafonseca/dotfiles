# Dotfiles

Personal dotfiles repository for managing shell configuration, custom functions, and development environment setup across multiple operating systems.

## Features

- **ZSH Configuration**: Complete ZSH setup with plugins and themes
- **Custom Functions**: Useful shell functions for development
- **Cross-Platform**: Works on macOS and arch, debian or fedora based linux distros
- **Plugin System**: Modular plugin architecture with antidote
- **Git Configuration**: Comprehensive git setup with aliases and signing
- **Development Tools**: Pre-configured environments for Python, Node.js, Go, etc.

## Structure

```plain
~/.dot/
├── zsh/                          # ZSH configuration
│   ├── .zshenv                   # Environment variables and OS detection
│   ├── .zshrc                    # Main ZSH configuration
│   ├── .zaliases                 # Shell aliases and shortcuts
│   ├── .zplugins                 # Plugin manifest for antidote
│   ├── functions/                # Custom ZSH functions
│   └── plugins/                  # Custom plugin modules
└── git/                          # Git configuration
```
