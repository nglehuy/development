eval "$(starship init zsh)"
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH
export RPS1="%{$reset_color%}"
export ZSH="$HOME/.zsh/oh-my-zsh"

plugins=(
    git
    vi-mode
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# npm
export PATH=~/.npm-global/bin:$PATH

# alias
alias cp='cp -vR'
alias mv='mv -v'
alias rm='rm -R'
alias nvide="nohup env DRI_PRIME=1 neovide --geometry=260x150 > /dev/null 2>&1 & disown"
alias gtree="git log --graph --decorate --oneline --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(auto)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)'"

# (cat ~/.cache/wal/sequences &)

# remove % at the top
unsetopt PROMPT_SP

# maven and java
# export JAVA_HOME=/usr/lib/jvm/default
export JAVA_HOME="$(/usr/libexec/java_home -v11)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# yarn
export PATH="$PATH:$(yarn global bin)"

# Ruby
export PATH="$PATH:$(gem env gempath)"

# openvpn brew
export PATH=$(brew --prefix openvpn)/sbin:$PATH

export TERM=xterm-256color

# Fix snap apps in wayland
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then

    # Fix environment for Wayland + zsh + snapd
    if [ -f "/etc/profile.d/apps-bin-path.sh" ]; then
        source /etc/profile.d/apps-bin-path.sh
    fi

fi

# Golang
export PATH="$PATH:/usr/local/go/bin:$HOME/go/bin"

# Make
export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"

# OpenMP
export CC=/usr/bin/gcc
export CXX=/usr/bin/g++
export CPPFLAGS="$CPPFLAGS -Xpreprocessor -fopenmp"
export CFLAGS="$CFLAGS -I/usr/local/opt/libomp/include"
export CXXFLAGS="$CXXFLAGS -I/usr/local/opt/libomp/include"
export LDFLAGS="$LDFLAGS -Wl,-rpath,/usr/local/opt/libomp/lib -L/usr/local/opt/libomp/lib -lomp"

# Android
export ANDROID_SDK="$HOME/Library/Android/sdk"
export ANDROID_HOME=$ANDROID_SDK
export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/nlhuy/google-cloud-sdk/path.zsh.inc' ]; then . '/home/nlhuy/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/nlhuy/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/nlhuy/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="/usr/local/opt/openjdk@11/bin:$PATH"

export SDKROOT=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX13.1.sdk

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/nlhuy/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/nlhuy/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/nlhuy/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/nlhuy/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

