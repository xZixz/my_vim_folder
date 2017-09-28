filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
set number
execute pathogen#infect()
syntax on

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

set nocompatible
filetype plugin on
runtime macros/matchit.vim

xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch()
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

nnoremap <f5> :!ctags -R<CR>
autocmd BufWritePost * call system("ctags -R")
set autoindent
set vb
colorscheme elflord
set tags=./tags;

"Use ack-grep instead of grep
set grepprg=ack-grep
