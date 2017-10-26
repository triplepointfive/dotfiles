syntax enable
set t_Co=256

" Be iMproved, required
set nocompatible

filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" Tabs
set tabstop=2
set shiftwidth=2
set expandtab

" Show list instead of just completing
set wildmenu

" Beep
set vb

" Autosave files on focus lost.
au FocusLost * :wa
set autowrite

" Show hybrid line numbers
set number relativenumber

" Supress warnings
set autoread

" Use git, dude!
set nobackup
set noswapfile

" Search by typing
set incsearch

" Highlight search matches
set hlsearch

" Fix backspace issues
set backspace=indent,eol,start

" Auto indent
set ai

" Smart indent
set si

" Wrap lines
set wrap
