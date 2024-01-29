#!/bin/bash

# Find all dot files then if the original file exists, create a backup
# Once backed up to {file}.dtbak symlink the new dotfile in place
for file in $(find . -maxdepth 1 -name ".*" -type f  -printf "%f\n" ); do
    if [ -e ~/$file ]; then
        mv -f ~/$file{,.dtbak}
    fi
    ln -s $PWD/$file ~/$file
done

# Install  vim-addons ZSH and ZSH extras
    echo "installing vim & zsh extras..."
    sudo apt update && sudo apt -y install vim-scripts zsh zsh-syntax-highlighting zsh-autosuggestions
    echo "installing support apps..."
    sudo apt update && sudo apt -y install htop lsd bat vim git
    echo "installing JetBrainsMono terminal fonts..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"
    echo "installing tmux & support apps..."
    sudo apt update && sudo apt -y install tmux xclip
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Installed"
echo "use chsh -s /bin/zsh to switch to ZSH shell"
