call plug#begin('~/.vim/plugged')

Plug 'christoomey/vim-tmux-navigator'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'w0rp/ale'
Plug 'elmcast/elm-vim'
Plug 'antew/vim-elm-analyse'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'joshdick/onedark.vim'

Plug 'christoomey/vim-tmux-navigator'

Plug 'embear/vim-localvimrc'
" elixir stuff
Plug 'elixir-editors/vim-elixir'

" Golang
Plug 'buoto/gotests-vim'
" terraform
Plug 'hashivim/vim-terraform'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'tools-life/taskwiki'
Plug 'mattn/calendar-vim'
" Plug 'michal-h21/vimwiki-sync'

Plug 'peitalin/vim-jsx-typescript'

Plug 'tridactyl/vim-tridactyl'

Plug 'blindFS/vim-taskwarrior'
Plug 'vim-airline/vim-airline'

"Plug 'tools-life/knowledge'
Plug 'tbabej/knowledge'
" Plug 'ryanoasis/vim-devicons'
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
"
Plug 'towolf/vim-helm'

Plug 'tpope/vim-surround'
Plug 'jremmen/vim-ripgrep'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'ragon000/vim-pandoc-live-preview', { 'for': ['markdown'] }

" Plug 'rust-lang/rust.vim'

let g:terraform_align=1
let g:terraform_fmt_on_save=1

" Ask before sourcing any local vimrc file.
" In a vim session the question is only asked once as long as the local vimrc file has not been changed.
let g:localvimrc_ask=0


" https://vi.stackexchange.com/questions/13080/setting-tab-to-2-spaces
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2


" display spaces as .
"set lcs+=space:·
set list

" https://vi.stackexchange.com/a/7666
" dont think its needed after nerdtree
" :set autochdir

filetype plugin on
set omnifunc=syntaxcomplete#Complete

set ignorecase

" Open nerdtree
map <C-n> :NERDTreeToggle<CR>
set encoding=utf8

" COC configurations
let g:coc_global_extensions = [
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-go',
  \ 'coc-angular',
  \ 'coc-prettier',
  \ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif


""""" COC configs from readme
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"""end COC configurations


" https://github.com/joshdick/onedark.vim
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" onedark.vim override: Don't set a background color when running in a terminal;
" just use the terminal's background color
" `gui` is the hex color code used in GUI mode/nvim true-color mode
" `cterm` is the color code used in 256-color mode
" `cterm16` is the color code used in 16-color mode
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif


let g:rustfmt_autosave = 1

" https://jeffkreeftmeijer.com/vim-number/
" set relativenumber
set number
" set number relativenumber

" " Copy to clipboard
vnoremap  <leader>y  "+y

" open split files on the right
set splitright

" golang
" https://github.com/fatih/vim-go/pull/2113#issuecomment-451690172
let g:go_gometalinter_enable=['staticcheck']


" vimwiki
let g:vimwiki_list = [{'path': '~/projects/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md', 'auto_tags': 1, 'auto_diary_index': 1, 'auto_generate_tags': 1, 'auto_toc': 1}]
let g:vimwiki_global_ext = 0
let g:vimwiki_auto_chdir = 1

" generate diary links when it's open
" https://mkaz.blog/working-with-vim/vimwiki/
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
augroup end


" disable swap file since most of the time it's a pain
" https://old.reddit.com/r/vim/comments/7uac23/are_swap_files_necessary/
set noswapfile
set autoread
autocmd! FocusGained,BufEnter * checktime

" tools-life/knowledge stuff
"augroup MyRubyCode
"" Files with extension .rb are processed as Ruby code
"    automcd!
"    autocmd BufReadPre,FileReadPre *.vimwiki set ft=vimwiki
"augroup END
let g:knowledge_srs_provider = "Anki"
let g:knowledge_data_dir = "/home/eduardo/.local/share/Anki2/eduardo/collection.anki2"
let g:knowledge_dir = "/home/eduardo/projects/vimwiki/Anki"


au BufNewFile ~/projects/vimwiki/diary/*.md :silent 0r !~/projects/vimwiki/diary/template.sh '%'
au BufRead,BufNewFile ~/projects/vimwiki/diary/*.md setlocal textwidth=80

" https://github.com/iamcco/markdown-preview.nvim/pull/9#issuecomment-479782224
" so that i can access from my other machines
let g:mkdp_open_to_the_world = 1
let g:mkdp_port = 8888
let g:mkdp_echo_preview_url = 1
let g:mkdp_open_ip = system('hostname')

" https://github.com/ragon000/vim-pandoc-live-preview/#pandoc-arguments
let g:livepreview_arguments = " -t beamer "
let g:livepreview_previewer = "mupdf"

" ruler
set colorcolumn=80,100,120

" Initialize plugin system
call plug#end()

syntax on
colorscheme onedark

set guifont=DroidSansMono\ Nerd\ Font\ 11
