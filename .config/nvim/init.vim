call plug#begin('~/.vim/plugged')

Plug 'RyanMillerC/better-vim-tmux-resizer'
Plug 'christoomey/vim-tmux-navigator'

let g:coc_global_extensions = [
\ 'coc-eslint',
\ 'coc-go',
\ 'coc-html',
\ 'coc-json',
\ 'coc-pairs',
\ 'coc-prettier',
\ 'coc-snippets',
\ 'coc-tsserver'
\ ]

Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install() }}

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'embear/vim-localvimrc'

" Golang
Plug 'buoto/gotests-vim'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Vimwiki and friends
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
" Plug 'tools-life/taskwiki'
Plug 'eh-am/taskwiki', { 'branch': 'call-TaskSearch-when-hitting-return' }
Plug 'mattn/calendar-vim'
" Plug 'tbabej/knowledge'
Plug 'junegunn/goyo.vim' "distraction free writing

" Plug 'vim-airline/vim-airline'

Plug 'towolf/vim-helm'

Plug 'tpope/vim-surround'

" Theme
Plug 'joshdick/onedark.vim'

" Languages, filetypes etc
Plug 'tridactyl/vim-tridactyl'
" Typescript, jsx and friends
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'tsandall/vim-rego'
Plug 'google/vim-jsonnet'

" Use gcc  or gc (visual mode) to comment
Plug 'tpope/vim-commentary'

" Detect vim startup time
Plug 'dstein64/vim-startuptime'

" Git stuff
" Plug 'APZelos/blamer.nvim' " :BlameToggle
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter' " Show git diff

" Movement
Plug 'unblevable/quick-scope'

Plug 'pearofducks/ansible-vim'

call plug#end()


" General config
filetype plugin on

" https://vi.stackexchange.com/questions/13080/setting-tab-to-2-spaces
" On pressing tab, insert 2 spaces
set expandtab

set tabstop=2 " show existing tab with 2 spaces width
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2

" display spaces as .
"set lcs+=space:·
set list
set number
set encoding=utf8
" ruler
set colorcolumn=80,100,120

set ignorecase
" " Copy to clipboard
vnoremap  <leader>y  "+y

" Ask before sourcing any local vimrc file.
" In a vim session the question is only asked once as long as the local vimrc file has not been changed.
let g:localvimrc_ask=0


" https://vim.fandom.com/wiki/Search_for_visually_selected_text
" search with // what's selected
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" https://www.adamalbrecht.com/blog/2019/10/21/spell-check-in-vim-for-markdown-and-git-commit-messages/
" Spell-check Markdown files and Git Commit Messages
" z= to show corrections
" zg to add word to vocabulary
autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell
" Enable dictionary auto-completion in Markdown files and Git Commit Messages
autocmd FileType markdown setlocal complete+=kspell
autocmd FileType gitcommit setlocal complete+=kspell

source ~/.config/nvim/coc.vim
source ~/.config/nvim/theme.vim
source ~/.config/nvim/vimwiki.vim
source ~/.config/nvim/nerdtree.vim
source ~/.config/nvim/fzf.vim
source ~/.config/nvim/coc-go.vim

" scroll in docs
" https://github.com/neoclide/coc.nvim/issues/1405#issuecomment-567841711
set mouse=a
