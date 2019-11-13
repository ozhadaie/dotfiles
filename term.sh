RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'
printf "$GREEN"
cat <<-'EOF'
      ___           ___           ___           ___          _____          ___                       ___
     /  /\         /  /\         /__/\         /  /\        /  /::\        /  /\        ___          /  /\
    /  /::\       /  /::|        \  \:\       /  /::\      /  /:/\:\      /  /::\      /  /\        /  /:/_
   /  /:/\:\     /  /:/:|         \__\:\     /  /:/\:\    /  /:/  \:\    /  /:/\:\    /  /:/       /  /:/ /\
  /  /:/  \:\   /  /:/|:|__   ___ /  /::\   /  /:/~/::\  /__/:/ \__\:|  /  /:/~/::\  /__/::\      /  /:/ /:/_
 /__/:/ \__\:\ /__/:/ |:| /\ /__/\  /:/\:\ /__/:/ /:/\:\ \  \:\ /  /:/ /__/:/ /:/\:\ \__\/\:\__  /__/:/ /:/ /\
 \  \:\ /  /:/ \__\/  |:|/:/ \  \:\/:/__\/ \  \:\/:/__\/  \  \:\  /:/  \  \:\/:/__\/    \  \:\/\ \  \:\/:/ /:/
  \  \:\  /:/      |  |:/:/   \  \::/       \  \::/        \  \:\/:/    \  \::/          \__\::/  \  \::/ /:/
   \  \:\/:/       |  |::/     \  \:\        \  \:\         \  \::/      \  \:\          /__/:/    \  \:\/:/
    \  \::/        |  |:/       \  \:\        \  \:\         \__\/        \  \:\         \__\/      \  \::/
     \__\/         |__|/         \__\/         \__\/                       \__\/                     \__\/
EOF
printf "$NC"
echo -n "Do you want to install zsh plugins? [yes|no]: "
read goal
case $goal in
	[yY] | [yY][Ee][Ss] )
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
		git clone --quiet https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
		git clone --quiet https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
		git clone --quiet https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
		[ -f $HOME/.zshrc ] &&  cp ~/.zshrc ~/.zshrc.orig
		curl -fLo ~/.zshrc "https://raw.githubusercontent.com/ozhadaie/dotfiles/master/.zshrc"
		echo "Please restart your terminal"
		;;
	[nN] | [n|N][O|o] )
		;;
	*)
		echo "Invalid input"
		;;
esac

echo "Do you want to install vim plugins? [yes or no]: \a\c"
read vimans
case $vimans in
	[yY] | [yY][Ee][Ss] )
		[ -f "$~/.vimrc" ] && cp ~/.vimrc ~/.vimrc.orig
		curl -fSsL https://raw.githubusercontent.com/ozhadaie/dotfiles/master/.vimrc -o ~/.vimrc
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
			https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		vim ~/.vimrc -c "so %" -c "PlugInstall"
		;;
	[nN] | [n|N][O|o] )
		;;
	*)
		echo "Invalid input"
		;;
esac
