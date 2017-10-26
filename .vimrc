source $HOME/.vim/init.vimrc
source $HOME/.vim/general.vimrc
source $HOME/.vim/plugins.vimrc
source $HOME/.vim/keys.vimrc
source $HOME/.vim/plugins_config.vimrc

" Delete trailing white space on save
augroup whitespace
  autocmd!
  autocmd FileWritePre * :FixWhitespace
  autocmd FileAppendPre * :FixWhitespace
  autocmd FilterWritePre * :FixWhitespace
  autocmd BufWritePre * :FixWhitespace
augroup END

" Colorscheme
color solarized8_light_high

" Plugins {{{
  " numbers.vim
  let g:numbers_exclude = ['nerdtree']


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

  " Indentline
  let g:indentLine_char = '│'
  " let g:indentLine_leadingSpaceChar = '·'

  " Rubycomplete {{{
  autocmd FileType ruby set omnifunc=rubycomplete#Complete
  let g:rubycomplete_rails=1
  let g:rubycomplete_classes_in_global=1
  let g:rubycomplete_buffer_loading=1
  let g:rubycomplete_include_object=1
  let g:rubycomplete_include_objectspace=1
  " }}}

  " Ack {{{
  if executable('rg')
    let g:ackprg = 'rg --vimgrep'
  endif
  " }}}

  " CtrlP {{{
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip
  let g:ctrlp_custom_ignore = {
        \ 'dir':  '\v[\/](.git|.hg|.svn|dist|.cabal-sandbox|.stack-work|bower_components|node_modules|coverage|vendor\/cache|platforms)$',
        \ 'file': '\v\.(exe|so|dll|png|jpg)$'
        \ }
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
" }}}

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

  " If nerd tree is closed, find current file, if open, close it
    nmap <silent> <leader>f <ESC>:call ToggleFindNerd()<CR>
    nmap <silent> <leader>F <ESC>:NERDTreeToggle<CR>
  " }}}
" }}}

" Improvements {{{
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
