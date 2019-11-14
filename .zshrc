# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PORT=8080
export PATH=$HOME/bin:/usr/local/bin:$PATH:$HOME/.gem/ruby/2.6.0/bin
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
export LANG=en_US.utf-8

#PLUGINS {{{
plugins=(
	archlinux
	colored-man-pages
	common-aliases
	fzf
	git
	heroku
	node
	npm
	sudo
	z
	zsh-autosuggestions
	zsh-syntax-highlighting
)
#}}}
source $ZSH/oh-my-zsh.sh

#ALIASES {{{
alias ll="colorls --sd --gs -lA"
alias ls="colorls --sd --gs --tree=2"
alias l="colorls --sd --gs -1A"

alias vrc="vim ~/.vimrc"
alias zrc="vim ~/.zshrc"
#}}}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
