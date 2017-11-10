# Example aliases
# alias zshconfig="emacs -nw ~/.zshrc"
alias ls="ls --color=auto"

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

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
