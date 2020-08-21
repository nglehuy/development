" Vaffle
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

function! OpenVaffle() abort
  if bufname('%') == ''
    call vaffle#init()
  else
    call vaffle#init(expand('%:p'))
  endif
endfunction

nnoremap <leader>v :call OpenVaffle()<CR>

let g:vaffle_show_hidden_files = 1
let g:vaffle_force_delete = 1

map sh <Plug>(vaffle-open-selected-split)
map sv <Plug>(vaffle-open-selected-vsplit)
