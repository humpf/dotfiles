"vim config file
filetype off

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" not compatible with vi 
set nocompatible

" show mode your in
set showmode

" set hidden
set hidden

"tabing

set smarttab 
set tabstop=8
set shiftwidth=4
set softtabstop=4
set modeline
set expandtab
set autoindent
set smartindent

"python
filetype on
filetype plugin on
syntax on
filetype indent on
filetype indent plugin on
set ofu=syntaxcomplete#Complete "omni compete
syntax enable
set foldmethod=indent
set foldlevel=99

" unrelated
set cpoptions+=$

" linenumbering
set nu
" toggle relative and absolute
function! g:ToggleNuMode()
    if(&rnu==1)
        set nu
    else
        set rnu
    endif
endfunc
" map this to Ctrl-l
nnoremap <C-l> :call g:ToggleNuMode()<cr>

" search
set incsearch " start search as you type
set hlsearch
set ignorecase
" pressing \ space makes no search highlight
nmap <silent> <leader><space> :nohlsearch<CR>

" make h,j,k,l move between visual lines
nnoremap j gj
nnoremap k gk

" make useful status line
set laststatus=2
set statusline+=%F\ %=%y\ %P 
set showcmd " show key pressed in normal mode

" color
set t_Co=256

colorscheme wombat256
set background=dark
" transparency
"let g:solarized_termtrans = 1
"colorscheme solarized
" hi Normal ctermbg=NONE

" tab completion
set wildmenu

" tex type latex
let g:tex_flavor='latex'
let g:Tex_SmartKeyQuote=0
set shellslash
set grepprg=grep\ -nH\ $*
