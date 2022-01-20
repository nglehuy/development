let g:vscode_style = "dark"
syntax on
set termguicolors
colorscheme vscode
let g:airline_theme='vscode'
set number
set relativenumber
set showmatch
set showcmd
set noshowmode
set cmdheight=1
set cursorline
set background=dark

" highlight clear CursorLine " Removes the underline causes by enabling cursorline

let g:python_highlight_all = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1

" set default indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set laststatus=2
set splitright
set splitbelow
set fileformat=unix
set encoding=utf-8

" for javascript
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType typescript setlocal tabstop=2 shiftwidth=2 softtabstop=2

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
" hi Normal guibg=NONE ctermbg=NONE
" hi LineNr guibg=NONE ctermbg=NONE

"auto closed tag
let g:closetag_filetypes = 'html,xhtml,phtml,js,jsx,ts,tsx'

" rofi
au BufNewFile,BufRead /*.rasi setf css

" wrap line
set nowrap

autocmd BufEnter * :syntax sync fromstart
autocmd BufLeave * :syntax sync clear
