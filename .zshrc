export ZSH=$HOME/.oh-my-zsh
export PATH=$PATH:~/.gem/ruby/2.3.0/bin

ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(z git colored-man-pages common-aliases command-not-found copyfile zsh-autosuggestions zsh-syntax-highlighting web-search)

source $ZSH/oh-my-zsh.sh

POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_DIR_ETC_BACKGROUND='red'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='darkolivegreen2'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='mediumpurple1'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs newline status)
POWERLEVEL9K_DISABLE_RPROMPT=true
# aliases {{{
alias lc='lolcat'
alias c='colorls -lA --sd --gs'
alias zcfg="vim ~/.zshrc"
alias zsrc="source ~/.zshrc"
alias rm="rm -i"
alias rmsh="rm -rf ~/.oh-my-zsh ~/.zsh* ~/.vim* && echo 'Restart term'"
alias pipenv='python3 -m pipenv'
alias cc='cc -Wall -Wextra -Werror'
alias vrc='vim ~/.vimrc'
# }}}

echo "\033[1;32m"
cat <<- 'EOF'
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
echo "\033[0m"
