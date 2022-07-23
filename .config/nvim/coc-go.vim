" Add missing imports on save
" autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

" https://github.com/fatih/vim-go/issues/1659#issuecomment-360410808
let g:go_gocode_autobuild = 0
