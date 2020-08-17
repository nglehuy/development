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

" Clang Format
Plug 'rhysd/vim-clang-format'

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

" Prettier formatter for javascript
Plug 'prettier/vim-prettier'

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
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'
Plug 'ayu-theme/ayu-vim'

Plug 'tranvansang/octave.vim'

" All of your Plugins must be added before the following line
call plug#end()

filetype plugin indent on    " required

" onedark
let g:onedark_terminal_italics = 1

" start nvim/vim config
let g:neovide_cursor_vfx_mode = "sonicboom"
let g:neovide_no_idle=v:true
let g:neovide_cursor_trail_length=1
" set relativenumber
set number
set showmatch
set showcmd
set noshowmode
set cmdheight=1
set cursorline
highlight clear CursorLine " Removes the underline causes by enabling cursorline
syntax on
let g:python_highlight_all = 1
set background=dark
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1
" end nvim/vim config

set guifont=CaskaydiaCove\ Nerd\ Font\ Mono:h16:b
"start theme config
set termguicolors
let base16colorspace=256  " Access colors present in 256 colorspace
" colorscheme gruvbox
colorscheme onedark
let ayucolor="dark"
" colorscheme ayu
let g:airline_theme='ayu_dark'
let g:gruvbox_contrast_dark='hard'
" end theme config

" start netrw config
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_winsize = 25
" end netrw config

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * nested call LoadSession()
command mksession "mksession Session.vim"
" save session
autocmd VimLeave * if getcwd() != $HOME && getcwd() != $HOME.'/.config/nvim/' | call SaveSession() | endif

function! SaveSession()
    if filereadable("Session.vim")
        echo "Saving ."
        mksession! Session.vim
    else
        echo "No Session."
    endif
endfunction

" load session
" open vaffle only no Session.vim file 
function! LoadSession()
    if getcwd() != $HOME.'/.config/nvim/' && getcwd() != $HOME && filereadable("Session.vim")
      " source local project Session.vim
      source Session.vim
    else
        if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in")
            call OpenVaffle()
        endif
    endif
endfunction

set sessionoptions-=options  " Don't save options

function! RenderMyFavoriteIcon(item)
  return WebDevIconsGetFileTypeSymbol(a:item.basename, a:item.is_dir)
endfunction

let g:vaffle_render_custom_icon = 'RenderMyFavoriteIcon'

" set default indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set laststatus=2
set splitright
set splitbelow
set textwidth=96
set fileformat=unix
set encoding=utf-8

" for javascript
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2

" mapping
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <silent> <Leader>+ :exe "vertical resize " . (winwidth(0) * 6/5)<CR>
nnoremap <silent> <Leader>- :exe "vertical resize " . (winwidth(0) * 5/6)<CR>

set listchars=tab:\|\ 
set list

" Indent line guides
" let g:indentLine_setColors = 0
let g:indentLine_enabled = 1
let g:indentLine_char = '|'
let g:indentLine_setConceal = 0

" Gitgutter
let g:gitgutter_highlight_lines = 0

" Comfortable scroll
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"

" Background
"hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE

" Rainbow
let g:rainbow_active = 1

" Prettier
" single quotes over double quotes
" Prettier default: false
let g:prettier#config#single_quote = 'false'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

"auto closed tag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx'

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

" wrap line
set nowrap

" rofi
au BufNewFile,BufRead /*.rasi setf css

set shell=/usr/bin/zsh

" operator mappings
map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)
map <silent>sr <Plug>(operator-surround-replace)

" Vaffle
function! OpenVaffle() abort
  if bufname('%') == ''
    call vaffle#init()
  else
    call vaffle#init(expand('%:p'))
  endif
endfunction
nnoremap <leader>v :call OpenVaffle()<CR>
let g:vaffle_show_hidden_files = 1
map sh <Plug>(vaffle-open-selected-split)
map sv <Plug>(vaffle-open-selected-vsplit)

" Coc nvim
let g:coc_global_extensions = [
            \'coc-json',
            \'coc-clangd',
            \'coc-python',
            \'coc-cmake',
            \'coc-css',
            \'coc-prettier',
            \'coc-eslint',
            \'coc-flutter',
            \'coc-solargraph',
            \'coc-fzf-preview',
            \'coc-angular',
            \'coc-git',
            \'coc-java',
            \'coc-stylelintplus',
            \'coc-sql',
            \'coc-texlab',
            \'coc-yaml',
            \'coc-vetur',
            \'coc-html',
            \'coc-go']
set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Switch to opened buffer position, including tab
set switchbuf=usetab

let g:lsp_cxx_hl_use_text_props = 1
