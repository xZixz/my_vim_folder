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
" set grepprg=ack-grep
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
" augroup myvimrc
" autocmd!
" autocmd QuickFixCmdPost [^l]* cwindow
" autocmd QuickFixCmdPost l*    lwindow
" augroup END

" remap leader key to space
let mapleader = "\<space>"


"Add simple highlight removal.
nmap <Leader>h :nohlsearch<cr>

"Color scheme
colorscheme dracula

"Autocomplete setup
set complete=.,b,u,]
set completeopt=menu,preview
" set omnifunc=syntaxcomplete#Complete

"Turn off warning when open another file without saving current file
set hidden

"Map NERDTREE keys
nmap <Leader>ne :NERDTreeToggle<cr>
nmap <Leader><Bar> :NERDTreeFind<cr>

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

" The Silver Searcher
if executable('ag')
" Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

nnoremap \ :Ag<SPACE>
set pastetoggle=<F1>

" map to ez switch to last open file
:nnoremap <Leader><Tab> :e#<CR>

" map key to select last pasted
nnoremap gp `[v`]

" disable youcompleteme
let g:loaded_youcompleteme = 1

" set cursorcolumn
set cursorcolumn

" set delay of diff markers
set updatetime=250

" Easymotion
map <Leader>f <Plug>(easymotion-bd-f)
map <Leader>s <Plug>(easymotion-s2)
