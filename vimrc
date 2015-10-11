" Incarntion P. Lee personal vim configuration file.
" Create at: 2014-02-25

" Disable the compatible for vi
set nocompatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next 
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when reopening
" a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Show (partial) command in status line.
set showcmd		
" Show matching brackets.
set showmatch
" Do case insensitive matching
"set ignorecase		
" Do smart case matching
set smartcase		
" Incremental search
set incsearch
" Automatically save before commands like :next and :make
"set autowrite
" Hide buffers when they are abandoned
"set hidden

" show line number
set nu
" show a underline at current line
set cursorline
set cursorcolumn
" disable warning sound when bad command in vi
"set vb t_vb=
" show line status at right down
set ruler
" disable high light searching
"set nohls
" enable code fold
set foldenable
" specific the fold method
" zc fold
" zo unflod
" zC fold all
" zO unflod all
" zR unflod file
" [z back to begin of fold
" ]z back to end of fold
set foldmethod=indent
"set magic
" use 256 color in vim
set t_Co=256
set backspace=start
set laststatus=2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P

set hls

" do not generate .swp file
set noswapfile

" set columns=80

" disable new line
set nowrap
" set complement sytle
set completeopt=longest,menu
" set status color
highlight StatusLine ctermfg=196 cterm=bold
"highlight StatusLineNC ctermbg=164 ctermfg=196
" set fold color
highlight Folded ctermbg=239 ctermfg=154 cterm=bold
" set cursorcolumn color
highlight CursorColumn ctermbg=233

let Tlist_Use_Right_Window = 1

" trips
" under insert mode:
"   Ctrl-P back complement a word
"   Ctrl-N far complement a word
"   Ctrl-X-L complement a line
"   Ctrl-X-F complement a file
"   Ctrl-Y complement a word from upper line
"   Ctrl-E complement a word from next line
" Ctrl-r undo 'u'

