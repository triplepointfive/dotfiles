" Init {{{
  set nocompatible              " Be iMproved, required
  filetype off                  " Required

  " Set the runtime path to include Vundle and initialize
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()

  Plugin 'VundleVim/Vundle.vim'

  " Keyword completion system, required for neco-ghc
  Plugin 'Valloric/YouCompleteMe'

  " Dependency for ghcmod
  Plugin 'Shougo/vimproc.vim'

  " Haskell
  Plugin 'eagletmt/ghcmod-vim'
  Plugin 'vim-scripts/haskell.vim'
  Plugin 'eagletmt/neco-ghc'

  " Syntax checker
  Plugin 'scrooloose/syntastic'

  " Git integration
  Plugin 'tpope/vim-fugitive'

  " Comments
  Plugin 'tpope/vim-commentary'

  " Color scheme
  Plugin 'vim-scripts/wombat256.vim'

  " Ruby
  Plugin 'thoughtbot/vim-rspec'
  Plugin 'vim-ruby/vim-ruby'
  Plugin 'tpope/vim-rails'
  Plugin 'tpope/vim-endwise' " Adds ends for blocks

  " Completer
  Plugin 'jiangmiao/auto-pairs'

  " Search
  Plugin 'mileszs/ack.vim'
  Plugin 'kien/ctrlp.vim'
  Plugin 'henrik/vim-indexed-search'

  " UI
  Plugin 'bling/vim-airline'
  Plugin 'scrooloose/nerdtree'
  Plugin 'Xuyuanp/nerdtree-git-plugin'

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
  " }}}

  " neco-ghc {{{
  setlocal omnifunc=necoghc#omnifunc
  let g:necoghc_enable_detailed_browse = 1
  let g:ycm_semantic_triggers = {'haskell' : ['.']}
  " }}}

  " ghcmod-vim {{{
  autocmd BufWritePost *.hs GhcModCheckAndLintAsync
  " }}}

  " Syntastic {{{
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 0
  let g:syntastic_check_on_wq = 0

  " Let ghc-mod do it's job
  let g:syntastic_haskell_checkers=['']

  let g:syntastic_ruby_checkers=['rubocop']
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
  nnoremap <leader>a :Ack<space>
  nnoremap <leader>* :Ack<CR>
  " }}}

  " CtrlP {{{
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip
  nnoremap <F3> :CtrlP<CR>
  let g:ctrlp_custom_ignore = {
        \ 'dir':  '\v[\/](.git|.hg|.svn|dist|.cabal-sandbox|.stack-work|bower_components|node_modules)$',
        \ 'file': '\v\.(exe|so|dll|png|jpg)$'
        \ }
  " }}}
  " vim-airline {{{
  set laststatus=2
  let g:airline_symbols = {}
  let g:airline_powerline_fonts = 1
  let g:airline_theme = 'powerlineish'

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

  " Fix backspace issues
  set backspace=indent,eol,start

  set ai "Auto indent
  set si "Smart indent
  set wrap "Wrap lines"

  " Colorscheme {{{
  colorscheme wombat256mod

  syntax enable
  set t_Co=256

  " Match wombat colors in nerd tree
  hi Directory guifg=#8ac6f2
  " }}}
" }}}

" Binding {{{
  " Fast quit
  nnoremap <leader>q :q<CR>

  " Treat long lines as break lines (useful when moving around in them)
  nnoremap j gj
  nnoremap k gk


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
  func! DeleteTrailingWS()
    if !&binary && &filetype != 'diff'
      exe "normal mz"
      %s/\s\+$//ge
      exe "normal `z"
    endif
  endfunc
  augroup whitespace
    autocmd!
    autocmd FileWritePre * :call DeleteTrailingWS()
    autocmd FileAppendPre * :call DeleteTrailingWS()
    autocmd FilterWritePre * :call DeleteTrailingWS()
    autocmd BufWritePre * :call DeleteTrailingWS()
  augroup END

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
    augroup END
    " }}}
  " }}}

  " GUI {{{
  if has('gui_running')
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
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
