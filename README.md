### .zshrc

fixed prompt with realtime clock and rprompt execution time

![Screenshot from 2024-01-29 15-10-16](https://github.com/XenBuddha/dotfiles/assets/24990580/7ed11369-536e-4dca-a1a3-bd215e54fca0)

### .tmux.conf

mouse support; status line on/off; tpm integration
prompt with host, session#, window#, pane#, pane command, window indicator and day/date/time on right 

![Screenshot from 2024-01-29 15-17-39](https://github.com/XenBuddha/dotfiles/assets/24990580/8d7b38ec-be00-4c30-8893-a6f206b34543)

### .install.sh

Finds dot files in home then if the original file exists, creates a backup to {file}.dtbak.
 Once backed up to {file}.dtbak symlink the new dotfile in place.  Then the script will finish by installing stuff as you require.

 ### .vimrc

 Mouse on in TMUX and off in vim
