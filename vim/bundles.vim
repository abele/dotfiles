set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'


" Define bundles via Github repos
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'wikitopian/hardmode'
Plugin 'tpope/vim-fugitive'
Plugin 'mileszs/ack.vim'
Bundle 'editorconfig/editorconfig-vim'
Plugin 'vim-scripts/ctags.vim'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/tComment'
Plugin 'vim-scripts/vim-gitgutter'

Plugin 'terryma/vim-expand-region'

" Language support {
Plugin 'vim-scripts/python.vim'
Plugin 'vim-scripts/pythoncomplete'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'python-rope/ropevim'
Plugin 'vim-scripts/scala.vim'
Plugin 'lepture/vim-jinja'
Plugin 'davidhalter/jedi-vim'
Plugin 'xolox/vim-misc'
Plugin 'vim-scripts/lua.vim'
Plugin 'pangloss/vim-javascript'
" Salt-Stack
Plugin 'saltstack/salt-vim'
" Docker
Plugin 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}
" }

" Snippets {
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" }

Plugin 'bling/vim-airline'

" Experiment {
" Collects metrics on project work
Plugin 'wakatime/vim-wakatime'
" Expand CSS syntax elements to full HTML
Plugin 'mattn/emmet-vim'
" Add gitignore files to VIM's wildignore
Plugin 'vim-scripts/gitignore'
" Zeal documentation support 
Plugin 'KabbAmine/zeavim.vim'
" srclib
Plugin 'lazywei/vim-sourcegraph'
" Auto formating python code
Plugin 'Chiel92/vim-autoformat'
" }

" Plugin 'Floobits/floobits-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
