" Used for lot of stuff
let mapleader = ','

" Fast quit
nnoremap <leader>q :Sayonara<CR>

" Hide search matches hightlight
nnoremap <C-n> :nohlsearch<CR>

" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk

" Commentary {{{
  nmap <C-_> <Plug>CommentaryLine<CR>
" }}}

if has("gui_macvim")
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

" Ack {{{
  nnoremap <leader>a :Ack!<space>
  nnoremap <leader>* :Ack!<CR>
" }}}
