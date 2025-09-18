##? pacman - Arch Linux package manager utilities
##?
##? Provides shortcuts for pacman and yay package management:
##?   pacman:s       - Install packages with pacman
##?   pacman:sf      - Install packages without confirmation
##?   pacman:syu     - Full system update
##?   pacman:r       - Remove packages
##?   yay:s          - Install AUR packages with yay
##?   yay:sf         - Install AUR packages without confirmation
##?   yaur           - Interactive AUR package browser with preview

# Pacman aliases
alias pacman:s="sudo pacman -S --needed"
alias pacman:sf="sudo pacman -S --needed --noconfirm"
alias pacman:syu="sudo pacman -Syu"
alias pacman:r="sudo pacman -R"

# Yay (AUR helper) aliases
alias yay:s='yay -S --needed'
alias yay:sf="yay -S --needed --noconfirm"

# Interactive AUR package browser with fuzzy search and preview
yaur() {
    if ! command -v fzf >/dev/null 2>&1; then
        echo "fzf is required but not installed. Install with: pacman -S fzf"
        return 1
    fi

    if ! command -v yay >/dev/null 2>&1; then
        echo "yay is required but not installed. Install from AUR first."
        return 1
    fi

    yay -Slq | fzf -m --preview 'bat <(yay -Si {1} 2>/dev/null || echo "Package info not available") <(yay -Fl {1} 2>/dev/null | awk "{print \$2}" || echo "File list not available")' | xargs -ro yay -S
}