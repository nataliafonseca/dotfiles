is_mac && 
export ANDROID_HOME=~/Library/Android/Sdk || 
export ANDROID_HOME=~/.local/share/Android/Sdk

export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

alias pixel="nohup emulator @Pixel > /dev/null &"
