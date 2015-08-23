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

  " Base {{{
   " Used for lot of stuff
    let mapleader = ','

    " Tabs
    set tabstop=2
    set shiftwidth=2
    set expandtab
  " }}}
" }}}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

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
  " }}}

  " Fugitive {{{
  nnoremap <leader>gs :Gstatus<cr>
  nnoremap <leader>gc :Gcommit<space>
  nnoremap <leader>gd :Gdiff<cr>
  " }}}

  " Commentary {{{
  nmap <C-_> <Plug>CommentaryLine<CR>
  " }}}

" }}}

" General {{{
  filetype plugin indent on " Enables filetype plugin
  set number
" }}}

" Binding {{{
  " Fast quit
  nnoremap <leader>q :q<CR>

  " Treat long lines as break lines (useful when moving around in them)
  nnoremap j gj
  nnoremap k gk
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
" }}}
