if !exists("g:vscode")
  set runtimepath^=$HOME/.vim runtimepath+=$HOME/.vim/after
  let &packpath = &runtimepath
  let g:python3_host_prog = '/opt/homebrew/bin/python3'
  source $HOME/.vimrc
endif
