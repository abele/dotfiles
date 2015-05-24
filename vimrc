source ~/.vim/bundles.vim

let mapleader = " "

set nobackup
set nowritebackup
set noswapfile
set ruler

" Search {
set incsearch
set ignorecase smartcase
set hlsearch
" }

" Switch syntax highlighting on, when the terminal has colors
" " Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

filetype plugin on
augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile *.rst set filetype=rst

  " Enable spellchecking for Markdown, reStructuredText
  autocmd FileType markdown,rst setlocal spell

  " Automatically wrap at 80 characters for Markdown, reStructuredText
  autocmd BufRead,BufNewFile *.md,*.rst setlocal textwidth=80

  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-
augroup END

" CtrlP {
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|venv)$|venv$',
  \ 'file': '\v\.(exe|so|dll|pyc)$',
  \ }
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>t :CtrlPTag<CR>
" Use Git to get files. Much faster and it respects .gitignore rules.
let g:ctrlp_user_command = [
  \ '.git/',
  \ 'git --git-dir=%s/.git ls-files -oc --exclude-standard'
\ ]

let g:ctrlp_cmd = 'CtrlPMixed'
" }

" Keyboard improvements {
nnoremap <Leader>w :w<CR>
" }


" HardMode {
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>
" }


" Numbers {
set number
set numberwidth=5
" }

" Make it obvious where 80 characters is {
set textwidth=81
set colorcolumn=+1
" }
" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Open and edit quick notes
nmap <silent> <leader>N :vsp ~/Grive/quick_notes.txt<CR>
nmap <silent> <leader>R :vsp ~/Grive/random.txt<CR>
nmap <silent> <leader>J :vsp ~/Grive/jurnal.txt<CR>
nmap <silent> <leader>L :vsp ~/Grive/worklog.txt<CR>

nmap <silent> <leader>si :!isort %<CR>

" Ack files for WORD under cursor {
function! AckWordUnderCursor(wordType)
    echo &ft
    let s:wordUnderCursor = expand(a:wordType)
    let s:cmd = ":Ack '" . s:wordUnderCursor . "'"
    execute s:cmd
endfunction

map ,w :call AckWordUnderCursor("<cword>")<CR>
map ,W :call AckWordUnderCursor("<cWORD>")<CR>
" }

map ]l :cn<CR>
map [l :cp<CR>

" Snippets  {
map <leader>pb iimport pytest; pytest.set_trace()
" }

" Autocompletion {
set completeopt=longest,menuone,preview
" }
" Status line {
let g:airline#extensions#tabline#enabled = 1
" }
