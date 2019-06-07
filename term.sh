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
echo "${YELLOW}Cloning${NC} oh-my-zsh \c"
git clone --quiet https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh 2> /dev/null
if [ -f "~/.zshrc" ]; then
	echo "Backuping zshrc"
	cp ~/.zshrc ~/.zshrc.orig 2> /dev/null
fi
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc 2> /dev/null
echo "${GREEN}Success${NC}"
# chsh -s /bin/zsh
echo "${YELLOW}Cloning${NC} powerlevel10k \c"
git clone --quiet https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k 2> /dev/null
echo "${GREEN}Success${NC}"
git clone --quiet https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions 2> /dev/null 
git clone --quiet https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting 2> /dev/null
vim ~/.zshrc -c %s/"robbyrussell"/"powerlevel10k\/powerlevel10k"/g -c wq
vim ~/.zshrc -c %s/\(git\)/\(git\ colored-man-pages\ common-aliases\ command-not-found\ copyfile\ zsh-autosuggestions\ zsh-syntax-highlighting\ web-search\)/g -c wq
echo "POWERLEVEL9K_MODE='awesome-fontconfig'" >> ~/.zshrc
echo "POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs newline newline os_icon)" >> ~/.zshrc
echo "POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time)" >> ~/.zshrc
echo "alias zcfg=\"vim ~/.zshrc\"" >> ~/.zshrc
echo "alias zsrc=\"source ~/.zshrc\"" >> ~/.zshrc
echo "alias rm=\"rm -i\"" >> ~/.zshrc
echo "alias rmsh=\"rm -rf ~/.oh-my-zsh ~/.zsh* ~/.vim* && echo 'Restart term'\"" >> ~/.zshrc
source ~/.zshrc 2> /dev/null
echo "${YELLOW}Installation${NC} font \c"
case "$OSTYPE" in
	darwin*) 
		cd ~/Library/Fonts 2> /dev/null && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf 2> /dev/null && cd - >> /dev/null
		;;
	linux*)
		mkdir -p ~/.local/share/fonts
		cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf 2> /dev/null && cd - >> /dev/null
		;;
esac
echo "${GREEN}Success${NC}"
PREV_DIR=$(pwd)
vpi () {
	echo "${YELLOW}Installation${NC} $2 \c"
	local inst_dir="$HOME/.vim/pack/$1/start/"
	mkdir -p $inst_dir > /dev/null
	cd $inst_dir > /dev/null
	git clone --quiet https://github.com/$1/$2.git 2> /dev/null
	vim -u NONE -c "helptags $2/doc" -c q
	echo "${GREEN}Success${NC}"
}
printf "$RED"
echo "\a"
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
echo "Do you want to install vim plugins? [yes or no]: \c"
read yno
case $yno in
	[yY] | [yY][Ee][Ss] )
		vpi airblade vim-gitgutter
		vpi chriskempson base16-vim
		vpi easymotion vim-easymotion
		vpi kien rainbow_parentheses.vim
		vpi majutsushi tagbar
		vpi powerline powerline
		vpi ryanoasis vim-devicons
		vpi scrooloose nerdtree
		vpi tiagofumo vim-nerdtree-syntax-highlight
		vpi tpope vim-speeddating
		vpi tpope vim-repeat
		vpi tpope vim-surround
		vpi tpope vim-fugitive
		vpi vim-airline vim-airline
		vpi vim-airline vim-airline-themes
		vpi vim-scripts c.vim
		vpi vim-syntastic syntastic
		vpi w0rp ale
		vpi xolox vim-misc
		vpi xolox vim-session
		vpi jiangmiao auto-pairs
		echo "Do you want to overwrite vimrc? [yes or no]: \c"
		read ans
		case $ans in
			[yY] | [yY][Ee][Ss] )
				cd $PREV_DIR 2> /dev/null
				if [ -f "~/.vimrc" ]; then
					cp ~/.vimrc ~/.vimrc.orig 2> /dev/null
				fi
				curl -fSsL https://raw.githubusercontent.com/ozhadaie/dotfiles/master/.vimrc -o ~/.vimrc 2> /dev/null && source ~/.vimrc 2> /dev/null
				;;
		esac
		;;
	[nN] | [n|N][O|o] )
		echo "Not agreed, НУ ЧТО Ж.. БЕЗ ВИМА ТАК БЕЗ ВИМА";
		;;
	*) echo "Invalid input"
		;;
esac
echo "Choose as terminal font $GREEN Droid Sans Mono for Powerline Nerd Font Complete.otf$NC"
echo "And restart terminal"
