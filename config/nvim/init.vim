if !exists("g:vscode")
  set runtimepath^=~/.vim runtimepath+=~/.vim/after
  let &packpath = &runtimepath
  let g:python3_host_prog = $HOME.'/miniconda3/bin/python'
  source ~/.vimrc
endif
