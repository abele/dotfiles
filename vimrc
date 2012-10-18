" Load bundle configurations
source ~/.vim/bundles.vim

" ======= Colorscheme ======
set background=dark
syntax enable

" Add matcher style so it is not rewriten by color scheme
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
colorscheme solarized

" ======= Convenience ======

" Use comma as Leader key
let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :edit $MYVIMRC<CR>
nmap <silent> <leader>sv :source $MYVIMRC<CR>:echo $MYVIMRC." reloaded!"<CR>

" Call help for word under cursor in vim files
autocmd FileType vim nnoremap K :exe ":help ".expand("<cword>")<CR>

" Toggle paste indention
set pastetoggle=<F2>

" Yank to system clipboard
map <leader>y "*y

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

" Don't show scroll bars in the GUI
set guioptions-=L
set guioptions-=r

" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=5
set winminheight=5
set winheight=999

" Always show tab bar
set showtabline=2

" Window width
set winwidth=80

" ==========  Search =========

" Higlight searches
set hlsearch

" Show matches incrementaly
set incsearch

function! MapCR()
    nnoremap <silent> <CR> :nohlsearch<CR>
endfunction
call MapCR()

" Leave the return key alone when in command line windows, since it's used
" to run commands there.
autocmd! CmdwinEnter * :unmap <cr>
autocmd! CmdwinLeave * :call MapCR()

" Search case insensitive
set ignorecase
set smartcase

" Show matching bracet
set showmatch

" =========== Editing ========

" Use spaces for tabs
set expandtab
" Count of spaces in tabs
set tabstop=4
" Number of spaces for each step in (auto)indent
set shiftwidth=4
set softtabstop=4

" Use tab to match bracket pair.
nnoremap <tab> %
vnoremap <tab> %


" ========= Navigation ======

" Show files
map <leader>f :CtrlP<CR>
" Show buffers
map <leader>b :CtrlPBuffer<CR>
" Show tags
map <leader>t :CtrlPTag<CR>

" Ignore verstion control artifacts
let g:ctrlp_custom_ignore = {
\ 'dir': '\.git$\|\.hg$\|\.svn$\|\.egg$\|\.egg-info$\|env$\|\.tox$\|\.ropeproject$\|data$',
\ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$\|\.png$\|\.jpg$\|\.tags$\|tags$',
\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
\ }

" Show line numbers relative to current position
set relativenumber

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

map <silent> <leader>z :bp<CR>
map <silent> <leader>x :bn<CR>

" ========= Programming ===========

" Some file types should wrap their text
function! s:setupWrapping()
    set wrap
    set linebreak
    set textwidth=80
    set formatoptions=cq
    set wrapmargin=0
    set nolist
endfunction

" Make sure all mardown files have the correct filetype set and setup wrapping
autocmd BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown | call s:setupWrapping()

" Highlight bad whitespace
autocmd BufRead,BufNewFile * match ExtraWhitespace /\s\+$\| \+\ze\t/

" Find and remove all trailing whitespaces.
nnoremap <leader>fw :%s/\s\+$//<cr>:let @/=''<CR>

" Use hash to comment *.cfg and *.ini files
autocmd FileType dosini set commentstring=#\ %s

"for ruby, autoindent with two spaces, always expand tabs
autocmd FileType ruby,haml,eruby,yaml,html,htmldjango,mako,javascript,sass,cucumber set ai sw=2 sts=2 et

" Call onmicomplete using ,,
inoremap <leader>, <C-x><C-o>

" Set mako filetype
autocmd BufRead,BufNewFile *.mak set filetype=mako

" Treat JSON files like JavaScript
autocmd BufNewFile,BufRead *.json set filetype=javascript

augroup python_configs
    " Remove ALL autocommands of the current group.
    autocmd!
    " Add  to new filetypes
    autocmd FileType python set textwidth=80 colorcolumn=+1
    " make Python follow PEP8 for whitespace (
    "     http://www.python.org/dev/peps/pep-0008/ )
    autocmd FileType python setlocal softtabstop=4 tabstop=4 shiftwidth=4

    " GRB: Python settings
    autocmd FileType python set sw=4 sts=4 et

    autocmd FileType python map <silent> K :call ShowPyDoc(expand("<cword>"), 1)<CR>
    autocmd FileType python map <buffer> <leader>w :call Flake8()<CR>

    autocmd FileType python " Mark text width

    " Autocomplete python methods
    " autocmd FileType python set omnifunc=pythoncomplete#Complete

    " Disable python folding
    let g:pymode_folding = 0

    " Key for set/unset breakpoint
    let g:pymode_breakpoint_key = '<leader>sb'

    " Do not ignore PEP8 rules
    let g:pymode_lint_ignore = ""

    " Do not load run code plugin
    let g:pymode_run = 0
augroup END


" Use sparkup for other types
augroup sparkup_types
    " Remove ALL autocommands of the current group.
    autocmd!
    " Add sparkup to new filetypes
    autocmd FileType mako,htmldjango runtime! ftplugin/html/sparkup.vim
augroup END
" ========== Backup ================

" Store temporary files in a central spot
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp

if has("vms")
    set nobackup      " do not keep a backup file, use versions instead
else
    set backup      " keep a backup file
endif

" Persist folds
autocmd BufWinLeave * silent! mkview
autocmd BufWinEnter * silent! loadview

" Mark text width
set textwidth=80
set colorcolumn=+1

" When forgot to use sudo
cmap w!! w !sudo tee % >/dev/null
