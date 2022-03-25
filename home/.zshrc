export PATH=$HOME/bin:/usr/local/bin:$PATH
export RPS1="%{$reset_color%}"
export ZSH="$HOME/.zsh/oh-my-zsh"

source $ZSH/oh-my-zsh.sh

plugins=(
    git
    vi-mode
    zsh-autosuggestions
    zsh-syntax-highlighting
)

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
if ! [ -x "$(command -v brew)" ]; then
    export PATH=$(brew --prefix openvpn)/sbin:$PATH
fi

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

# Android
export ANDROID_SDK="$HOME/Library/Android/sdk"
export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/nlhuy/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/nlhuy/google-cloud-sdk/path.zsh.inc' ]; then . '/home/nlhuy/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/nlhuy/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/nlhuy/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(starship init zsh)"
