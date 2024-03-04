# ~/.zshrc file for zsh interactive shells.
# see /usr/share/doc/zsh/examples/zshrc for examples

setopt autocd              # change directory just by typing its name
setopt interactivecomments # allow comments in interactive mode
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch           # hide error message if there is no match for the pattern
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt promptsubst         # enable command substitution in prompt

WORDCHARS=${WORDCHARS//\/} # Don't consider certain characters part of the word

# configure key keybindings
bindkey -e                                        # emacs key bindings
bindkey ' ' magic-space                           # do history expansion on space
bindkey '^U' backward-kill-line                   # ctrl + U
bindkey '^[[3;5~' kill-word                       # ctrl + Sun
bindkey '^[[3~' delete-char                       # delete
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-
bindkey '^[[5~' beginning-of-buffer-or-history    # page up
bindkey '^[[6~' end-of-buffer-or-history          # page down
bindkey '^[[H' beginning-of-line                  # home
bindkey '^[[F' end-of-line                        # end
bindkey '^[[Z' undo                               # shift + tab undo last action

# enable zsh completion features
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# History configurations
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=1000
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
#setopt share_history         # share command history data

# enable syntax-highlighting
if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
   . /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
    ZSH_HIGHLIGHT_STYLES[default]=none
    ZSH_HIGHLIGHT_STYLES[unknown-token]=underline
    ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=cyan,bold
    ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
    ZSH_HIGHLIGHT_STYLES[global-alias]=fg=green,bold
    ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
    ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold
    ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=green,underline
    ZSH_HIGHLIGHT_STYLES[path]=bold
    ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
    ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
    ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
    ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold
    ZSH_HIGHLIGHT_STYLES[command-substitution]=none
    ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=magenta,bold
    ZSH_HIGHLIGHT_STYLES[process-substitution]=none
    ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=magenta,bold
    ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=green
    ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=green
    ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
    ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=blue,bold
    ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
    ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
    ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=yellow
    ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=magenta
    ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=magenta,bold
    ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=magenta,bold
    ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=magenta,bold
    ZSH_HIGHLIGHT_STYLES[assign]=none
    ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
    ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold
    ZSH_HIGHLIGHT_STYLES[named-fd]=none
    ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
    ZSH_HIGHLIGHT_STYLES[arg0]=fg=cyan
    ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
    ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
    ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=green,bold
    ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=magenta,bold
    ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=yellow,bold
    ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=cyan,bold
    ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout
fi

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    export LS_COLORS="$LS_COLORS:ow=30;44:" # fix ls color for folders with 777 permissions

    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
    alias ip='ip --color=auto'

# Take advantage of $LS_COLORS for completion as well
    zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
    zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

fi

# some more aliases
alias ll="lsd -AlFh"
alias la="lsd -Ah"
alias lr="tree -a"
alias cat="batcat"
alias top="htop"
alias aptup='sudo apt update && sudo apt upgrade'
alias tsup='sudo tailscale up --advertise-routes=10.1.2.0/24,10.1.3.0/24,172.16.50.0/24 --accept-routes'
alias tsdown='sudo tailscale down'
alias tsout='sudo tailscale logout'
alias tsip='tailscale ip'
alias tsstat='tailscale status'
alias tls='tmux ls'
alias gs='git status'
alias ga='git add'
alias gc='git commit' 
alias gpl='git pull'
alias gph='git push'

# alias function - cd to git_projects/argument directory
gpd() {
cd ~/Drop/git_projects/$1
}

# enable auto-suggestions based on the history
if [ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    . ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
    # change suggestion color
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'
fi

# enable zsh-history-substring-search
if [ -f ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh ]; then
    . ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

    bindkey '^[OA' history-substring-search-up
    bindkey '^[OB' history-substring-search-down
fi
# the above keybindings can be derived from terminal prompt - press C-v then up/down arrows

# enable git-prompt
if [ -f ~/.zsh/git-prompt/git-prompt.zsh ]; then
    . ~/.zsh/git-prompt/git-prompt.zsh

# git-prompt settings
    ZSH_GIT_PROMPT_FORCE_BLANK=1
    ZSH_GIT_PROMPT_ENABLE_SECONDARY=1
    ZSH_GIT_PROMPT_SHOW_STASH=1
    ZSH_GIT_PROMPT_SHOW_UPSTREAM="tracking"
# git-prompt theme
    ZSH_THEME_GIT_PROMPT_PREFIX=" · "
    ZSH_THEME_GIT_PROMPT_SUFFIX=""
    ZSH_THEME_GIT_PROMPT_SEPARATOR=" · "
    ZSH_THEME_GIT_PROMPT_BRANCH="⎇  %{$fg_bold[yellow]%}"
    ZSH_THEME_GIT_PROMPT_UPSTREAM_SYMBOL="%{$fg_bold[green]%} "
    ZSH_THEME_GIT_PROMPT_UPSTREAM_NO_TRACKING="%{$fg_bold[red]%}!"
    ZSH_THEME_GIT_PROMPT_UPSTREAM_PREFIX="%{$fg[red]%}(%{$fg[yellow]%}"
    ZSH_THEME_GIT_PROMPT_UPSTREAM_SUFFIX="%{$fg[red]%})"
    ZSH_THEME_GIT_PROMPT_DETACHED="@%{$fg_no_bold[cyan]%}"
    ZSH_THEME_GIT_PROMPT_BEHIND=" %{$fg_no_bold[red]%}↓"
    ZSH_THEME_GIT_PROMPT_AHEAD=" %{$fg_no_bold[green]%}↑"
    ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%}✖"
    ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}●"
    ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg[red]%}✚"
    ZSH_THEME_GIT_PROMPT_UNTRACKED="…"
    ZSH_THEME_GIT_PROMPT_STASHED="%{$fg[blue]%}⚑"
    ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%} "
    ZSH_THEME_GIT_PROMPT_TAGS_PREFIX=" ·  "
    ZSH_THEME_GIT_PROMPT_SECONDARY_PREFIX=""
    ZSH_THEME_GIT_PROMPT_TAGS_SEPARATOR=", "
    ZSH_THEME_GIT_PROMPT_TAGS_PREFIX="🏷 "
    ZSH_THEME_GIT_PROMPT_TAGS_SUFFIX=""
    ZSH_THEME_GIT_PROMPT_TAG="%{$fg_bold[magenta]%}"
fi

# Static prompt with rprompt execution time and compact git functionality
setopt PROMPT_SUBST

# if ssh into this host then host name is red

if [[ -n $SSH_CLIENT ]]; then
    PROMPT=$'%F{green)}┌─── %B%F{%(#.red.blue)}%n%F{white}'@$'%F{red}%m%b%F{white}\u00b7%f%F{yellow}%D{%a %d}%F{white}\u00b7%F{yellow}%*%{$fg[yellow]%}$(gitprompt)$(gitprompt_secondary)) %F{green)}[%B%F{reset}%(6~.%-1~/…/%4~.%5~)%b%F{green)}]\n└─%(?.\ue602.%F{red}\ue602)%b %F{reset}'
else
PROMPT=$'%F{green)}┌─── %B%F{%(#.red.blue)}%n%F{white}'@$'%F{green)}%m%b%F{white}\u00b7%f%F{yellow}%D{%a %d}%F{white}\u00b7%F{yellow}%*%{$fg[yellow]%}$(gitprompt)$(gitprompt_secondary) %F{green)}[%B%F{reset}%(6~.%-1~/…/%4~.%5~)%b%F{green)}]\n└─%(?.\ue602.%F{red}\ue602)%b %F{reset}'
fi

TMOUT=1
TRAPALRM() {
 # zle reset-prompt
}

# Set RPrompt with execution time
zmodload zsh/datetime

prompt_preexec() {
    prompt_prexec_realtime=${EPOCHREALTIME}
}

prompt_precmd() {
if (( prompt_prexec_realtime )); then
    local -rF elapsed_realtime=$(( EPOCHREALTIME - prompt_prexec_realtime ))
    local -rF s=$(( elapsed_realtime%60 ))
    local -ri elapsed_s=${elapsed_realtime}
    local -ri m=$(( (elapsed_s/60)%60 ))
    local -ri h=$(( elapsed_s/3600 ))
    if (( h > 0 )); then
      printf -v prompt_elapsed_time '%ih%im' ${h} ${m}
    elif (( m > 0 )); then
      printf -v prompt_elapsed_time '%im%is' ${m} ${s}
    elif (( s >= 10 )); then
      printf -v prompt_elapsed_time '%.2fs' ${s} # 12.34s
    elif (( s >= 1 )); then
      printf -v prompt_elapsed_time '%.3fs' ${s} # 1.234s
    else
      printf -v prompt_elapsed_time '%ims' $(( s*1000 ))
    fi
unset prompt_prexec_realtime
   else
# Clear previous result when hitting ENTER with no command to execute
unset prompt_elapsed_time
fi
}

setopt nopromptbang prompt{cr,percent,sp,subst}

autoload -Uz add-zsh-hook
add-zsh-hook preexec prompt_preexec
add-zsh-hook precmd prompt_precmd

RPS1='%F{cyan}${prompt_elapsed_time}%F{none}'

# Need this directory in PATH to install xcp-ng guest-tools on Debian VM
export -U PATH=/sbin${PATH:+:$PATH}

# source Openhab FireMOTD if exists
if [ -f ~/.FireMOTD ]; then
    . ~/.FireMOTD
fi
