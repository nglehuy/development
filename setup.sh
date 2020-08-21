#!/usr/bin/env sh

echo "Installing development tools ..."
sudo pacman -Syu --noconfirm --needed gcc clang go ruby git make cmake openssh wget curl fzf \
    p7zip unrar unzip zip unarchiver bzip2 gzip lrzip lz4 lzip lzop xz tar \
    base-devel openssl zlib readline sqlite llvm ncurses xz tk python-pyopenssl libffi \
    python python-pip pyenv \
    vim neovim zsh \
    nodejs yarn npm \
    jdk-openjdk jre-openjdk maven \
    ffmpeg \
    boost swig sox \
    neofetch htop xdotool xclip ctags

go get github.com/mattn/efm-langserver

echo "Installing vim-plug ..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir ~/.swap-files

echo "Setting up yarn ..."
yarn global add spaceship-prompt neovim bash-language-server dockerfile-language-server-nodejs eslint eslint-plugin-vue vls sql-language-server
gem install neovim solargraph

echo "Setting up npm ..."
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'

echo "Setting up pyenv"
eval "$(pyenv init -)"
pyenv install -s 3.7.8
pyenv install -s 2.7.17
pyenv shell 2.7.17 && pip install -U pip neovim flake8 autopep8 pep8 python-language-server
pyenv shell 3.7.8 && pip install -U pip neovim flake8 autopep8 pep8 python-language-server
pyenv global 3.7.8

echo "Setting up zsh ..."
# Oh my zsh
export ZSH="$HOME/.zsh/oh-my-zsh"
[ ! -d "$HOME/.zsh/.oh-my-zsh" ] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
# Zsh auto suggestion
[ ! -d "$HOME/.zsh/zsh-autosuggestions" ] && git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions
# Zsh syntax highlighting
[ ! -d "$HOME/.zsh/zsh-syntax-highlighting" ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.zsh/zsh-syntax-highlighting

echo "Setting up configurations ..."
cp -l -f -T -r $PWD/home $HOME
cp -l -f -T -r $PWD/config $HOME/.config
nvim -E -s -u "$HOME/.vimrc" +PlugInstall +qall

echo "Done installation."
