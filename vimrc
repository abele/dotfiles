" Load bundle configurations
source ~/.vim/bundles.vim

" ======= Colorscheme ======
set background=dark
syntax enable

" Add matcher style so it is not rewriten by color scheme
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
colorscheme solarized

set t_ti= t_te=

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

" ========= Navigation ======
" Map ,e and ,v to open files in the same directory as the current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

" Show files
map <leader>f :CtrlP<CR>
" Show buffers
map <leader>b :CtrlPBuffer<CR>
" Show tags
map <leader>t :CtrlPTag<CR>

map <leader>ga :CtrlP */tests/<CR>

" Ignore verstion control artifacts
let g:ctrlp_custom_ignore = {
\ 'dir': '\.git$\|\.hg$\|\.svn$\|\.egg$\|\.egg-info$\|env$\|\.tox$\|\.ropeproject$\|data$',
\ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$\|\.png$\|\.jpg$\|\.tags$\|tags$',
\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
\ }

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

" Show long lists in omnicompletion
set completeopt=menuone,menu,longest

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
    autocmd FileType python setlocal softtabstop=4 tabstop=4 shiftwidth=4 expandtab

    let g:pymode_doc = 0
    let g:pymode_run = 0

    let g:pymode_lint = 1
    let g:pymode_lint_ignore = ""

    let g:pymode_folding = 0
    let g:pymode_paths = ['./env']

    " Key for set/unset breakpoint
    let g:pymode_breakpoint_key = '<leader>sb'

    " Load rope plugin
    let g:pymode_rope = 1
    " Auto create and open ropeproject
    let g:pymode_rope_vim_completion = 1
    let g:pymode_rope_auto_project = 1
    let g:pymode_rope_sorted_completions = 1
    let g:pymode_rope_extended_complete = 1
    let g:pymode_rope_autoimport_modules = ["os","shutil","datetime"]

    " Auto fix vim python paths if virtualenv enabled
    let g:pymode_virtualenv = 1

    autocmd FileType python " Mark text width
augroup END

" Use sparkup for other types
augroup javascript_config
    " Remove ALL autocommands of the current group.
    autocmd!
    autocmd FileType javascript set relativenumber
augroup END

" Use sparkup for other types
augroup sparkup_types
    " Remove ALL autocommands of the current group.
    autocmd!
    " Add sparkup to new filetypes
    autocmd FileType mako,htmldjango runtime! ftplugin/html/sparkup.vim

    " Show line numbers relative to current position
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

" Show line numbers relative to current position
set relativenumber

hi GreenBar term=reverse ctermfg=white ctermbg=green guifg=white guibg=green
hi RedBar   term=reverse ctermfg=white ctermbg=red guifg=white guibg=red

" Output colorfull message in vim cmd bar
function! s:Bar(type, msg)
    if a:type == "red"
        echohl RedBar
    else
        echohl GreenBar
    endif
    echon a:msg repeat(" ", &columns - strlen(a:msg) - 1)
    echohl None
endfunction

let g:fe_command = "make test"

function! RunFancyTests()
    let test_command = g:fe_command
    let results = system(test_command)

    let exit_code = split(results, '\n')
    echo results

    if v:shell_error
        call s:Bar("red", 'Error! '.exit_code[-1])
    else
        call s:Bar("green", 'OK! '.exit_code[-1])
    endif
endfunction

function! ShowReward()
    if v:shell_error
        call s:Bar("red", 'OH NOOO!')
    else
        call s:Bar("green", 'OK!')
    endif
endfunction
command! ShowReward call ShowReward()

command! RunFancyTests call RunFancyTests()
map ,a :wa\|:RunFancyTests<CR>

let g:Powerline_colorscheme="solarized256"

map <silent><F3> :TagbarToggle<CR>
