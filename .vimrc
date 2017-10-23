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
set wildmode=list:longest,longest

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

"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

"Color scheme
colorscheme railscasts

"Autocomplete setup
set complete=.,b,u,]
set completeopt=menu,preview
set omnifunc=syntaxcomplete#Complete

"Turn off warning when open another file without saving current file
set hidden

"Map NERDTREE keys
nmap <leader>ne :NERDTreeToggle<cr>
nmap <leader><Bar> :NERDTreeFind<cr>

"Set tag path
set tags=./tags

"Try to autocomplete rails keywords
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
