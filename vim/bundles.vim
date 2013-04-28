set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" ====== Bundles ==========
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-eunuch'

Bundle 'vim-scripts/matchit.zip'

" Navigation {{{
Bundle 'Lokaltog/vim-easymotion'
Bundle 'kien/ctrlp.vim'
" }}}

" Visuals {{{
Bundle 'Lokaltog/vim-powerline'
Bundle 'flazz/vim-colorschemes'
" }}}

" vim-snipmate and its dependencies {{{
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/vim-snippets'
Bundle 'garbas/vim-snipmate'
" }}}

Bundle 'vim-scripts/ZoomWin'
Bundle 'majutsushi/tagbar'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'vim-scripts/AutoTag'

" Programming {{{
Bundle 'klen/python-mode'
Bundle 'mattn/zencoding-vim'
Bundle 'klen/vim-jsmode'
"
Bundle 'mileszs/ack.vim'

Bundle 'davidhalter/jedi-vim'
Bundle 'hynek/vim-python-pep8-indent'
Bundle 'alfredodeza/pytest.vim'
Bundle 'tpope/vim-cucumber'

Bundle 'saltstack/salt-vim'
Bundle 'vim-scripts/nginx.vim'
" }}}

Bundle 'airblade/vim-gitgutter'

filetype plugin indent on     " required!
filetype plugin on
