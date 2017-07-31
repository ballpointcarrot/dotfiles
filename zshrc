# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="steeef"
# ZSH_THEME="kolo"
# ZSH_THEME="nanotech"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(aws colored-man-pages docker git lein node npm nvm rust tmux vim rbenv)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export HOMEPATH=$HOME/.local/bin:$HOME/.cask/bin:$HOME/bin:$HOME/.rbenv/bin
export PATH=$HOMEPATH:$PATH

if [ "$COLORTERM" = "gnome-terminal" ] || [ "$COLORTERM" = "xfce4-terminal" ] || [ -n "$KONSOLE_PROFILE_NAME" ]; then
    if [ -z "$TMUX" ]; then
        export TERM="xterm-256color"
    fi
fi

if [ "$TERM" = "dumb" ]; then
    export PS1="> "
fi

for file in $(find $HOME/.zsh.d -type f); do
    source $file
done
