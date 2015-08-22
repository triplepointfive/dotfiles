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

" }}}

" General {{{
  filetype plugin indent on " Enables filetype plugin

" }}}
