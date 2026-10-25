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
# export PROMPT_COMMAND="echo"
# precmd() {
#     eval "$PROMPT_COMMAND"
# }
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
export JAVA_HOME="$(/usr/libexec/java_home -v21)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

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
export CPPFLAGS="-fPIC $CFLAGS"

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

# miniconda
eval "$(conda "shell.$(basename "${SHELL}")" hook)"

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

# Fortify
export PATH="/Applications/Fortify/OpenText_Application_Security_Tools_25.2.0/bin:$PATH"
export PATH="/Applications/Fortify/OpenText_SAST_Fortify_25.2.0/bin:$PATH"

# Functions
cpproj () {
    local src="$1" dst="$2"
    if [[ ! -d "$src" ]]; then
        echo "Source $src is not a directory"
        return 1
    fi
    mkdir -p "$dst"
    COPYFILE_DISABLE=1 rsync -ah --info=progress2 \
        --exclude='node_modules*' \
        --exclude='**/node_modules*' \
        --exclude='venv*' \
        --exclude='**/venv*' \
        --exclude='.venv*' \
        --exclude='**/.venv*' \
        --exclude='._*' \
        --exclude='.DS_Store' \
        "$@" \
        "$src" "$dst"
}

git_reset_mode() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        echo "Resetting file modes in git repository..."
        patch=$(git diff -p -R --no-color | grep -E "^(diff|(old|new) mode)")
        if [ -n "$patch" ]; then
            echo "$patch" | git apply
        else
            echo "no filemode changes to revert"
        fi
    else
        echo "not a git repo"
    fi
}

urlencode() {
    echo "$1" | python3 -c "import sys; from urllib.parse import quote_plus; print(quote_plus(sys.stdin.read().strip()))"
}

# Check out the default branch and pull it for each git repo directly inside a folder.
# Usage: git_pull_all [folder]   (default: current folder)
git_pull_all() {
    local root="${1:-.}" dir branch
    for dir in "$root"/*(N/); do
        [[ -e "$dir/.git" ]] || continue
        echo
        echo "==> ${dir:t}"
        if [[ -n "$(git -C "$dir" status --porcelain --untracked-files=no)" ]]; then
            echo "skip: uncommitted changes"
            continue
        fi
        branch=$(git -C "$dir" symbolic-ref --short refs/remotes/origin/HEAD 2>/dev/null)
        if [[ -z "$branch" ]]; then
            git -C "$dir" remote set-head origin --auto >/dev/null 2>&1
            branch=$(git -C "$dir" symbolic-ref --short refs/remotes/origin/HEAD 2>/dev/null)
        fi
        if [[ -z "$branch" ]]; then
            echo "skip: no default branch found on origin"
            continue
        fi
        branch=${branch#origin/}
        git -C "$dir" checkout "$branch" &&
            git -C "$dir" branch -q --set-upstream-to="origin/$branch" &&
            git -C "$dir" pull --ff-only
        echo
    done
}

# Close everything that uses a drive, then eject it.
# Apps get a normal quit, shells get SIGHUP, other processes get SIGTERM.
# Usage: ejd /Volumes/Name
ejd() {
    local vol="${1%/}" pid name ans i
    local -a gui skip apps shells others targets left
    if [[ "$OSTYPE" != darwin* ]]; then
        echo "ejd works only on macOS. Skipped."
        return 1
    fi
    if [[ "$vol" != /Volumes/?* ]] || ! mount | grep -qF " on $vol ("; then
        echo "Usage: ejd /Volumes/Name (a mounted drive)"
        return 1
    fi
    # Leave the drive so this shell does not hold it.
    [[ "$PWD" == "$vol" || "$PWD" == "$vol"/* ]] && cd ~

    gui=(${(s:, :)"$(osascript -e 'tell application "System Events" to get unix id of every process whose background only is false' 2>/dev/null)"})
    if (( ! $#gui )); then
        echo "Allow your terminal to control System Events in System Settings > Privacy & Security > Automation."
        return 1
    fi

    # Never close this shell or the processes that run it.
    pid=$$
    while (( pid > 1 )); do
        skip+=$pid
        pid=${$(ps -o ppid= -p $pid)// /}
    done

    for pid in ${(fu)"$(lsof -t "$vol" 2>/dev/null)"}; do
        name=$(ps -o comm= -p $pid) || continue
        name=${${name##*/}#-}
        if (( $skip[(Ie)$pid] )); then
            echo "Skipped $pid ($name): it runs this terminal. Close it yourself."
        elif [[ "$name" == Finder ]]; then
            continue
        elif (( $gui[(Ie)$pid] )); then
            apps+=$pid
        elif [[ "$name" == (zsh|bash|sh|fish|tcsh|ksh) ]]; then
            shells+=$pid
        else
            others+=$pid
        fi
    done

    targets=($apps $shells $others)
    if (( $#targets )); then
        (( $#apps )) && { echo "Apps (quit normally, so you can save first):"; ps -o pid=,comm= -p ${(j:,:)apps} }
        (( $#shells )) && { echo "Shells (closed like a closed terminal tab):"; ps -o pid=,comm= -p ${(j:,:)shells} }
        (( $#others )) && { echo "Other processes (asked to stop):"; ps -o pid=,comm= -p ${(j:,:)others} }
        read "ans?Close all of them? [y/N] "
        [[ "$ans" == [yY]* ]] || return 1

        for pid in $apps; do
            osascript -e "tell application \"System Events\" to set b to bundle identifier of first process whose unix id is $pid" \
                -e 'tell application id b to quit' >/dev/null
        done
        (( $#shells )) && kill -HUP $shells 2>/dev/null
        (( $#others )) && kill -TERM $others 2>/dev/null

        # Wait up to 5 seconds for them to exit.
        for i in {1..10}; do
            left=()
            for pid in $targets; do
                kill -0 $pid 2>/dev/null && left+=$pid
            done
            (( $#left )) || break
            sleep 0.5
        done

        if (( $#left )); then
            echo "Still running:"
            ps -o pid=,comm= -p ${(j:,:)left}
            read "ans?Force kill them? Unsaved data in them will be lost. [y/N] "
            [[ "$ans" == [yY]* ]] || return 1
            kill -KILL $left 2>/dev/null
            sleep 1
        fi
    fi
    diskutil eject "$vol"
}

# claude
alias claude-pers="CLAUDE_CONFIG_DIR=~/.claude-pers claude"
export CLAUDE_CODE_NO_FLICKER=0

export DYLD_FALLBACK_LIBRARY_PATH=/opt/homebrew/lib:$DYLD_FALLBACK_LIBRARY_PATH

if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi

export UV_NO_CACHE=1
