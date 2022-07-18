"let g:vimwiki_list = [{'path': '~/projects/vimwiki/',
"                      \ 'syntax': 'markdown', 'ext': '.md', 'auto_tags': 1, 'auto_diary_index': 1, 'auto_generate_tags': 1, 'auto_toc': 1}]

" Inspired by https://github.com/vimwiki/vimwiki/issues/365#issuecomment-313000695
let wiki_default = {}
let wiki_default.auto_export = 0
let wiki_default.auto_toc = 0
let wiki_default.ext = '.md'
let wiki_default.syntax = 'markdown'

let life_wiki = copy(wiki_default)
let g:life_wiki.path = '~/projects/vimwiki/life'
let life_wiki.diary_rel_path = 'diary/'

let work_wiki = copy(wiki_default)
let work_wiki.path = '~/projects/vimwiki/work'
let work_wiki.diary_rel_path = 'diary/'

let g:vimwiki_list = [life_wiki, work_wiki]

""let g:vimwiki_list = [{'path': '~/projects/vimwiki/',
""                      \ 'syntax': 'markdown', 'ext': 'md', 'auto_tags': 1, 'auto_diary_index': 1, 'auto_generate_tags': 1, 'auto_toc': 1}]
let g:vimwiki_global_ext = 0
let g:vimwiki_auto_chdir = 1
" Foldlevel 99 to disable folding
" https://github.com/tools-life/taskwiki/pull/312/files
set foldlevel=99

" Source: https://github.com/tools-life/taskwiki/issues/217
function TaskSearch()
  let line = getline('.')
  let task_id = split(line, "#")[1]
  let task_note = trim(system('task _get  "' . task_id . '".uuid'))
  exe printf("e ./tasks/%s.md", task_note)
endfunction
command! TaskSearch :call TaskSearch()

au BufNewFile ~/projects/vimwiki/life/tasks/*.md :silent 0r !~/projects/vimwiki/templates/task.sh '%'
" For some reason I couldn't concatenate
" so i just hardcoded for now
" but ideally we would use work_wiki.path
au BufNewFile ~/projects/vimwiki/work/tasks/*.md :silent 0r !~/projects/vimwiki/templates/task.sh '%'

au BufNewFile ~/projects/vimwiki/life/diary/*.md :silent 0r !~/projects/vimwiki/templates/diary-life.sh 'life'
au BufNewFile ~/projects/vimwiki/work/diary/*.md :silent 0r !~/projects/vimwiki/templates/diary.sh 'work'
"au BufRead,BufNewFile ~/projects/vimwiki/work/diary/*.md setlocal wrap linebreak textwidth=80

"au BufRead,BufNewFile ~/projects/vimwiki/life/diary/*.md setlocal wrap linebreak textwidth=80
"au BufRead,BufNewFile ~/projects/vimwiki/work/pyroscope/diary/*.md setlocal wrap linebreak textwidth=80



" Don't set a swap file for vimwiki
au BufNew,BufRead ~/projects/vimwiki/** setlocal noswapfile
au BufNew,BufRead ~/projects/vimwiki/** setlocal nospell
