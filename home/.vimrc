set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')
" Syntax
Plug 'vim-python/python-syntax'

" Brings physics-based smooth scrolling to the Vim/Neovim world!
Plug 'yuttie/comfortable-motion.vim'

" Insert or delete brackets, parens, quotes in pair.
Plug 'jiangmiao/auto-pairs'

" Show difference in code by using a sign column
Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'

" For indentation
Plug 'Yggdroot/indentLine'

" Rainbow
Plug 'luochen1990/rainbow'

" Vim auto closed tag
Plug 'alvan/vim-closetag'

" Vaffle
Plug 'cocopon/vaffle.vim'

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" COC 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'

" OPERATOR TO SURROUND A TEXT OBJECT
Plug 'kana/vim-operator-user'
Plug 'rhysd/vim-operator-surround'

" MARKDOWN PREVIEW FOR (NEO)VIM
Plug 'iamcco/markdown-preview.nvim'

" Csv file
Plug 'chrisbra/csv.vim'

" fuzzy finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Icons
Plug 'ryanoasis/vim-devicons'

" Comment
Plug 'tomtom/tcomment_vim'

" Themes
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tranvansang/octave.vim'
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }

" All of your Plugins must be added before the following line
call plug#end()

filetype plugin indent on    " required

" mapping
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <silent> <Leader>+ :exe "vertical resize " . (winwidth(0) * 6/5)<CR>
nnoremap <silent> <Leader>- :exe "vertical resize " . (winwidth(0) * 5/6)<CR>

" swap
set swapfile
set dir=~/.swap-files

" markdown
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
let g:vim_markdown_math = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1
let g:vim_markdown_conceal_code_blocks = 0

set shell=/usr/bin/zsh

" operator mappings
map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)
map <silent>sr <Plug>(operator-surround-replace)

source $HOME/.config/nvim/neovide.vim

source $HOME/.config/nvim/theme.vim

source $HOME/.config/nvim/vaffle.vim

source $HOME/.config/nvim/coc.vim

source $HOME/.config/nvim/denite.vim
