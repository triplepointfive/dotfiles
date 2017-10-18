Plugin 'VundleVim/Vundle.vim'
Plugin 'Konfekt/FastFold'
Plugin 'skalnik/vim-vroom'
Plugin 'kchmck/vim-coffee-script'
" Plugin 'bronson/vim-trailing-whitespace'

" Keyword completion system, required for neco-ghc
Plugin 'Valloric/YouCompleteMe'
Plugin 'alvan/vim-closetag'

" Dependency for ghcmod
Plugin 'Shougo/vimproc.vim'

" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
" Plugin 'sheerun/vim-polyglot'
Plugin 'slim-template/vim-slim'

" Haskell
Plugin 'eagletmt/ghcmod-vim'
Plugin 'neovimhaskell/haskell-vim'
Plugin 'eagletmt/neco-ghc'

" Syntax checker
" Plugin 'scrooloose/syntastic'

" Git integration
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Comments
Plugin 'tpope/vim-commentary'
Plugin 'AndrewRadev/switch.vim'

" Color scheme
Plugin 'flazz/vim-colorschemes'
Plugin 'lifepillar/vim-solarized8'

" Ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise' " Adds ends for blocks

" Completer
Plugin 'jiangmiao/auto-pairs'

" Search
Plugin 'mileszs/ack.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'henrik/vim-indexed-search'

" UI
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'yggdroot/indentline'

" C++
Plugin 'octol/vim-cpp-enhanced-highlight'

" Go
Plugin 'fatih/vim-go'

" JS
Plugin 'isRuslan/vim-es6'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'leafgarland/typescript-vim'

Plugin 'w0rp/ale' " Async linter
Plugin 'mhinz/vim-sayonara' " Fast buffer killer
Plugin 'easymotion/vim-easymotion' " Fast motion
Plugin 'thaerkh/vim-workspace' " Workspace + autosave + trim spaces

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
