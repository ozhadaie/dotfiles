#!/bin/bash
# Setup oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended" 
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
ex -s -c '%s/plugins=(/plugins=(zsh-autosuggestions /g|x' $HOME/.zshrc
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
ex -s -c '%s/plugins=(/plugins=(zsh-syntax-highlighting /g|x' $HOME/.zshrc

ex -s -c '%s/plugins=(/plugins=(common-aliases colored-man-pages z /g|x' $HOME/.zshrc

source $HOME/.zshrc
sleep 1
# Install theme for oh-my-zsh [powerlevel10k]
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
ex -s -c '%s/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"powerlevel10k\/powerlevel10k\"/g|x' $HOME/.zshrc

BREWPATH=$HOME/goinfre
rm -rf $HOME/.brew
git clone --depth=1 https://github.com/Homebrew/brew $BREWPATH/.brew

# Create .brewconfig script in home directory
cat > $HOME/.brewconfig.zsh <<EOL
# HOMEBREW CONFIG
# Add brew to path
export PATH=\$BREWPATH/.brew/bin:\$PATH
# Set Homebrew temporary folders
export HOMEBREW_CACHE=/tmp/\$USER/Homebrew/Caches
export HOMEBREW_TEMP=/tmp/\$USER/Homebrew/Temp
mkdir -p \$HOMEBREW_CACHE
mkdir -p \$HOMEBREW_TEMP
# If NFS session
# Symlink Locks folder in /tmp
if df -T autofs,nfs \$HOME 1>/dev/null
then
  HOMEBREW_LOCKS_TARGET=/tmp/\$USER/Homebrew/Locks
  HOMEBREW_LOCKS_FOLDER=\$BREWPATH/.brew/var/homebrew
  mkdir -p \$HOMEBREW_LOCKS_TARGET
  mkdir -p \$HOMEBREW_LOCKS_FOLDER
  # Symlink to Locks target folders
  # If not already a symlink
  if ! [[ -L \$HOMEBREW_LOCKS_FOLDER && -d \$HOMEBREW_LOCKS_FOLDER ]]
  then
     echo "Creating symlink for Locks folder"
     rm -rf \$HOMEBREW_LOCKS_FOLDER
     ln -s \$HOMEBREW_LOCKS_TARGET \$HOMEBREW_LOCKS_FOLDER
  fi
fi
EOL

# Add .brewconfig sourcing in your .zshrc if not already present
if ! grep -q "# Load Homebrew config script" $HOME/.zshrc
then
cat >> $HOME/.zshrc <<EOL
# Load Homebrew config script
source \$HOME/.brewconfig.zsh
EOL
fi

source $HOME/.brewconfig.zsh
rehash
brew update

brew cask list

source $HOME/.zshrc

echo "\nPlease open a new shell to finish installation"
