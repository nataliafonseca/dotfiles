[[ ! -z $XDG_CONFIG_HOME ]] && ([[ -d $XDG_CONFIG_HOME ]] || mkdir -p $XDG_CONFIG_HOME)
[[ ! -z $XDG_CACHE_HOME ]] && ([[ -d $XDG_CACHE_HOME ]] || mkdir -p $XDG_CACHE_HOME)
[[ ! -z $XDG_DATA_HOME ]] && ([[ -d $XDG_DATA_HOME ]] || mkdir -p $XDG_DATA_HOME)
[[ ! -z $XDG_RUNTIME_DIR ]] && ([[ -d $XDG_RUNTIME_DIR ]] || mkdir -p $XDG_RUNTIME_DIR)

if [[ is_mac ]]; then
  [[ ! -z $XDG_DESKTOP_DIR ]] && ([[ -d $XDG_DESKTOP_DIR ]] || mkdir -p $XDG_DESKTOP_DIR)
  [[ ! -z $XDG_DOCUMENTS_DIR ]] && ([[ -d $XDG_DOCUMENTS_DIR ]] || mkdir -p $XDG_DOCUMENTS_DIR)
  [[ ! -z $XDG_DOWNLOAD_DIR ]] && ([[ -d $XDG_DOWNLOAD_DIR ]] || mkdir -p $XDG_DOWNLOAD_DIR)
  [[ ! -z $XDG_MUSIC_DIR ]] && ([[ -d $XDG_MUSIC_DIR ]] || mkdir -p $XDG_MUSIC_DIR)
  [[ ! -z $XDG_PICTURES_DIR ]] && ([[ -d $XDG_PICTURES_DIR ]] || mkdir -p $XDG_PICTURES_DIR)
  [[ ! -z $XDG_VIDEOS_DIR ]] && ([[ -d $XDG_VIDEOS_DIR ]] || mkdir -p $XDG_VIDEOS_DIR)
  [[ ! -z $XDG_PROJECTS_DIR ]] && ([[ -d $XDG_PROJECTS_DIR ]] || mkdir -p $XDG_PROJECTS_DIR)
fi

setopt autocd
