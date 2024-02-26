#!/bin/bash

echo

# Check if sudo is installed on host

if ! [ -x "$(command -v sudo)" ]; then
    echo 'Error: sudo is not installed.' >&2
    exit 1
    fi

# Check if user has sudo privledge

is_sudoer() {
    ERR_NOT_ROOT=87
    if ! $(sudo -v &> /dev/null); then
        #echo "Error: Must be a privilaged (sudo) user to execute"
        return $ERR_NOT_ROOT
    fi
    return 0
}

if is_sudoer; then

    echo
    
    # Find all dot files then if the original file exists, create a backup
    # Once backed up to {file}.dtbak symlink the new dotfile in place
    
    for file in $(find . -maxdepth 1 -name ".*" -type f  -printf "%f\n" ); do
        if [ -e ~/$file ]; then
            mv -f ~/$file{,.dtbak}
        fi
        ln -s $PWD/$file ~/$file
    done
    
    # Install utilties, font, TPM, and .zshrc dependencies

    echo
    echo "installing utilities..."
    sudo apt update && sudo apt -y install vim-scripts zsh htop lsd bat vim git gh tmux xclip curl
    echo
    echo "installing JetBrainsMono terminal fonts..."
    sudo apt -y install unzip fontconfig
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"
    echo
    echo "installing tmux plugin manager..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    echo
    echo "Installing vim plugin manager..."
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo
    echo "installing zsh dependencies..."
    sudo apt -y install zsh-syntax-highlighting
    mkdir -p ~/.zsh/git-prompt
    wget -O ~/.zsh/git-prompt/git-prompt.zsh https://github.com/woefe/git-prompt.zsh/raw/master/git-prompt.zsh
    mkdir -p ~/.zsh/zsh-autosuggestions
    wget -O ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh https://github.com/zsh-users/zsh-autosuggestions/raw/master/zsh-autosuggestions.zsh
    mkdir -p ~/.zsh/zsh-history-substring-search
    wget -O ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh https://github.com/zsh-users/zsh-history-substring-search/raw/master/zsh-history-substring-search.zsh
    
    # stiffle shh login motd

    touch ~/.hushlogin
    
    echo
    echo "Installed"
    echo
    echo "Use chsh -s /bin/zsh to switch to ZSH shell"
    echo "then run 'exec zsh' to reload zsh environment"
    echo "or logout and login again"
    echo
    echo "On first run of VIM execute :PlugInstall to init plugins"
    echo "NerdTree is mapped to F2"
    echo

else
    echo "Permissioned denied!"
fi
