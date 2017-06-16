set nocompatible
set ruler		" show the cursor position all the time
set lbr
set textwidth=160
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set incsearch
set ignorecase
set smartcase
set lazyredraw " for faster macros
set wildchar=<Tab> wildmenu wildmode=longest:full,full

" line numbers
set number
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
autocmd FocusLost * :set number
autocmd FocusGained * :set relativenumber

" Session storage
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

if has('mouse')
	set mouse=
endif

set breakindent

autocmd FileType xml setlocal foldmethod=syntax
let g:xml_syntax_folding=1
filetype plugin indent on

" Show the highlight group under the cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

let g:vim_markdown_folding_disabled=1

" breaks syntax highlighting
" set iskeyword-=_

au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=160 expandtab autoindent fileformat=unix
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"set fileencodings=iso-2022-jp,euc-jp,cp932,utf8,default,latin1

"let g:tagbar_autoclose=1
set t_Co=256
syntax enable
set background=dark
colorscheme molokai
" call togglebg#map("<F5>")
set colorcolumn=120
highlight ColorColumn ctermbg=8
hi Comment		ctermfg=144
hi Normal		ctermbg=none
hi NonText		ctermbg=none
hi TabLineFill	cterm=none ctermbg=242

"let mapleader="\<space>"

" Split stuff
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" paste without clobber
xnoremap p pgvy

" buffexplorer
noremap <script> <silent> <unique> <C-N> :BufExplorer<CR>

set listchars=trail:•,nbsp:␣,tab:› ,extends:∞,precedes:↪

:set paste

