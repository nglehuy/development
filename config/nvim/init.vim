if !exists("g:vscode")
  set runtimepath^=$HOME/.vim runtimepath+=$HOME/.vim/after
  let &packpath = &runtimepath
  " let g:python3_host_prog = $HOME+'/miniconda3/bin/python'
  source $HOME/.vimrc
endif
