export EDITOR="vim"
export VISUAL="vim"
export BROWSER="firefox"
export TERMINAL="alacritty"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export PATH="$PATH:${$(find ~/.local/bin -type d -printf %p:)%%:}"

export PYTHONSTARTUP="$XDG_CONFIG_HOME/.pythonrc"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export FFMPEG_DATADIR="$XDG_CONFIG_HOME/ffmpeg"
export GTK_RC_FILES="$XDG_CONFIG_HOME/gtk-1.0/gtkrc"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export CALCHISTFILE="$XDG_CACHE_HOME/calc_history"
export HISTFILE="$XDG_CACHE_HOME/zsh/history"
export LESSHISTFILE="-"
export GRIM_DEFAULT_DIR="$HOME/Documents/screenshots"
export MOZ_ENABLE_WAYLAND=1

if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
      exec sway
fi
