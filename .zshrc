export PATH=$HOME/bin:$HOME/.gem/ruby/2.6.0/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=powerlevel10k/powerlevel10k
plugins=(zsh-autosuggestions zsh-syntax-highlighting sudo vi-mode common-aliases z git archlinux colored-man-pages)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Example aliases
alias zrc="vim ~/.zshrc"
alias zsrc="source ~/.zshrc"
alias l="colorls --sd --gs -1A"
alias ll="colorls --sd --gs -lA"
