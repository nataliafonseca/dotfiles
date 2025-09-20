# Dotfiles

Personal dotfiles repository for managing shell configuration, custom functions, and development environment setup across multiple operating systems.

## Installation Guides

- [Arch Linux](arch.installations.md) - Complete setup for Arch Linux systems
- [macOS](mac.installations.md) - Setup instructions for macOS

## Features

- **ZSH Configuration**: Complete ZSH setup with plugins and themes
- **Custom Functions**: Useful shell functions for development
- **Cross-Platform**: Works on macOS and arch, debian or fedora based linux distros
- **Plugin System**: Modular plugin architecture with antidote
- **Git Configuration**: Comprehensive git setup with aliases and signing
- **Development Tools**: Pre-configured environments for Python, Node.js, Go, etc.

## Structure

```
~/.dot/
├── zsh/                          # ZSH configuration
│   ├── .zshenv                   # Environment variables and OS detection
│   ├── .zshrc                    # Main ZSH configuration
│   ├── .zaliases                 # Shell aliases and shortcuts
│   ├── .zplugins                 # Plugin manifest for antidote
│   ├── functions/                # Custom ZSH functions (autoloaded)
│   └── plugins/                  # Custom plugin modules
├── git/                          # Git configuration
└── docs/                         # Installation documentation
```
