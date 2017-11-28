" Preliminary setup
call plug#begin('~/.local/share/nvim/plugged')
Plug 'lervag/vimtex'
Plug 'tpope/vim-commentary'
Plug 'wikitopian/hardmode'
call plug#end()

" Save shift for commands
nnoremap ; :

" Basic formatting
set encoding=utf-8
set fileformat=unix
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Set default backspace behavior
set backspace=eol

" Conclude search
nnoremap <silent> <leader>n :nohl<CR>

" Break bad habits (e.g moving with arrows) with hard-mode
" Uncomment following line to boot in HardMode:
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
" Or toggle with \h
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

" Break bad habits: disable arrows
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Use jj instead of <ESC>
" and save automatically when leaving insert mode
inoremap jj <Esc>:w<CR>
inoremap <Esc> <NOP>

" Quit on explicit write to lose habit of :w all the time!
:cnoreabbrev w w<bar>q

" Persistent undo (file-by-file)
set undofile
set undodir=~/.vim/undodir

" Relative line numbers (e.g. for easy deleting)
set number relativenumber

" Split navigation
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>

"Highligh trailing whitespaces
set listchars=trail:·
set list

" Remove traling whitespaces with \w
nnoremap <silent> <leader>w :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<Bar>:unlet _s <Bar>:%s/\($\n\s*\)\+\%$//e<Bar><CR>

" Highligh max columns (PEP8)
set colorcolumn=79
highlight ColorColumn ctermbg=black guibg=black

" Code folding (and fold with <spacebar>)
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Tex compilation with (\ll,\lv,\lc)
let g:tex_flavor = 'latex'
