if !exists("g:vscode")
  set runtimepath^=~/.vim runtimepath+=~/.vim/after
  let &packpath = &runtimepath
  let g:python3_host_prog = '/opt/homebrew/bin/python3'
  source ~/.vimrc
endif
