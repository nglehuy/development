let g:coc_global_extensions = [
            \'coc-tsserver',
            \'coc-eslint',
            \'coc-prettier',
            \'coc-json',
            \'coc-clangd',
            \'coc-python',
            \'coc-cmake',
            \'coc-css',
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
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Format
vmap <leader>f <Plug>(coc-format)
nmap <leader>f <Plug>(coc-format)
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" let g:lsp_cxx_hl_use_text_props = 1
