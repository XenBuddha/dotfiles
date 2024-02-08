#!/bin/bash

# Find all dot files then if the original file exists, create a backup
# Once backed up to {file}.dtbak symlink the new dotfile in place
for file in $(find . -maxdepth 1 -name ".*" -type f  -printf "%f\n" ); do
    if [ -e ~/$file ]; then
        mv -f ~/$file{,.dtbak}
    fi
    ln -s $PWD/$file ~/$file
done

# Install utilties, font, TPM, and .zshrc dependencies
echo "installing utilities..."
<<<<<<< HEAD
sudo apt update && sudo apt -y install vim-scripts zsh htop lsd bat vim git gh tmux xclip curl fc-cache
=======
sudo apt update && sudo apt -y install vim-scripts zsh curl htop lsd bat vim git gh tmux xclip
>>>>>>> b195ca162c520e4e20f24ea5162912c68664d39e

echo "installing JetBrainsMono terminal fonts..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"

echo "installing tmux plugin manager..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Installing vim plugin manager..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "installing zsh dependencies..."
sudo apt -y install zsh-syntax-highlighting
mkdir -p ~/.zsh/git-prompt
wget -O ~/.zsh/git-prompt/git-prompt.zsh https://github.com/woefe/git-prompt.zsh/raw/master/git-prompt.zsh
mkdir -p ~/.zsh/zsh-autosuggestions
wget -O ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh https://github.com/zsh-users/zsh-autosuggestions/raw/master/zsh-autosuggestions.zsh
mkdir -p ~/.zsh/zsh-history-substring-search
wget -O ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh https://github.com/zsh-users/zsh-history-substring-search/raw/master/zsh-history-substring-search.zsh
echo
echo "Installed"
echo "Use chsh -s /bin/zsh to switch to ZSH shell"
echo
echo "On first run of VIM execute :PlugInstall to init plugins"
echo "NerdTree is mapped to F2"
echo
