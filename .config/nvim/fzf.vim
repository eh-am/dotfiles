" search tools
nnoremap <C-P> :Files<CR>
nnoremap <C-f> :Rg<CR>

" open preview window
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
