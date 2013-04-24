" vim: foldmethod=marker
" Load bundle configurations
source ~/.vim/bundles.vim

" ======= Colorscheme ====== {{{1
set background=dark
syntax enable

" Add matcher style so it is not rewriten by color scheme
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

colorscheme xoria256

" Highlight current line without underline
hi CursorLine term=bold cterm=bold 

set t_ti= t_te=

" ======= Convenience ====== {{{1
" Use comma as Leader key
let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :edit $MYVIMRC<CR>
if has("autocmd")
    autocmd! bufwritepost $MYVIMRC source $MYVIMRC
endif

" Call help for word under cursor in vim files
autocmd FileType vim nnoremap K :exe ":help ".expand("<cword>")<CR>

" Toggle paste indention
set pastetoggle=<F2>

" YankRing settings
let g:yankring_history_file = '.yankring-history'
nnoremap ,yr :YRShow<CR>
nnoremap <C-y> :YRShow<CR>

" Show current line
set cursorline

" Show typed in command
set showcmd
set cmdheight=2

" Allways show statusline
set laststatus=2

" Show mode what you're in
set showmode

" Make tab completion for files/buffers act like bash
set wildmenu

" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=5
set winminheight=5
set winheight=999

" Always show tab bar
set showtabline=2

" Window width
set winwidth=79

" ==========  Search ========= {{{1

set hlsearch
set incsearch

" Remove higlighting by pressing enter
function! MapCR()
    nnoremap <silent> <CR> :nohlsearch<CR>
endfunction
call MapCR()

" Leave the return key alone when in command line windows, since it's used
" to run commands there.
autocmd! CmdwinEnter * :unmap <cr>
autocmd! CmdwinLeave * :call MapCR()

set ignorecase
set smartcase
set showmatch

" =========== Editing ======== {{{1

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" ========= Navigation ====== {{{1
map <leader>f :CtrlP<CR>
map <leader>b :CtrlPBuffer<CR>
map <leader>t :CtrlPTag<CR>

" Ignore verstion control artifacts
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn|egg|egg-info|tox)$|env$|dist$|data$',
            \ 'file': '\v\.(exe|so|dll|pyc|png|jpg|tags|o)$|tags$',
            \ 'link': 'some_bad_symbolic_links',
            \ }

let g:ctrlp_root_markers = ['Guardfile']

" No cursor keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Allow backgrounding buffers without writing them, and remember marks/undo
" for backgrounding buffers
set hidden

" Navigate back and forth buffers
map <silent> <leader>z :bp<CR>
map <silent> <leader>x :bn<CR>

" ========= Programming =========== {{{1
" Some file types should wrap their text
function! s:setupWrapping()
    set wrap
    set linebreak
    set textwidth=79
    set formatoptions=cq
    set wrapmargin=0
    set nolist
endfunction

" Don't mess up HTML syntax highlighting
let html_no_rendering = 1

" Make sure all markdown files have the correct file type set and setup wrapping
autocmd BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown | call s:setupWrapping()

" Highlight bad whitespace
autocmd BufRead,BufNewFile * match ExtraWhitespace /\s\+$\| \+\ze\t/

" Find and remove all trailing whitespace.
nnoremap <leader>rw :%s/\s\+$//<cr>:let @/=''<CR>

" Use hash to comment *.cfg and *.ini files
autocmd FileType dosini set commentstring=#\ %s

" for ruby, auto indent with two spaces, always expand tabs
autocmd FileType ruby,haml,eruby,yaml,html,htmldjango,mako,javascript,sass,cucumber set ai sw=2 sts=2 et

" Use spell-check for commit messages
autocmd FileType gitcommit set spell

" Show long lists in omni completion
set completeopt=menuone,menu,longest

" Set mako file type
autocmd BufRead,BufNewFile *.mak set filetype=mako

" Treat JSON files like JavaScript
autocmd BufNewFile,BufRead *.json set filetype=javascript

augroup python_configs
    " Remove ALL autocommands of the current group.
    autocmd!
    " Add  to new filetypes
    autocmd FileType python set textwidth=79 colorcolumn=+1
    " make Python follow PEP8 for whitespace (
    "     http://www.python.org/dev/peps/pep-0008/ )
    autocmd FileType python setlocal softtabstop=4 tabstop=4 shiftwidth=4 expandtab

    let g:pymode_doc = 0
    let g:pymode_run = 0

    let g:pymode_lint = 1
    let g:pymode_lint_ignore = ""
    let g:pymode_lint_cwindow = 0

    let g:pymode_folding = 0
    let g:pymode_paths = ['./env', './venv']

    " Key for set/unset breakpoint
    let g:pymode_breakpoint_key = '<leader>sb'

    " Load rope plugin
    let g:pymode_rope = 1
    " Auto create and open ropeproject
    let g:pymode_rope_vim_completion = 0
    let g:pymode_rope_auto_project = 1
    let g:pymode_rope_autoimport_modules = ["os", "shutil", "datetime"]

    " Auto fix vim python paths if virtualenv enabled
    let g:pymode_virtualenv = 1

    " Use pep8-indent plug-in
    let g:pymode_indent = 0

    autocmd FileType python " Mark text width
augroup END

augroup javascript_config
    " Remove ALL autocommands of the current group.
    autocmd!
    autocmd FileType javascript set relativenumber
augroup END
" ========== Backup ================ {{{1

" do not keep a backup file, use versions instead
set nobackup
set noswapfile

" ========== MISC ================ {{{1
" Persist folds
autocmd BufWinLeave * silent! mkview
autocmd BufWinEnter * silent! loadview

" Mark text width
set textwidth=79
set colorcolumn=+1

" Show line numbers relative to current position
set relativenumber

map <silent><F3> :TagbarToggle<CR>

let g:user_zen_leader_key = '<c-e>'

" Search online documentation for word under cursor
function! OnlineDoc()
    echo &ft
    if &ft =~ "python"
        let s:urlTemplate = "\"http://docs.python.org/2/search.html?q=%&check_keywords=yes&area=default\""
    endif
    let s:browser = "chromium"
    let s:wordUnderCursor = expand("<cword>")
    let s:url = substitute(s:urlTemplate, "%", s:wordUnderCursor, "g")
    let s:cmd = "!" . s:browser . " " . s:url
    execute s:cmd
endfunction

" Online doc search.
map ,od :call OnlineDoc()<CR>
