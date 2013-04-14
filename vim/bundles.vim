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

Bundle 'Lokaltog/vim-easymotion'
Bundle 'mattn/zencoding-vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-powerline'

" vim-snipmate and its dependencies
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/snipmate-snippets'
Bundle 'garbas/vim-snipmate'

Bundle 'vim-scripts/ZoomWin'
Bundle 'majutsushi/tagbar'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'vim-scripts/AutoTag'

Bundle 'hynek/vim-python-pep8-indent'
Bundle 'tpope/vim-cucumber'

Bundle 'klen/python-mode'
Bundle 'klen/vim-jsmode'

Bundle 'sjl/gundo.vim'
Bundle 'mileszs/ack.vim'

Bundle 'alfredodeza/pytest.vim'

Bundle 'vim-scripts/nginx.vim'

Bundle 'gerw/vim-HiLinkTrace'

filetype plugin indent on     " required!
filetype plugin on

