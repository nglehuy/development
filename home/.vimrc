set mouse=a
set nocompatible              " be iMproved, required
set autoread
set hidden
filetype off                  " required

call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'

" Nerdtree
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons'

" Brings physics-based smooth scrolling to the Vim/Neovim world!
Plug 'yuttie/comfortable-motion.vim'

" Insert or delete brackets, parens, quotes in pair.
Plug 'jiangmiao/auto-pairs'

" Show difference in code by using a sign column
Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'

" For indentation
Plug 'Yggdroot/indentLine'

" Vim auto closed tag
Plug 'alvan/vim-closetag'

" Vaffle
" Plug 'cocopon/vaffle.vim'

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" COC 
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'vim-python/python-syntax'

" OPERATOR TO SURROUND A TEXT OBJECT
Plug 'kana/vim-operator-user'
Plug 'rhysd/vim-operator-surround'

" MARKDOWN PREVIEW FOR (NEO)VIM
Plug 'iamcco/markdown-preview.nvim'

" Csv file
Plug 'chrisbra/csv.vim'

" fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Comment
Plug 'tomtom/tcomment_vim'

" Themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasiser/vim-code-dark'

Plug 'tranvansang/octave.vim'
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

Plug 'puremourning/vimspector'

" All of your Plugins must be added before the following line
call plug#end()

filetype plugin indent on    " required
syntax on

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

set switchbuf=useopen,usetab

let g:typescript_indent_disable = 1

source $HOME/.config/nvim/theme.vim

" source $HOME/.config/nvim/vaffle.vim

source $HOME/.config/nvim/nerdtree.vim

" source $HOME/.config/nvim/coc.vim

source $HOME/.config/nvim/denite.vim

source $HOME/.config/nvim/treesitter.vim
