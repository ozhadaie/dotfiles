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
echo "Do you want to install zsh plugins? [yes|no]: \a\c"
read plans
case $plans in
	[yY] | [yY][Ee][Ss] )
		if [ ! -d "~/.oh-my-zsh" ]; then
			echo "${YELLOW}Cloning${NC} oh-my-zsh \c"
			git clone --quiet https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
		fi
		if [ -f "~/.zshrc" ]; then
			echo "Backuping zshrc"
			cp ~/.zshrc ~/.zshrc.orig
		fi
		curl -fLo ~/.zshrc "https://raw.githubusercontent.com/ozhadaie/dotfiles/master/.zshrc" > /dev/null
		echo "${GREEN}Success${NC}"
		# chsh -s $(which zsh)
		if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
			echo "${YELLOW}Cloning${NC} powerlevel10k \c"
			git clone --quiet https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
			echo "${GREEN}Success${NC}"
		fi
		if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
			git clone --quiet https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions > /dev/null
		fi
		if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax/highlighting" ]; then
			git clone --quiet https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting /dev/null
		fi
		source ~/.zshrc > /dev/null
		echo "${YELLOW}Downloading${NC} font \c"
		case $(uname | tr '[:upper:]' '[:lower:]') in
			linux*)
				echo "Install for Linux"
				mkdir -p ~/.local/share/fonts
				cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
				;;
			darwin*)
				echo "Install for OSX"
				mkdir -p ~/Library/Fonts
				cd ~/Library/Fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
				;;
		esac
		echo "${GREEN}Success${NC}"
		echo "Please install this font in terminal preferences"
		echo "${GREEN} Droid Sans Mono for Powerline Nerd Font Complete.otf${NC}"
		;;
	[nN] | [n|N][O|o] )
		;;
	*)
		echo "Invalid input"
		;;
esac

vpi () {
	echo "${YELLOW}Installing${NC} $2 \c"
	local inst_dir="$HOME/.vim/pack/$1/start/"
	mkdir -p $inst_dir
	cd $inst_dir
	git clone --quiet https://github.com/$1/$2.git
	vim -u NONE -c "helptags $2/doc" -c q
	echo "${GREEN}Success${NC}"
}
printf "$RED"
cat <<- 'EOF'
       _                            _
      (_)                          | |
__   ___ _ __ ___  _ __   __ _ _ __| |_
\ \ / / | '_ ` _ \| '_ \ / _` | '__| __|
 \ V /| | | | | | | |_) | (_| | |  | |_
  \_/ |_|_| |_| |_| .__/ \__,_|_|   \__|
                  | |
                  |_|
EOF
printf "$NC"
echo "Do you want to install vim plugins? [yes or no]: \a\c"
read vimans
case $vimans in
	[yY] | [yY][Ee][Ss] )
		vpi airblade vim-gitgutter
		vpi chriskempson base16-vim
		vpi easymotion vim-easymotion
		vpi jiangmiao auto-pairs
		vpi justinmk vim-syntax-extra
		vpi kien rainbow_parentheses.vim
		vpi majutsushi tagbar
		vpi octol vim-cpp-enhanced-highlight
		vpi powerline powerline
		vpi ryanoasis vim-devicons
		vpi scrooloose nerdtree
		vpi tiagofumo vim-nerdtree-syntax-highlight
		vpi tpope vim-fugitive
		vpi tpope vim-repeat
		vpi tpope vim-speeddating
		vpi tpope vim-surround
		vpi vim-airline vim-airline
		vpi vim-airline vim-airline-themes
		vpi vim-scripts c.vim
		vpi vim-syntastic syntastic
		vpi w0rp ale
		vpi xolox vim-misc
		vpi xolox vim-session
		if [ -f "~/.vimrc" ]; then
			echo "Do you want to overwrite vimrc? [yes or no]: \c"
			read ans
			case $ans in
				[yY] | [yY][Ee][Ss] )
					cd $PREV_DIR
					echo "Creating a backup for .vimrc"
					cp ~/.vimrc ~/.vimrc.orig
					curl -fSsL https://raw.githubusercontent.com/ozhadaie/dotfiles/master/.vimrc -o ~/.vimrc && source ~/.vimrc
					;;
			esac
		fi
		;;
	[nN] | [n|N][O|o] )
		;;
	*)
		echo "Invalid input"
		;;
esac
