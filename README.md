### .zshrc

Static prompt with rprompt execution time and compact git functionality.

![Screenshot from 2024-02-01 20-36-20](https://github.com/XenBuddha/dotfiles/assets/24990580/324edf30-9dfa-4037-8d66-320541bc8c60)

### .tmux

Mouse support; toggle status line on/off; tpm integration; prompt with host, session#, window#, pane#, pane command, open window indicator(s) and day/date/time on right. 

![Screenshot from 2024-01-29 15-17-39](https://github.com/XenBuddha/dotfiles/assets/24990580/8d7b38ec-be00-4c30-8893-a6f206b34543)

### .vimrc

Mouse on in TMUX and off in vim.

### install.sh

Finds .{files} in the home directory.  If the original .{file} exists, create a backup to .{file}.dtbak.  Once backed up to .{file}.dtbak, symlink the new .{file} in place.  The script will finish by installing applications to support the zshrc configuration.

### uninstall.sh

Finds .{files} in the home directory and removes them if the file is a symlink, Then restores the .{file}.dtbak to its original location if the backup file exists.
