# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.zsh/oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="bira"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=()

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

## Blur {{{
#if [[ $(ps --no-header -p $PPID -o comm) =~ '^yakuake|kitty|alacritty$' ]]; then
#        for wid in $(xdotool search --pid $PPID); do
#            xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $wid; done
#fi
## }}}

# npm
export PATH=~/.npm-global/bin:$PATH

# config spaceship
SPACESHIP_PROMPT_ADD_NEWLINE=false
# SPACESHIP_CHAR_SYMBOL="  "
# SPACESHIP_CHAR_SYMBOL="  "
# SPACESHIP_CHAR_SYMBOL="  "
# SPACESHIP_CHAR_SYMBOL="  "
# SPACESHIP_CHAR_SYMBOL="  "
# SPACESHIP_CHAR_SYMBOL="  "
SPACESHIP_CHAR_SYMBOL="~>"
SPACESHIP_USER_SHOW="always"
SPACESHIP_TIME_SHOW="true"
SPACESHIP_DIR_TRUNC=0
SPACESHIP_DIR_TRUNC_REPO=false
#SPACESHIP_PYENV_SYMBOL="pyenv "
SPACESHIP_PROMPT_SEPARATE_LINE=true
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_PROMPT_ORDER=(
    user        # Username section
    dir         # Current directory section
    host        # Hostname section
    git         # Git section (git_branch + git_status)
    hg          # Mercurial section (hg_branch  + hg_status)
    package     # Package version
    node        # Node.js section
    ruby        # Ruby section
    elixir      # Elixir section
    xcode       # Xcode section
    swift       # Swift section
    golang      # Go section
    php         # PHP section
    rust        # Rust section
    haskell     # Haskell Stack section
    julia       # Julia section
    docker      # Docker section
    aws         # Amazon Web Services section
    venv        # virtualenv section
    conda       # conda virtualenv section
    pyenv       # Pyenv section
    dotnet      # .NET section
    ember       # Ember.js section
    kubecontext # Kubectl context section
    terraform   # Terraform workspace section
    exec_time   # Execution time
    line_sep    # Line break
    #battery     # Battery level and status
    vi_mode   # Vi-mode indicator
    jobs      # Background jobs indicator
    exit_code # Exit code section
    char      # Prompt character
)
SPACESHIP_RPROMPT_ORDER=(
    time
)

# alias
alias cp='cp -vR'
alias mv='mv -v'
alias rm='rm -vR'
alias nvide="nohup env DRI_PRIME=1 neovide --geometry=260x150 > /dev/null 2>&1 & disown"
alias gtree="git log --graph --decorate --oneline"

# variables
export HOMESERVER="nlhuy@27.74.114.227"

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

# BLUR BACKGROUND

# remove % at the top
unsetopt PROMPT_SP

# maven and java
export JAVA_HOME=/usr/lib/jvm/default

# pyenv
# export PATH="$HOME/.pyenv/bin:$PATH"
# eval "$(pyenv init -)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# yarn
export PATH="$PATH:$(yarn global bin)"

# Ruby
export PATH="$PATH:$(gem env gempath)"

# Set Spaceship ZSH as a prompt
fpath=($fpath "$HOME/.zfunctions")
autoload -U promptinit
promptinit
prompt spaceship

# if [[ $DISPLAY ]]; then
#     # If not running interactively, do not do anything
#     [[ $- != *i* ]] && return
#     [[ -z "$TMUX" ]] && exec tmux
# fi

export TERM=xterm-256color

# Fix snap apps in wayland
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then

    # Fix environment for Wayland + zsh + snapd
    if [ -f "/etc/profile.d/apps-bin-path.sh" ]; then
        source /etc/profile.d/apps-bin-path.sh
    fi

fi

# Golang
export PATH="$PATH:$HOME/go/bin"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/nlhuy/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/nlhuy/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/nlhuy/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/nlhuy/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
