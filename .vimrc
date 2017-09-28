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

" set nocompatible
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
" autocmd BufWritePost * call system("ctags -R")
set autoindent
set vb
set tags=./tags;

"Use ack-grep instead of grep
set grepprg=ack-grep
set hlsearch
set ignorecase
set wildmenu
set wildmode=list:longest,full

" mapping keys moving between windows
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-H> <C-W>h<C-W>_
map <C-L> <C-W>l<C-W>_
set wmh=0

" automatically open quickfix window
augroup myvimrc
autocmd!
autocmd QuickFixCmdPost [^l]* cwindow
autocmd QuickFixCmdPost l*    lwindow
augroup END

"solarize theme
syntax enable
set background=dark
colorscheme solarized

"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>
