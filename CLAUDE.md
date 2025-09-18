# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository for managing shell configuration, custom functions, and development environment setup across multiple operating systems (Arch Linux, macOS, Ubuntu/Mint).

## Architecture

### Core Structure

```
~/.dot/
├── zsh/                   # Main ZSH configuration
│   ├── .zshenv            # Environment variables and OS detection functions
│   ├── .zshrc             # Main ZSH configuration file
│   ├── .zplugins          # Plugin manifest for antidote
│   ├── functions/         # Custom ZSH functions (autoloaded)
│   └── plugins/           # Custom plugin modules
├── docs/                  # Installation guides for different OS
└── git/                   # Git configuration
```

### Plugin System

The setup uses **antidote** as the ZSH plugin manager. Plugins are defined in `.zplugins` and loaded via antidote. The system includes:

- **External plugins**: romkatv/powerlevel10k, zsh-users/zsh-autosuggestions, etc.
- **Custom plugins**: Environment-specific configurations in `zsh/plugins/`
- **Conditional loading**: Plugins load based on OS/environment detection

### Function System

Custom functions are stored in `zsh/functions/` and automatically loaded via the `autoload-dir` function:

- **degit**: Clone specific directories from git repositories without history
- **install-font**: Install fonts from URLs, local zips, or directories
- **bak**: Create timestamped backups of files/directories
- **extract**: Universal archive extraction utility
- **gifconvert**: Convert videos to optimized GIFs using ffmpeg
- **take**: Create directory and cd into it
- **touchf**: Create files with parent directories
- **fnreload**: Reload all ZSH functions

### OS Detection System

The `.zshenv` file provides detection functions used throughout the configuration:

- `is_mac()`, `is_pc()`, `is_homelab()`, `is_cloud()` - Environment detection
- `is_arch()`, `is_deb()`, `is_fedora()` - Package manager detection
- `is_wayland()` - Display server detection

## Development Commands

### Function Development

```bash
# Reload functions after editing
fnreload

# Reload from custom directory
fnreload ~/my-functions

# Test functions after modification
source ~/.dot/zsh/functions/function-name
```

### Plugin Development

```bash
# Regenerate plugin cache after changes
rm ~/.dot/zsh/.zplugins.zsh
exec zsh

# Edit plugin manifest
$EDITOR ~/.dot/zsh/.zplugins
```

### Initial Setup Commands

For Arch Linux:

```bash
# Install base requirements
sudo pacman -S --needed --noconfirm git base-devel curl zsh bat eza micro fzf imagemagick xclip
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd .. && rm -rf yay

# Clone and setup dotfiles
git clone https://github.com/nataliafonseca/dotfiles.git ~/.dot
echo ". ~/.dot/zsh/.zshenv" > ~/.zshenv && exec zsh
chsh -s $(which zsh)
```

## Key Configuration Files

- **`.zshenv`**: Environment setup, XDG directories, OS detection functions
- **`.zshrc`**: Main shell configuration, plugin loading, function autoloading
- **`.zplugins`**: Plugin manifest with conditional loading directives
- **`.zaliases`**: Shell aliases

## Custom Function Guidelines

Functions follow a consistent pattern:

- Use `##?` comments for documentation
- Include usage examples and parameter descriptions
- Use `local` variables for function scope
- Provide comprehensive error handling
- Return meaningful exit codes

## Plugin Architecture

Custom plugins use this structure:

```bash
# Plugin header for path resolution
0=${(%):-%x}
autoload-dir ${0:A:h}/functions
fpath+=(${0:A:h}/functions)

# Plugin-specific configuration
# Aliases, exports, conditional logic
```

## Environment Variables

Key variables set by the dotfiles:

- `DOTDIR`: Points to ~/.dot
- `ZDOTDIR`: Points to ~/.dot/zsh
- `XDG_*`: Standard XDG base directories
- `NOTES_DIR`: ~/Notebook (for notes plugin)
- `EDITOR`: code (VS Code)
