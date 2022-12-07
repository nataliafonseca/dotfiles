function obsidian () {
    TARGET_DIR=$(realpath $*)
    xdg-open obsidian://open?path="$TARGET_DIR" &>/dev/null
}