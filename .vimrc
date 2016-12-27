" Init {{{
  set nocompatible              " Be iMproved, required
  filetype off                  " Required

  " Set the runtime path to include Vundle and initialize
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()

  Plugin 'VundleVim/Vundle.vim'
  Plugin 'Konfekt/FastFold'
  Plugin 'skalnik/vim-vroom'
  Plugin 'kchmck/vim-coffee-script'
  Plugin 'bronson/vim-trailing-whitespace'

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
  Plugin 'scrooloose/syntastic'

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
  Plugin 'thoughtbot/vim-rspec'
  Plugin 'vim-ruby/vim-ruby'
  Plugin 'tpope/vim-rails'
  Plugin 'tpope/vim-endwise' " Adds ends for blocks

  " Completer
  Plugin 'jiangmiao/auto-pairs'
  Plugin 'majutsushi/tagbar'

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

  " JS
  Plugin 'isRuslan/vim-es6'
  Plugin 'HerringtonDarkholme/yats.vim'
  Plugin 'Quramy/tsuquyomi'
  Plugin 'leafgarland/typescript-vim'

  Plugin 'ivalkeen/vim-simpledb'

  " Base {{{
   " Used for lot of stuff
    let mapleader = ','

    " Tabs
    set tabstop=2
    set shiftwidth=2
    set expandtab
  " }}}

  " All of your Plugins must be added before the following line
  call vundle#end()            " required
  filetype plugin indent on    " required
" }}}

" Plugins {{{

  " YouCompleteMe {{{
  " Disable checkers for cpp since it has conflicts with syntastic.
  let g:ycm_show_diagnostics_ui = 0
  " }}}

  " vim-closetag
  let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.jsx,*.erb"

  " Snippets {{{
  " Trigger configuration.
  let g:UltiSnipsExpandTrigger="<c-l>"
  let g:UltiSnipsJumpForwardTrigger="<c-j>"
  let g:UltiSnipsJumpBackwardTrigger="<c-k>"

  " If you want :UltiSnipsEdit to split your window.
  let g:UltiSnipsEditSplit="vertical"
  " }}}

  " neco-ghc {{{
  setlocal omnifunc=necoghc#omnifunc
  let g:necoghc_enable_detailed_browse = 1
  let g:ycm_semantic_triggers = { 'haskell' : ['.'], 'typescript' : ['.'] }
  " }}}

  " ghcmod-vim {{{
  autocmd BufWritePost *.hs GhcModCheckAndLintAsync
  " }}}

  " Syntastic {{{
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_cpp_checkers = ["gcc"]
  let g:syntastic_cpp_compiler = 'g++'
  let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 0
  let g:syntastic_check_on_wq = 0

  let g:syntastic_error_symbol = '❌'
  let g:syntastic_style_error_symbol = '⁉️'
  let g:syntastic_warning_symbol = '⚠️'
  let g:syntastic_style_warning_symbol = '💩'
  let g:tsuquyomi_disable_quickfix = 1

  highlight link SyntasticErrorSign SignColumn
  highlight link SyntasticWarningSign SignColumn
  highlight link SyntasticStyleErrorSign SignColumn
  highlight link SyntasticStyleWarningSign SignColumn

  " Indentline
  let g:indentLine_char = '│'
  let g:indentLine_leadingSpaceChar = '·'

  " Ignore annoying messages
  let g:syntastic_eruby_ruby_quiet_messages =
      \ {'regex': '\(possibly useless use of a variable in void context\|possibly useless use of \+\)'}

  " HTML5 checker
  let g:syntastic_html_tidy_exec = 'tidy5'
  " let g:syntastic_html_validator_api = 'http://localhost:8888/'

  " Let ghc-mod do it's job
  let g:syntastic_haskell_checkers=['']

  " JS
  let g:syntastic_javascript_checkers = ['eslint']
  let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint']
  " }}}

  " Fugitive {{{
  nnoremap <leader>gs :Gstatus<cr>
  nnoremap <leader>gc :Gcommit<space>
  nnoremap <leader>gd :Gdiff<cr>
  " }}}

  " Commentary {{{
  nmap <C-_> <Plug>CommentaryLine<CR>
  " }}}

  " Rspec {{{
  map <Leader>rt :call RunCurrentSpecFile()<CR>
  map <Leader>rs :call RunNearestSpec()<CR>
  " }}}

  " Rubycomplete {{{
  autocmd FileType ruby set omnifunc=rubycomplete#Complete
  let g:rubycomplete_rails=1
  let g:rubycomplete_classes_in_global=1
  let g:rubycomplete_buffer_loading=1
  let g:rubycomplete_include_object=1
  let g:rubycomplete_include_objectspace=1
  " }}}

  " Ack {{{
  nnoremap <leader>a :Ack!<space>
  nnoremap <leader>* :Ack!<CR>
  if executable('rg')
    let g:ackprg = 'rg --vimgrep'
  endif
  " }}}

  " CtrlP {{{
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip
  nnoremap <F3> :CtrlP<CR>
  let g:ctrlp_custom_ignore = {
        \ 'dir':  '\v[\/](.git|.hg|.svn|dist|.cabal-sandbox|.stack-work|bower_components|node_modules|coverage|vendor\/cache|platforms)$',
        \ 'file': '\v\.(exe|so|dll|png|jpg)$'
        \ }
  " if executable('ag')
  "   " Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
  "     set grepprg=ag\ --nogroup\ --nocolor
  "   " Use ag in CtrlP for listing files. Lightning fast, respects
  "   " .gitignore
  "   " and .agignore. Ignores hidden files by default.
  "   let g:ctrlp_user_command = 'ag %s -l --nocolor -f -g ""'
  " else
  "   "ctrl+p ignore files in .gitignore
  "   let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  " endif
  " }}}
  " vim-airline {{{
  set laststatus=2
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  let g:airline_powerline_fonts = 1
  let g:airline_theme = 'solarized' " powerlineish

  let g:airline#extensions#tabline#enabled = 1
  " }}}
  " Rspec {{{
  let g:rspec_command = "!rspec --no-color {spec}"
  " }}}
" }}}

" General {{{
  set number
  set autoread " supress warnings"

  " Use git, dude!
  set nobackup
  set noswapfile
  set incsearch " Search by typing
  set hlsearch " Highlight search matches
  nnoremap <C-n> :nohlsearch<CR>

  " Fix backspace issues
  set backspace=indent,eol,start

  set ai "Auto indent
  set si "Smart indent
  set wrap "Wrap lines"

  " Colorscheme {{{
  " colorscheme wombat256mod
  color solarized8_light_high

  syntax enable
  set t_Co=256

  " Match wombat colors in nerd tree
  hi Directory guifg=#8ac6f2
  " }}}
" }}}

" Binding {{{
  " Fast quit
  nnoremap <leader>q :bd<CR>

  " Treat long lines as break lines (useful when moving around in them)
  nnoremap j gj
  nnoremap k gk

  nmap <F8> :TagbarToggle<CR>

  " NERDTree {{{

  " Close nerdtree after a file is selected
  let NERDTreeQuitOnOpen = 1

  function! IsNERDTreeOpen()
      return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
  endfunction

  function! ToggleFindNerd()
    if IsNERDTreeOpen()
      exec ':NERDTreeToggle'
    else
      exec ':NERDTreeFind'
    endif
  endfunction

  " If nerd tree is closed, find current file, if open,
  " close it
  nmap <silent> <leader>f <ESC>:call ToggleFindNerd()<CR>
  nmap <silent> <leader>F <ESC>:NERDTreeToggle<CR>

  " }}}
" }}}

" Improvements {{{
  " Delete trailing white space on save
  augroup whitespace
    autocmd!
    autocmd FileWritePre * :FixWhitespace
    autocmd FileAppendPre * :FixWhitespace
    autocmd FilterWritePre * :FixWhitespace
    autocmd BufWritePre * :FixWhitespace
  augroup END

  " Beep
  set vb

  " Autosave files on focus lost.
  au FocusLost * :wa
  set autowrite

  " Filetypes {{{
    " Ruby {{{
    augroup FTRuby
      au!
      autocmd FileType eruby,yaml,ruby      setlocal ai et sta sw=2 sts=2
      autocmd BufNewFile,BufRead *.html.erb set filetype=eruby.html  " load html snippets along with erb
      autocmd FileType ruby,eruby           let g:rubycomplete_rails = 1
      autocmd FileType ruby,eruby           let g:rubycomplete_classes_in_global=1
      autocmd FileType ruby,eruby           let g:rubycomplete_buffer_loading= 1
      " Rspec
      " {{{
      autocmd BufRead *_spec.rb syn keyword rubyRspec describe context it specify it_should_behave_like before after setup subject its shared_examples_for shared_context expect let double mock aggregate_failures
      highlight def link rubyRspec Identifier
      " }}}

      " Minitest
      " {{{
      autocmd BufRead *_test.rb syn keyword rubyMinitest describe it before after subject let mock aggregate_failures
      highlight def link rubyMinitest Identifier
      " }}}
    augroup END
    " }}}
  " }}}

  " GUI {{{
  if has('gui_running')
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h18" "14
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=l
    set guioptions-=h
    set guioptions-=b
    set guioptions-=R
    set guioptions-=L
    set showtabline=2   " show tabs in gvim, not vim
    set guitablabel=%t  " show simple filname as tabname"

    " Make shift insert working, not dumping
    map  <silent>  <S-Insert>  "+p
    imap <silent>  <S-Insert>  <Esc>"+pa
  endif
  " }}}
" }}}

if has("gui_macvim")
  " Press Ctrl-Tab to switch between open tabs (like browser tabs) to
  " the right side. Ctrl-Shift-Tab goes the other way.
  noremap <C-Tab> :tabnext<CR>
  noremap <C-S-Tab> :tabprev<CR>

  " Switch to specific tab numbers with Command-number
  noremap <D-1> :tabn 1<CR>
  noremap <D-2> :tabn 2<CR>
  noremap <D-3> :tabn 3<CR>
  noremap <D-4> :tabn 4<CR>
  noremap <D-5> :tabn 5<CR>
  noremap <D-6> :tabn 6<CR>
  noremap <D-7> :tabn 7<CR>
  noremap <D-8> :tabn 8<CR>
  noremap <D-9> :tabn 9<CR>
  " Command-0 goes to the last tab
  noremap <D-0> :tablast<CR>
endif
