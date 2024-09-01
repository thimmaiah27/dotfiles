# Ensure PATH only contains unique entries
typeset -U PATH path

# XDG Base Directory
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

# Go configuration
export GOPATH="$HOME/go"

# Zsh history file location
export HISTFILE="$XDG_CACHE_HOME/zsh/history"

# Default applications
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="alacritty"
export COLORTERM="truecolor"

# Path configuration
path=(
    "$HOME/go/bin"
    "/usr/local/go/bin"
    "$XDG_DATA_HOME/npm/bin"
    "$HOME/.local/bin"
    $path
)
export PATH

# LF file manager icons
export LF_ICONS="di=:fi=:ln=:or=:ex=:*.vimrc=:*.viminfo=:*.gitignore=:*.c=:*.cc=:*.clj=:*.coffee=:*.cpp=:*.css=:*.d=:*.dart=:*.erl=:*.exs=:*.fs=:*.go=:*.h=:*.hh=:*.hpp=:*.hs=:*.html=:*.java=:*.jl=:*.js=:*.json=:*.lua=:*.md=:*.php=:*.pl=:*.pro=:*.py=:*.rb=:*.rs=:*.scala=:*.ts=:*.vim=:*.cmd=:*.ps1=:*.sh=:*.bash=:*.zsh=:*.fish=:*.tar=:*.tgz=:*.arc=:*.arj=:*.taz=:*.lha=:*.lz4=:*.lzh=:*.lzma=:*.tlz=:*.txz=:*.tzo=:*.t7z=:*.zip=:*.z=:*.dz=:*.gz=:*.lrz=:*.lz=:*.lzo=:*.xz=:*.zst=:*.tzst=:*.bz2=:*.bz=:*.tbz=:*.tbz2=:*.tz=:*.deb=:*.rpm=:*.jar=:*.war=:*.ear=:*.sar=:*.rar=:*.alz=:*.ace=:*.zoo=:*.cpio=:*.7z=:*.rz=:*.cab=:*.wim=:*.swm=:*.dwm=:*.esd=:*.jpg=:*.jpeg=:*.mjpg=:*.mjpeg=:*.gif=:*.bmp=:*.pbm=:*.pgm=:*.ppm=:*.tga=:*.xbm=:*.xpm=:*.tif=:*.tiff=:*.png=:*.svg=:*.svgz=:*.mng=:*.pcx=:*.mov=:*.mpg=:*.mpeg=:*.m2v=:*.mkv=:*.webm=:*.ogm=:*.mp4=:*.m4v=:*.mp4v=:*.vob=:*.qt=:*.nuv=:*.wmv=:*.asf=:*.rm=:*.rmvb=:*.flc=:*.avi=:*.fli=:*.flv=:*.gl=:*.dl=:*.xcf=:*.xwd=:*.yuv=:*.cgm=:*.emf=:*.ogv=:*.ogx=:*.aac=:*.au=:*.flac=:*.m4a=:*.mid=:*.midi=:*.mka=:*.mp3=:*.mpc=:*.ogg=:*.ra=:*.wav=:*.oga=:*.opus=:*.spx=:*.xspf=:*.pdf=:*.nix=:"

# Clipmenu configuration
export CM_SELECTIONS="clipboard"
export CM_OUTPUT_CLIP=0
export CM_MAX_CLIPS=10
export CM_HISTLENGTH=10

# LESS colors
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # green
export LESS_TERMCAP_md=$(tput bold; tput setaf 2) # green
export LESS_TERMCAP_so=$(tput bold; tput setaf 3) # yellow
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 1) # red
export LESS_TERMCAP_ue=$(tput sgr0)
export LESS_TERMCAP_me=$(tput sgr0)

# Hyprland-specific configurations
if [[ $XDG_SESSION_TYPE == "wayland" ]]; then
    export MOZ_ENABLE_WAYLAND=1
    export QT_QPA_PLATFORM="wayland;xcb"
    export SDL_VIDEODRIVER=wayland
    export _JAVA_AWT_WM_NONREPARENTING=1
    export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
fi

# Fcitx5 configuration (if needed)
# export GTK_IM_MODULE=fcitx
# export QT_IM_MODULE=fcitx
# export XMODIFIERS=@im=fcitx
# export SDL_IM_MODULE=fcitx
