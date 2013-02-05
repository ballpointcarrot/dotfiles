echo "==============================="
echo "= ballpointcarrot's  Dotfiles ="
echo "==============================="

dir=$HOME/.dotfiles
cd $HOME

printf "\nCloning dotfiles..."
#git clone https://github.com/ballpointcarrot/dotfiles.git $dir

printf "\n\nInstalling Oh My ZSH...\n"
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh > /dev/null 2>&1

printf "\n\nCloning vim config..."
if [ -d $HOME/.vim ]; then
	echo "First, backing up existing vim config."
	if [ -d $HOME/.vim_backup ]; then
		rm -rf $HOME/.vim_backup
	fi
	mv $HOME/.vim $HOME/.vim_backup
	mv $HOME/.vimrc $HOME/.vim_backup/vimrc_backup
fi

printf "\n\nInstalling ballpointcarrot's vim config..."
git clone https://github.com/ballpointcarrot/vim-config.git $HOME/.vim > /dev/null 2>&1
printf "\nUpdating bundled plugins..."
cd .vim && git submodule update --init > /dev/null 2>&1
cd $HOME
ln -s $HOME/.vim/vimrc .vimrc

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

printf "Complete! Best used with zsh and URxvt.\n"
