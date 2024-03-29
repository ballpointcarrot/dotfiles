echo "==============================="
echo "= ballpointcarrot's  Dotfiles ="
echo "==============================="

dir=$HOME/.dotfiles
cd "$HOME" || exit

if [ -z "$(/usr/bin/which git)" ]; then
    echo "Please install git before continuing."
    exit 1
fi

printf "\nCloning dotfiles..."
git clone https://github.com/ballpointcarrot/dotfiles.git "$dir"

printf "\n\nInstalling ZPrezto...\n"
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
cp "$dir/zpreztorc" "$HOME/.zpreztorc"

printf "\n\nCloning vim config..."
if [ -d "$HOME/.vim" ]; then
    echo "First, backing up existing vim config."
    if [ -d "$HOME/.vim_backup" ]; then
        rm -rf "$HOME/.vim_backup"
    fi
    mv "$HOME/.vim" "$HOME/.vim_backup"
    mv "$HOME/.vimrc" "$HOME/.vim_backup/vimrc_backup"
fi

printf "\n\nInstalling Emacs configuration..."
if [ -d "$HOME/.emacs.d" ]; then
    echo "Back up existing Emacs config."
    if [ -d "$HOME/.emacs.d.backup" ]; then
        rm -rf "$HOME/.emacs.d.backup"
    fi

    mv "$HOME/.emacs.d" "$HOME/.emacs.d.backup"
    mkdir "$HOME/.emacs.d"
fi

# install Doom Emacs
git clone --depth=1 https://github.com/hlissner/doom-emacs ~/.emacs.d

# Copy Doom local configuration
ln -s "$dir/.doom.d" "$HOME/.doom.d"

# Install Doom Emacs
~/.emacs.d/bin/doom install


printf "\n\nInstalling ballpointcarrot's vim config..."
git clone https://github.com/ballpointcarrot/vim-config.git $HOME/.vim > /dev/null 2>&1
printf "\nUpdating bundled plugins..."
cd .vim && git submodule update --init > /dev/null 2>&1
cd $HOME
ln -s $HOME/.vim/vimrc .vimrc

# Nerd Fonts
printf "\nInstalling Nerd Fonts...\n"
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git $dir/nerd-fonts > /dev/null 2>&1
cd "$dir/nerd-fonts" && ./install.sh
cd - || exit

# Dotfiles
printf "\nInstalling fresh dotfiles...\n"
if [ -f $HOME/.gitconfig ]; then
    echo "backing up old gitconfig..."
    mv $HOME/.gitconfig $HOME/.gitconfig_backup

fi
cp $dir/gitconfig $HOME/.gitconfig

if [ -f $HOME/.zshrc ]; then
    echo "backing up old zshrc..."
    mv $HOME/.zshrc $HOME/.zshrc_backup

fi
cp $dir/zshrc $HOME/.zshrc


if [ -f $HOME/.Xdefaults ]; then
    echo "backing up old Xdefaults..."
    mv $HOME/.Xdefaults $HOME/.Xdefaults_backup

fi
cp $dir/Xdefaults $HOME/.Xdefaults

printf "Complete! Best used with zsh and a Unicode-supported terminal.\n"
