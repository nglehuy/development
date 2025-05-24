HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000000
SAVEHIST=1000000
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

export HOMEBREW_NO_AUTO_UPDATE=1

export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH
export PROMPT_COMMAND="echo"
precmd() {
    eval "$PROMPT_COMMAND"
}
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
alias nvide="nohup env DRI_PRIME=1 neovide --geometry=260x150 > /dev/null 2>&1 & disown"
alias gtree="git log --graph --decorate --oneline --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(auto)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)'"
alias syscc="export CC=$(which gcc) CXX=$(which g++)"
alias brewcc="export CC=$(brew --prefix gcc)/bin/gcc-13 CXX=$(brew --prefix gcc)/bin/g++-13"
alias lso="ls -alG | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\" %0o \",k);print}'"

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
[ -s "$NVM_DIR/nvm.sh" ] && echo "Hold onto your hat, 'nvm' loading... It's super slow..." && \. "$NVM_DIR/nvm.sh" && echo "Done loading 'nvm'"  # This loads nvm

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
export PATH="$PATH:$(brew --prefix go)/bin:$HOME/go/bin"

# Make
export PATH=$(brew --prefix make)/libexec/gnubin:$PATH

# GCC/G++
export CC=$(which gcc)
export CXX=$(which g++)
# export CC=$(which clang)
# export CXX=$(which clang++)
# export CC="$(brew --prefix)/bin/gcc-14"
# export CXX="$(brew --prefix)/bin/g++-14"

export LDFLAGS="-L/opt/homebrew/lib -L$(brew --prefix xmlsec1)/lib -L$(brew --prefix libffi)/lib -L$(brew --prefix re2)/lib -L$(brew --prefix pybind11)/lib -L$(brew --prefix abseil)/lib -L$(brew --prefix openssl)/lib"
export CFLAGS="-I/opt/homebrew/include -I$(brew --prefix xmlsec1)/include -I$(brew --prefix libffi)/include -I$(brew --prefix re2)/include -I$(brew --prefix pybind11)/include -I$(brew --prefix abseil)/include -I$(brew --prefix openssl)/include"
export CXXFLAGS="-std=c++17 -fPIC $CFLAGS"
export CPPFLAGS=$CXXFLAGS

# export CPPFLAGS="$CPPFLAGS -Xpreprocessor -fopenmp"
# export CFLAGS="$CFLAGS -I/usr/local/opt/libomp/include"
# export CXXFLAGS="$CXXFLAGS -I/usr/local/opt/libomp/include"
# export LDFLAGS="$LDFLAGS -Wl,-rpath,/usr/local/opt/libomp/lib -L/usr/local/opt/libomp/lib -lomp"
#
export GRPC_PYTHON_BUILD_SYSTEM_OPENSSL=1
export GRPC_PYTHON_BUILD_SYSTEM_ZLIB=1

# Android
export ANDROID_SDK="$HOME/Library/Android/sdk"
export ANDROID_HOME=$ANDROID_SDK
export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"

if [ -f "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc" ]; then source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"; fi
if [ -f "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc" ]; then source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"; fi

# export SDKROOT=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX14.sdk

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$($HOME'/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="$(brew --prefix postgresql@14)/bin:$PATH"
export PATH="$(brew --prefix curl)/bin:$PATH"
export AWS_DEFAULT_REGION="us-west-2"

# init starship, always bottom
eval "$(starship init zsh)"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Created by `pipx` on 2024-12-29 13:16:12
export PATH="$PATH:/Users/nlhuycs/.local/bin"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/nlhuycs/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
