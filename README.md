### .zshrc

Static prompt with realtime clock and rprompt execution time.

![Screenshot from 2024-01-29 15-10-16](https://github.com/XenBuddha/dotfiles/assets/24990580/7ed11369-536e-4dca-a1a3-bd215e54fca0)

### .tmux.conf

Mouse support; toggle status line on/off; tpm integration; prompt with host, session#, window#, pane#, pane command, open window indicator(s) and day/date/time on right. 

![Screenshot from 2024-01-29 15-17-39](https://github.com/XenBuddha/dotfiles/assets/24990580/8d7b38ec-be00-4c30-8893-a6f206b34543)

### .vimrc

Mouse on in TMUX and off in vim.

### install.sh

Finds .{files} in the home directory, then if the original .{file} exists, creates a backup to .{file}.dtbak.  Once backed up to .{file}.dtbak symlink the new .{file} in place.  The script will finish by installing stuff as desired.
