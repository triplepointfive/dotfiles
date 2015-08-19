" Init {{{

  set nocompatible
  filetype off

  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#rc()

  Plugin 'gmarik/vundle'
  Plugin 'scrooloose/syntastic'
  Plugin 'neovimhaskell/haskell-vim'
  Plugin 'enomsg/vim-haskellConcealPlus'
  Plugin 'Twinside/vim-haskellFold'
  Plugin 'vim-scripts/wombat256.vim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'Xuyuanp/nerdtree-git-plugin'
  Plugin 'tpope/vim-fugitive'
  Plugin 'bling/vim-airline'
  Plugin 'tpope/vim-commentary'
  Plugin 'Shougo/vimproc.vim'
  Plugin 'xolox/vim-misc'
  Plugin 'szw/vim-tags'
  Plugin 'mileszs/ack.vim'
  Plugin 'eagletmt/ghcmod-vim'
  Plugin 'Shougo/neocomplcache.vim'
  Plugin 'eagletmt/neco-ghc'
  Plugin 'Twinside/vim-hoogle'
  Plugin 'majutsushi/tagbar'
  Plugin 'kien/ctrlp.vim'
  Plugin 'vim-scripts/Superior-Haskell-Interaction-Mode-SHIM'

  call vundle#end()
  filetype plugin indent on

" }}}

" General {{{
  let $PATH = $PATH . ':' . expand("~/.cabal/bin")

  " Tabs
  set tabstop=2
  set shiftwidth=2
  set expandtab

  " Use indentation for folds
  set foldmethod=indent
  set foldnestmax=5
  set foldlevelstart=99
  set foldcolumn=0

  set autoread
  
  augroup vimrcFold
    " fold vimrc itself by categories
    autocmd!
    autocmd FileType vim set foldmethod=marker
    autocmd FileType vim set foldlevel=0
  augroup END

  " Set 7 lines to the cursor
  set so=7

  " Cursor position
  set ruler
  set number

  " Cursor highlight
  :hi CursorLine   cterm=NONE ctermbg=8
  :hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white
  :nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
  set cursorline

  " Use terminal colors
  set t_Co=256

  " Delete trailing white space on save
  func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
  endfunc

  augroup whitespace
    autocmd!
    autocmd BufWrite *.hs :call DeleteTrailingWS()
  augroup END

  " Use stylish haskell instead of par for haskell buffers
  autocmd FileType haskell let &formatprg="stylish-haskell"

" }}}

" Colors and Fonts {{{{

  try
    colorscheme wombat256mod
  catch
  endtry

  " Enable syntax highlighting
  syntax enable

  " Adjust signscolumn and syntastic to match wombat
  hi! link SignColumn LineNr
  hi! link SyntasticErrorSign ErrorMsg
  hi! link SyntasticWarningSign WarningMsg

  " Use same color behind concealed unicode characters
  hi clear Conceal

  " Highlight long lines
  match ErrorMsg '\%>80v.\+'

  " Airline {{{
  set laststatus=2
  let g:airline#extensions#tabline#enabled = 1
  " }}}

" }}}

" NERDTree {{{

nnoremap <F1> :NERDTreeToggle<CR>
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrows=1
let g:NERTreeHighlightCursorLine=1

" }}}

" Haskell-Vim {{{

  " Highlightings
  let g:haskell_enable_quantification = 1 " to enable highlighting of forall
  let g:haskell_enable_recursivedo = 1 " to enable highlighting of mdo and rec
  let g:haskell_enable_arrowsyntax = 1 " to enable highlighting of proc
  let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of pattern
  let g:haskell_enable_typeroles = 1 " to enable highlighting of type roles
  let g:haskell_enable_static_pointers = 1 " to enable highlighting of static

  " Indentations

  let g:haskell_indent_if    = 2
  let g:haskell_indent_case  = 2
  let g:haskell_indent_let   = 2
  let g:haskell_indent_where = 2
  let g:haskell_indent_do    = 2
  let g:haskell_indent_in    = 2

  " Cabal
  let g:cabal_indent_section = 2
  let $PATH = $PATH . ':' . expand("~/.cabal/bin")


  " Pretty unicode haskell symbols
  let g:haskell_conceal_wide = 1
  let g:haskell_conceal_enumerations = 1
  let hscoptions="𝐒𝐓𝐄𝐌xRtB𝔻"

  " Tags
  set tags=tags;/,codex.tags;/


  " Generate haskell tags with codex and hscope
  map <leader>tg :!codex update --force<CR>:call system("git hscope -X TemplateHaskell")<CR><CR>:call LoadHscope()<CR>
  
  map <leader>tt :TagbarToggle<CR>
  set csto=1 " search codex tags first

  " SHIM
  autocmd FileType haskell nmap <C-c><C-l> :GhciRange<CR>
  autocmd FileType haskell vmap <C-c><C-l> :GhciRange<CR>
  autocmd FileType haskell nmap <C-c><C-f> :GhciFile<CR>
  autocmd FileType haskell nmap <C-c><C-r> :GhciReload<CR>
" }}}

" Syntastic {{{

  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_shell="zsh"
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 0
  let g:syntastic_check_on_wq = 0

" }}}

" Ctrlp {{{
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
  nnoremap <F3> :CtrlP<CR>
  nnoremap <F4> :CtrlPBuffer<CR>
  nnoremap <F2> :CtrlPDir<CR>
  let g:ctrlp_custom_ignore = {
        \ 'dir':  '\v[\/]\.(git|hg|svn|cabal-sandbox|stack-work)$',
        \ 'file': '\v\.(exe|so|dll|png|jpg|o|hi|dyn_hi|dyn_o)$'
        \ }
" }}}

" Neocomplcache {{{

  " Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
  " Disable AutoComplPop.
  let g:acp_enableAtStartup = 0
  " Use neocomplcache.
  let g:neocomplcache_enable_at_startup = 1
  " Use smartcase.
  let g:neocomplcache_enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplcache_min_syntax_length = 3
  let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" }}}

" Keys {{{

  let mapleader = ","
  let g:mapleader = ","
  set backspace=indent,eol,start

  " Remove search highlights.
  nmap <leader><space> :noh<cr>

  " Toggle comments
  nmap <C-_> <Plug>CommentaryLine<CR>

  nmap <F8> :TagbarToggle<CR>

  " Treat long lines as break lines (useful when moving around in them)
  nnoremap j gj
  nnoremap k gk

  " start ack search, (using ACK tool, like grep but for source code)
  nnoremap <leader>a :Ack<space>

  nnoremap <leader>q :q<CR>
  " NerdTree Tabs {{{
    nnoremap <c-F1> :NERDTreeTabsToggle<CR>
    let g:nerdtree_tabs_open_on_gui_startup=0
  " }}}

  " Fugitive {{{
    nnoremap <leader>gs :Gstatus<cr>
    nnoremap <leader>gc :Gcommit<space>
    nnoremap <leader>gd :Gdiff<cr>
  " }}}
" }}}

" GUI {{{
if has('gui_running')
  set guifont=Dejavu\ Sans\ Mono\ 9
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=l
  set guioptions-=h
  set guioptions-=b
  set guioptions-=R
  set guioptions-=L
  set showtabline=2   " show tabs in gvim, not vim
  set guitablabel=%t  " show simple filname as tabname

  " Bindings
  " {{{
  nnoremap <c-o> :browse tabnew :pwd<CR>
  nnoremap <C-M-s> :browse saveas :pwd<CR>
  nnoremap <C-M-f> :set guifont=*<CR>

  " Map Alt-# to switch tabs
  map  <M-0> 0gt
  imap <M-0> <Esc>0gt
  map  <M-1> 1gt
  imap <M-1> <Esc>1gt
  map  <M-2> 2gt
  imap <M-2> <Esc>2gt
  map  <M-3> 3gt
  imap <M-3> <Esc>3gt
  map  <M-4> 4gt
  imap <M-4> <Esc>4gt
  map  <M-5> 5gt
  imap <M-5> <Esc>5gt
  map  <M-6> 6gt
  imap <M-6> <Esc>6gt
  map  <M-7> 7gt
  imap <M-7> <Esc>7gt
  map  <M-8> 8gt
  imap <M-8> <Esc>8gt
  map  <M-9> 9gt
  imap <M-9> <Esc>9gt
  " }}}
endif
" }}}
